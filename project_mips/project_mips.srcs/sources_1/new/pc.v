`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 09:40:49
// Design Name: 
// Module Name: pc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// load d into q at every posedge
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pc 
#(parameter WIDTH = 32)  //指令地址的宽度，默认为32位，pj中应该是采用6位，即16条指令×4字节/条=64字节
(
input       clk, reset,
input       [WIDTH-1:0] nextPC,
output  reg [WIDTH-1:0] currPC
    );
    always @(posedge clk, posedge reset)
        if(reset)   currPC <= 0;
        else        currPC <= nextPC;
endmodule
