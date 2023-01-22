-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Sun Jan 22 00:59:07 2023
-- Host        : 500w running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/jwrr/vitis/fpga-xilinx-vitis-2022.2-zybo_z7_20/zybo_z7_20/hardware/zybo_z7_20_2022_2-vivado/zybo_z7_20_2022_2-vivado.gen/sources_1/bd/zybo_z7_20_base_2022_2/ip/zybo_z7_20_base_2022_2_clk_wiz_0_0/zybo_z7_20_base_2022_2_clk_wiz_0_0_stub.vhdl
-- Design      : zybo_z7_20_base_2022_2_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zybo_z7_20_base_2022_2_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end zybo_z7_20_base_2022_2_clk_wiz_0_0;

architecture stub of zybo_z7_20_base_2022_2_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,clk_out3,resetn,locked,clk_in1";
begin
end;
