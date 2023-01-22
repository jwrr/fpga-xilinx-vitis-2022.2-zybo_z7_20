# fpga-xilinx-vitis-2022.2-zybo_z7_20
Vitis 2022.2 platform for Zybo Z7-20.

Create New Project
------------------



```
vitis_start
```

```
export PROJECT_WORKSPACE=$PWD
export PROJECT_BOARD_NAME=zybo_z7_20
export PROJECT_VITIS_VERSION=2022_2
export PROJECT_NAME=${PROJECT_BOARD_NAME}_base_$PROJECT_VITIS_VERSION
export PROJECT_HARDWARE=$PROJECT_WORKSPACE/$PROJECT_BOARD_NAME/hardware
export PROJECT_VIVADO=$PROJECT_HARDWARE/${PROJECT_NAME}-vivado
export PROJECT_XSA=$PROJECT_VIVADO/${PROJECT_NAME}_wrapper.xsa
export PROJECT_SOFTWARE=$PROJECT_WORKSPACE/$PROJECT_BOARD_NAME/software
export PROJECT_LINUX_FILES=$PROJECT_SOFTWARE/linux_files
export PROJECT_PETALINUX=$PROJECT_SOFTWARE/${PROJECT_NAME}-petalinux
export PROJECT_UDEMY_RESOURCES=~/Downloads/udemy
env |grep 'PROJECT_.*='
```

Make the Hardware in Vivado
---------------------------

```
mkdir -p $PROJECT_HARDWARE
cd $PROJECT_HARDWARE
vivado &
```

* Create Project named zybo_z7_20_2022_2-vivado
  * Select RTL Project, Do not specify sources, and extensible Vitis Platform
  * Refresh the list of boards and select and download Zybo Z7-20

* Create Block Design named zybo_z7_20_2022_2
  * Add IP ZYNQ7 Processing System
    * Run Block Automation
    * PS-PL Configuration -> AXI Non-Secure Enablement -> GP Master AXI Interface
      * Unselect M AXI GP0 interface
    * Interrupts -> Fabric interrupts -> PL-PS interrupt Ports
      * Select IRQ_F2P[15:0]
  * Add Clock Wizard
    * In Output Clocks configure Clk_out1,2,3 to beh 100/200/300MHz
    * Set the Reset to Active Low
    * Connect reset and clk_in1 to the corresponding ZYNQ7 output ports.
  * Add three Processor System Resets (one for each clock)
    * Connect slowest_sync_clk, ext_reset_in and dcm_locked.
  * Add Concat and connect dout to ZYNQ7 IRQ_f2P input
    * Change number of ports from 2 to 1.
  * Regenerate Layout
* Platform Setup (Configure AXI, Clock and Interrupt ports)
  * Window -> Platform Setup
  * AXI Port
    * Enable all AXI ports except for S_AXI_ACP
    * Set the SP Ta for the S_AXI_HPx ports to HP0, HP1, HP2 and HP3
  * Clock
    * Enable the 3 clock_outx ports. Change ID to 0, 1, 2. make clock_out1 the default.
  * Interrupt
    * Enable In1 to In7.
  * Platform Name
    * Change Board from 'lib' to 'zybo-z7-20'
    * Change Vendor to 'Digilent'
* Generate Output Products
  * Sources -> Design Soruces -> right click zybo-z7-2-=base-2022_2 -> Generate Output Products
    * Don't change defaults and click 'Generate'
    * Ignore 'Out-of-context' module runs warning
* Create HDL Wrapper
  * Sources -> Design Soruces -> right click zybo-z7-2-=base-2022_2 -> Create HDL Wrapper...
* Generate Bitstream
  * Flow Navigator -> Program and Debug -> Generate Bitstream
    * Use default settings, monitor process in 'Design Runs' tab
* Export Design
  * File -> Export -> Export Platform...
  * For Platform Type select 'Hardware and emulation'
* View resulting xsa file

```
pwd
ls -l $PROJECT_XSA
## -rw-rw-r-- 1 jwrr jwrr 2016635 Jan 22 01:26 zybo_z7_20/hardware/zybo_z7_20_2022_2-vivado/zybo_z7_20_base_2022_2_wrapper.xsa
```

Make the Software Environment
-----------------------------

```
echo
echo ==================================================
echo CREATE PETALINUX PROJECT ${PROJECT_NAME}-petalinux
mkdir -p $PROJECT_LINUX_FILES
cd $PROJECT_LINUX_FILES
mkdir boot image
cd $PROJECT_SOFTWARE
pwd
echo petalinux-create -t project --template zynq -n ${PROJECT_NAME}-petalinux
petalinux-create -t project --template zynq -n ${PROJECT_NAME}-petalinux

echo 
echo ==================================================
echo CONFIGURE PETALINUX PROJECT USING $PROJECT_XSA
cd $PROJECT_PETALINUX
pwd
echo petalinux-config --get-hw-description=$PROJECT_VIVADO
petalinux-config --get-hw-description=$PROJECT_VIVADO
## misc/config System Configuration window
   ## No changes. Just exit.

echo 
echo ==================================================
echo CONFIGURE PETALINUX KERNEL - change size in megabytes from 16 to 1024
cd $PROJECT_PETALINUX
pwd
petalinux-config -c kernel
## Linux/arm Kernel Configuration menu
   ## Library Routines -> Size in Mega Bytes: Increase from 16 to 1024

echo 
echo ==================================================
echo EDIT PROJECT-SPEC FILES - copy from $PROJECT_UDEMY_RESOURCES
cd $PROJECT_PETALINUX
pwd
echo $PROJECT_UDEMY_RESOURCES
ls $PROJECT_UDEMY_RESOURCES
cat ./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cat $PROJECT_UDEMY_RESOURCES/system-user.dtsi
cat ./project-spec/meta-user/conf/user-rootfsconfig
cat $PROJECT_UDEMY_RESOURCES/user-rootfsconfig

cp $PROJECT_UDEMY_RESOURCES/system-user.dtsi ./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cp $PROJECT_UDEMY_RESOURCES/user-rootfsconfig ./project-spec/meta-user/conf/user-rootfsconfig
cat ./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cat ./project-spec/meta-user/conf/user-rootfsconfig

echo 
echo ==================================================
echo CONFIGURE ROOTFS - select all user packages
cd $PROJECT_PETALINUX
pwd
echo petalinux-config -c rootfs
petalinux-config -c rootfs
## user packages menu
   ## Select all packages

echo 
echo ==================================================
echo BUILD PETALINUX - this takes a while
cd $PROJECT_PETALINUX
pwd
echo petalinux-build
petalinux-build

sudo gparted
## New size(MIB): 3950, fat32, BOOT

echo 
echo ==================================================
echo PACKAGE PETALINUX
cd $PROJECT_PETALINUX
pwd

# petalinux-package --boot --format BIN --fsbl zynq_fsbl.elf --u-boot u-boot.elf --fpga system.bit --force
# cp BOOT.BIN boot.scr image.ub /media/jwrr/BOOT/
```

eject SD-Card


