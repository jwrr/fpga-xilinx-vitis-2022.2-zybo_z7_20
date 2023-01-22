# fpga-xilinx-vitis-2022.2-zybo_z7_20
Vitis 2022.2 platform for Zybo Z7-20.

Create New Project
------------------



```
export BOARD_NAME=zybo_z7_20
export VITIS_VERSION=2022_2
export PROJECT_NAME=${BOARD_NAME}_base_$VITIS_VERSION
```

Make the Hardware in Vivado
---------------------------

```
mkdir -p ~/vitis/fpga-xilinx-vitis-2022.2-zybo_z7_20/$BOARD_NAME/hardware
cd ~/vitis/workspace/$BOARD_NAME/hardware
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
ls -l zybo_z7_20/hardware/zybo_z7_20_2022_2-vivado/*xsa
## -rw-rw-r-- 1 jwrr jwrr 2016635 Jan 22 01:26 zybo_z7_20/hardware/zybo_z7_20_2022_2-vivado/zybo_z7_20_base_2022_2_wrapper.xsa
```


```
mkdir -p ~/vitis/workspace/$BOARD_NAME/software/linux_files
cd ~/vitis/workspace/$BOARD_NAME/software/linux_files
mkdir boot image
cd ~/vitis/workspace/$BOARD_NAME/software
petalinux-create -t project --template zynq -n ${PROJECT_NAME}-petalinux

petalinux-config --get-hw-description=../../hardware/${PROJECT_NAME}-vivado/
## misc/config System Configuration window
   ## No changes. Just exit.

petalinux-config -c kernel
## Linux/arm Kernel Configuration menu
   ## Library Routines -> Size in Mega Bytes: Increase from 16 to 1024

led ./project-spec/meta-user/recipes-bsp/devide-tree/fukes/system-user.dtsi
led ./project-spec/meta-user/conf/user-rootfsconfig

petalinux-config -c rootfs
## user packages menu
   ## Select all packages

petalinux-build

sudo gparted
## New size(MIB): 3950, fat32, BOOT

```


