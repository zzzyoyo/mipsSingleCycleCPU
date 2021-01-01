`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 14:47:20
// Design Name: 
// Module Name: imem_tb
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


module imem_tb();
    reg     [5:0]   address;
    wire    [31:0]  instr;
    imem IMEM (
      .a(address),      // input wire [5 : 0] a
      .spo(instr)  // output wire [31 : 0] spo
    );
    initial begin
        address = 0;
        #10;
        address = 3;
        #10;
        address = 6;
        #10;
        address = 20;
    end
endmodule
