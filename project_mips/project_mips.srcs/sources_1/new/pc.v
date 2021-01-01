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
#(parameter WIDTH = 32)  //ָ���ַ�Ŀ�ȣ�Ĭ��Ϊ32λ��pj��Ӧ���ǲ���6λ����16��ָ���4�ֽ�/��=64�ֽ�
(
input       clk, reset,
input       [WIDTH-1:0] nextPC,
output  reg [WIDTH-1:0] currPC
    );
    always @(posedge clk, posedge reset)
        if(reset)   currPC <= 0;
        else        currPC <= nextPC;
endmodule
