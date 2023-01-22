# fpga-xilinx-vitis-2022.2-zybo_z7_20
Vitis 2022.2 platform for Zybo Z7-20.

Create New Project
==================



```
export BOARD_NAME=zybo_z7_20
export VITIS_VERSION=2022_2
export PROJECT_NAME=${BOARD_NAME}_base_$VITIS_VERSION

mkdir -p ~/vitis/workspace/$BOARD_NAME/hardware
cd ~/vitis/workspace/$BOARD_NAME/hardware
vivado &
```

In Vivado

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


