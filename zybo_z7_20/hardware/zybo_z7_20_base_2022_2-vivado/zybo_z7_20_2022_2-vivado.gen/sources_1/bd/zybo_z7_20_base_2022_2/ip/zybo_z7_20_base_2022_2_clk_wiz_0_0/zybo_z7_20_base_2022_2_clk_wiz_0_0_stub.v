// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Jan 22 00:59:07 2023
// Host        : 500w running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/jwrr/vitis/fpga-xilinx-vitis-2022.2-zybo_z7_20/zybo_z7_20/hardware/zybo_z7_20_2022_2-vivado/zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_clk_wiz_0_0/zybo_z7_20_base_2022_2_clk_wiz_0_0_stub.v
// Design      : zybo_z7_20_base_2022_2_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module zybo_z7_20_base_2022_2_clk_wiz_0_0(clk_out1, clk_out2, clk_out3, resetn, locked, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_out3,resetn,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  input resetn;
  output locked;
  input clk_in1;
endmodule
