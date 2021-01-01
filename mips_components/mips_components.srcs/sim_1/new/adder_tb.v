`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 12:12:04
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
    reg   [31:0] a, b;
    wire  [31:0] y ;
    adder Adder(.a(a), .b(b), .y(y));
    initial begin
        a = 4;
        b = 9;
        #10;
        a = 5;
        b = 3;
        #10;
    end
endmodule
