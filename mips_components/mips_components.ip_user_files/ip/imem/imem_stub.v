// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Dec 25 14:46:26 2020
// Host        : DESKTOP-6BFJF54 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/projects/vivado_project/mips_components/mips_components.srcs/sources_1/ip/imem/imem_stub.v
// Design      : imem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.1" *)
module imem(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[5:0],spo[31:0]" */;
  input [5:0]a;
  output [31:0]spo;
endmodule
