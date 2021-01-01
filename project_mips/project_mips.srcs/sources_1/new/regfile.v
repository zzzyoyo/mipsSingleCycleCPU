`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2020/12/25 08:36:01
// Design Name: 
// Module Name: regfile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// register file, regfile[0] is hardwared to 0
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module regfile(
input           clk,
input           regWriteEnable, //写入使能
input   [4:0]   regWriteAddress,//写入地址，深度为32故只要5位
input   [31:0]  regWriteData,
input   [4:0]   RsAddress,      //Rs寄存器，源操作数寄存器号
input   [4:0]   RtAddress,      // Rt寄存器
output  [31:0]  RsData,
output  [31:0]  RtData
    );
    reg [31:0] rf[31:0];//32个32位寄存器
    
    //write if enabled
    always @(posedge clk)
        if(regWriteEnable) rf[regWriteAddress] <= regWriteData;
    
    //read if address != 0, else output 0
    assign RsData = (RsAddress != 0) ? rf[RsAddress] : 0;
    assign RtData = (RtAddress != 0) ? rf[RtAddress] : 0;
endmodule
