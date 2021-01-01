`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 12:23:02
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu(
input           clk, reset,
output  [31:0]  pc,
input   [31:0]  instr,
output  [31:0]  dataAddr, writeData,
output          memWrite,
input   [31:0]  readData
    );
    wire    [2:0]   aluControl;
    controller  c(.op(instr[31:26]), .func(instr[5:0]),
    .zero(zero), .memToReg(memToReg), .memWrite(memWrite),
    .pcSrc(pcSrc), .aluSrc(aluSrc), .regDst(regDst), .regWrite(regWrite),
    .jump(jump), .aluControl(aluControl));
    
    datapath    dp(.clk(clk), .reset(reset), .memToReg(memToReg), .pcSrc(pcSrc), .aluSrc(aluSrc), 
    .regDst(regDst), .regWrite(regWrite),.jump(jump), .aluControl(aluControl),
    .zero(zero), .pc(pc), .instr(instr), .aluout(dataAddr), .writeData(writeData), .readData(readData));
endmodule
