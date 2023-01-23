# fpga-xilinx-vitis-2022.2-zybo_z7_20
Vitis 2022.2 platform for Zybo Z7-20.

Create New Project
------------------



```
vitis_start
```

Init Project Variables
----------------------

```
echo source project_init.bash
source project_init.bash
```

Make the Hardware in Vivado
---------------------------

```
mkdir -p $PROJECT_HARDWARE_DIR
cd $PROJECT_HARDWARE_DIR
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
ls -l $PROJECT_XSA_FILE
## -rw-rw-r-- 1 jwrr jwrr 2016635 Jan 22 01:26 zybo_z7_20/hardware/zybo_z7_20_2022_2-vivado/zybo_z7_20_base_2022_2_wrapper.xsa
```

Make the Software Environment
-----------------------------

```
echo
echo ==================================================
echo CREATE PETALINUX PROJECT ${PROJECT_NAME}-petalinux
mkdir -p $PROJECT_LINUX_FILES_DIR
cd $PROJECT_LINUX_FILES_DIR
mkdir boot image
cd $PROJECT_SOFTWARE_DIR
pwd
echo petalinux-create -t project --template zynq -n ${PROJECT_NAME}-petalinux
petalinux-create -t project --template zynq -n ${PROJECT_NAME}-petalinux

echo
echo ==================================================
echo CONFIGURE PETALINUX PROJECT USING $PROJECT_XSA_FILE
cd $PROJECT_PETALINUX_DIR
pwd
echo petalinux-config --get-hw-description=$PROJECT_VIVADO_DIR
petalinux-config --get-hw-description=$PROJECT_VIVADO_DIR
## misc/config System Configuration window
   ## No changes. Just exit.

echo
echo ==================================================
echo CONFIGURE PETALINUX KERNEL - change size in megabytes from 16 to 1024
cd $PROJECT_PETALINUX_DIR
pwd
petalinux-config -c kernel
## Linux/arm Kernel Configuration menu
   ## Library Routines -> Size in Mega Bytes: Increase from 16 to 1024

echo
echo ==================================================
echo EDIT PROJECT-SPEC FILES - copy from $PROJECT_UDEMY_RESOURCES_DIR
cd $PROJECT_PETALINUX_DIR
pwd
echo $PROJECT_UDEMY_RESOURCES_DIR
ls $PROJECT_UDEMY_RESOURCES_DIR
cat ./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cat $PROJECT_UDEMY_RESOURCES_DIR/system-user.dtsi
cat ./project-spec/meta-user/conf/user-rootfsconfig
cat $PROJECT_UDEMY_RESOURCES_DIR/user-rootfsconfig

cp $PROJECT_UDEMY_RESOURCES_DIR/system-user.dtsi ./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cp $PROJECT_UDEMY_RESOURCES_DIR/user-rootfsconfig ./project-spec/meta-user/conf/user-rootfsconfig
cat ./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cat ./project-spec/meta-user/conf/user-rootfsconfig

echo
echo ==================================================
echo CONFIGURE ROOTFS - select all user packages
cd $PROJECT_PETALINUX_DIR
pwd
echo petalinux-config -c rootfs
petalinux-config -c rootfs
## user packages menu
   ## Select all packages

echo
echo ==================================================
echo BUILD PETALINUX - results will be copied to /tftpboot
cd $PROJECT_PETALINUX_DIR
pwd
echo petalinux-build
[ -d /tftpboot ] || sudo mkdir -m 777 /tftpboot
petalinux-build

echo
echo ==================================================
echo PACKAGE PETALINUX - create BOOT.BIN and zynq_fsbl.elf in $PROJECT_BUILD_DIR
cd $PROJECT_PETALINUX_DIR
pwd
echo cp $PROJECT_BUILD_DIR/zynq_fsbl.elf .
cp $PROJECT_BUILD_DIR/zynq_fsbl.elf .
echo cp $PROJECT_BIT_FILE system.bit
cp $PROJECT_BIT_FILE system.bit
echo petalinux-package --boot --format BIN --fsbl zynq_fsbl.elf --u-boot $PROJECT_BUILD_DIR/u-boot.elf --fpga system.bit --force
petalinux-package --boot --format BIN --fsbl zynq_fsbl.elf --u-boot $PROJECT_BUILD_DIR/u-boot.elf --fpga system.bit --force
```

Copy files to SD Card
---------------------

Insert SD-Card

```
echo
echo ==================================================
echo FORMAT SD-CARD WITH GPARTED - Set size=3950MIB, fat32, BOOT
sudo gparted

cd /tftpboot
cp BOOT.BIN boot.scr image.ub /media/jwrr/BOOT/
ls /media/jwrr/BOOT/
```

Eject SD-Card 

Try using the ZYBO Z7-20
------------------------

Insert SD-Card into MicroSD connector on the underside of the board, and
connect the microUSB (also on the underside of the board) to the Linux PC.


Bad news... Ubuntu 20.04 doesn't see ZYBO.

```
lsusb
```


The [Digilent Installation Guide](https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-vitis)
mentions that USB drivers need to be installed manually.

```
cd $XILINX_VIVADO/data/xicom/cable_drivers/lin64/install_script/install_drivers/
sudo ./install_drivers
groups | grep dialout || sudo adduser $USER dialout
```






