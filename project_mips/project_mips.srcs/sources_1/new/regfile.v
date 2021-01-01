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
input           regWriteEnable, //д��ʹ��
input   [4:0]   regWriteAddress,//д���ַ�����Ϊ32��ֻҪ5λ
input   [31:0]  regWriteData,
input   [4:0]   RsAddress,      //Rs�Ĵ�����Դ�������Ĵ�����
input   [4:0]   RtAddress,      // Rt�Ĵ���
output  [31:0]  RsData,
output  [31:0]  RtData
    );
    reg [31:0] rf[31:0];//32��32λ�Ĵ���
    
    //write if enabled
    always @(posedge clk)
        if(regWriteEnable) rf[regWriteAddress] <= regWriteData;
    
    //read if address != 0, else output 0
    assign RsData = (RsAddress != 0) ? rf[RsAddress] : 0;
    assign RtData = (RtAddress != 0) ? rf[RtAddress] : 0;
endmodule
