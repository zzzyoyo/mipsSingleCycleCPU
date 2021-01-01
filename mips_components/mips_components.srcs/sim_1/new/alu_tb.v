`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 11:44:16
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    reg  [31:0]  a, b;
    reg  [2:0]   aluControl;
    wire [31:0]  aluResult;
    //สตภýปฏ
    alu ALU(.a(a), .b(b), .aluControl(aluControl), .aluResult(aluResult));
    
    initial begin
        a = 3;
        b = 6;
        #10;
        aluControl = 3'b000;
        #10;
        aluControl = 3'b001;
        #10;
        aluControl = 3'b010;
        #10;
        aluControl = 3'b110;
        #10;
        aluControl = 3'b111;
        #10;
        aluControl = 3'b100;
        #10;
        aluControl = 3'b011;
    end
endmodule
