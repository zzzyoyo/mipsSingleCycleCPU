`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:34:17
// Design Name: 
// Module Name: mips_tb
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


module mips_tb();
    reg clk, reset;
    mips MIPS(.clk(clk), .reset(reset));
    initial begin
        clk = 0;
        reset = 1;
        #40;
        reset = 0;
    end
    
    always #10 clk = ~clk;
endmodule
