`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 08:17:40
// Design Name: 
// Module Name: aluop_decoder
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


module aluop_decoder(
input   [5:0]   func, 
input   [2:0]   aluop,      
output  [2:0]   aluControl //control signals of alu
    );
    reg [2:0]   aluControl;
    
    always@ (*)
        case(aluop)
            3'b000: aluControl <= 3'b010;   //ADD
            3'b001: aluControl <= 3'b110;   //Subtract
            3'b100: aluControl <= 3'b000;   //AND
            3'b101: aluControl <= 3'b001;   //Or
            3'b110: aluControl <= 3'b111;   //SLT
            3'b010: case(func)              //LOOK AT FUNC
                        6'b100000:  aluControl <= 3'b010;   //ADD
                        6'b100010:  aluControl <= 3'b110;   //Subtract
                        6'b100100:  aluControl <= 3'b000;   //AND
                        6'b100101:  aluControl <= 3'b001;   //Or
                        6'b101010:  aluControl <= 3'b111;   //SLT
                        6'b000000:  aluControl <= 3'b100;   //NOP
                        default:    aluControl <= 3'b011;   //NOT Used
                    endcase
            default: aluControl <= 3'b011;   //NOT Used
        endcase
endmodule
