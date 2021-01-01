`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 09:49:36
// Design Name: 
// Module Name: pc_tb
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


module pc_tb();
    parameter WIDTH = 32;
    reg     clk, reset;
    reg     [WIDTH-1:0] nextPC;
    wire    [WIDTH-1:0] currPC;
    //实例化
    pc #(WIDTH) PC(.clk(clk), .reset(reset), .nextPC(nextPC), .currPC(currPC));
    //初始化
    initial begin
        reset = 0;
        clk = 0;
        #20;
        reset = 1;
        #20;
        reset = 0;
    end
    parameter PERIOD = 20;
    //产生时钟周期
    always begin
        #(PERIOD/2);
        clk = ~clk;
    end
    //nextPC = currPC + 4
    always @(currPC)begin
        nextPC <= currPC + 4;
    end
endmodule
