vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_13
vlib activehdl/processing_system7_vip_v1_0_15
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/xlconcat_v2_1_4

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 activehdl/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 activehdl/processing_system7_vip_v1_0_15
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap xlconcat_v2_1_4 activehdl/xlconcat_v2_1_4

vlog -work xilinx_vip  -sv2k12 "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15  -sv2k12 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_processing_system7_0_0/sim/zybo_z7_20_base_2022_2_processing_system7_0_0.v" \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_clk_wiz_0_0/zybo_z7_20_base_2022_2_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_clk_wiz_0_0/zybo_z7_20_base_2022_2_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_proc_sys_reset_0_0/sim/zybo_z7_20_base_2022_2_proc_sys_reset_0_0.vhd" \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_proc_sys_reset_0_1/sim/zybo_z7_20_base_2022_2_proc_sys_reset_0_1.vhd" \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_proc_sys_reset_0_2/sim/zybo_z7_20_base_2022_2_proc_sys_reset_0_2.vhd" \

vlog -work xlconcat_v2_1_4  -v2k5 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ec67/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/ee60/hdl" "+incdir+../../../../zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ipshared/7698" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_xlconcat_0_0/sim/zybo_z7_20_base_2022_2_xlconcat_0_0.v" \
"../../../bd/zybo_z7_20_base_2022_2/sim/zybo_z7_20_base_2022_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

