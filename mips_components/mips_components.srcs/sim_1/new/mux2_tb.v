`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 12:20:20
// Design Name: 
// Module Name: mux2_tb
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


module mux2_tb();
    reg   [32-1:0] d0, d1;
    reg            s;
    wire  [32-1:0] y;
    mux2 #(32) MUX2(.d0(d0), .d1(d1), .s(s), .y(y));
    initial begin
        d0 = 13;
        d1 = 27;
        s = 0;
        #10;
        s = 1;
    end
endmodule
