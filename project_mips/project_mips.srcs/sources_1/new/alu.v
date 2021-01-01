`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 11:26:08
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// algorithm logic unit
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
input       [31:0]  a, b,
input       [2:0]   aluControl,
output  reg [31:0]  aluResult
    );
    always @(*) begin
        case(aluControl)
            3'b000: aluResult = a & b;  //AND
            3'b001: aluResult = a | b;  //OR
            3'b010: aluResult <= a + b; //ADD
            3'b110: aluResult <= a - b; //SUBTRACT
            3'b111: aluResult = (a < b) ? 1 : 0; //SLT
            3'b100: aluResult = 0; //RETURN 0
            default:aluResult = 32'bx;
        endcase
    end
endmodule
