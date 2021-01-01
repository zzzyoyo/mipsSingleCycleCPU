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
    reg           regWriteEnable; //д��ʹ��
    reg   [4:0]   regWriteAddress;//д���ַ�����Ϊ32��ֻҪ5λ
    reg   [31:0]  regWriteData;
    reg   [4:0]   RsAddress;      //Rs�Ĵ�����Դ�������Ĵ�����
    reg   [4:0]   RtAddress;      // Rt�Ĵ���
    wire  [31:0]  RsData;
    wire  [31:0]  RtData;
    //ʵ����
    regfile regFile(.clk(clk), .regWriteEnable(regWriteEnable), 
    .regWriteAddress(regWriteAddress), .regWriteData(regWriteData),
    .RsAddress(RsAddress), .RsData(RsData),
    .RtAddress(RtAddress), .RtData(RtData));
    //��ʼ��
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
    //����ʱ���ź�
    parameter PERIOD = 20;
    always begin
        clk = ~clk;
        #(PERIOD/2);
    end
    //��ʱ��ͬ���ļ����ź�
    always begin
        regWriteAddress = 8;
        RsAddress = 8;
        #PERIOD;
    end
endmodule
