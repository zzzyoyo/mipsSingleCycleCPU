`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 08:56:41
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();
    reg           clk;
    reg           regWriteEnable; //写入使能
    reg   [4:0]   regWriteAddress;//写入地址，深度为32故只要5位
    reg   [31:0]  regWriteData;
    reg   [4:0]   RsAddress;      //Rs寄存器，源操作数寄存器号
    reg   [4:0]   RtAddress;      // Rt寄存器
    wire  [31:0]  RsData;
    wire  [31:0]  RtData;
    //实例化
    regfile regFile(.clk(clk), .regWriteEnable(regWriteEnable), 
    .regWriteAddress(regWriteAddress), .regWriteData(regWriteData),
    .RsAddress(RsAddress), .RsData(RsData),
    .RtAddress(RtAddress), .RtData(RtData));
    //初始化
    initial begin
        clk = 0;
        regWriteEnable = 0;
        regWriteAddress = 0;
        regWriteData = 0;
        RsAddress = 0;
        RtAddress = 0;
        #50;
        regWriteEnable = 1;
        regWriteData = 32'h1324afdc;
    end
    //产生时钟信号
    parameter PERIOD = 20;
    always begin
        clk = ~clk;
        #(PERIOD/2);
    end
    //与时钟同步的激励信号
    always begin
        regWriteAddress = 8;
        RsAddress = 8;
        #PERIOD;
    end
endmodule
