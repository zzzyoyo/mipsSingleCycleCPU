`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 12:36:56
// Design Name: 
// Module Name: sl2_tb
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


module sl2_tb();
    reg   [31:0]  x;
    wire  [31:0]  y;
    sl2 SL2(.x(x), .y(y));
    initial begin
        x = 3;
        #10;
        x = 5;
    end
endmodule
