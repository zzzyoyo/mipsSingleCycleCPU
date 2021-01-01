`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 12:39:42
// Design Name: 
// Module Name: mips
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


module mips(
input   clk, reset
    );
    wire    [31:0]  pc, instr, readData, writeData, dataAddr;
    wire            memWrite;
    
    cpu     CPU(.clk(clk), .reset(reset), .pc(pc), .instr(instr), .dataAddr(dataAddr), .writeData(writeData), .memWrite(memWrite), .readData(readData));
    
    imem IMEM (
      .a(pc[7:2]),      // input wire [5 : 0] a
      .spo(instr)  // output wire [31 : 0] spo
    );
    
    dmem DMEM (
      .address(dataAddr),      
      .writeData(writeData),      
      .clk(clk),  // input wire clk
      .we(memWrite),    // input wire we
      .readData(readData)  
    );
endmodule
