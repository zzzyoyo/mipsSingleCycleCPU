`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 08:16:41
// Design Name: 
// Module Name: op_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// decode op to various signals
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module op_decoder(
input   [5:0]   op,
output          memToReg,   //write memory data or alu result to register file
output          memWrite,   //memory write enable
output          branch,     //branch or not
output          aluSrc,     //source of operator b, 0: register data, 1: immediate
output          regDst,     //register address of write data, 0: rt, 1: rd
output          regWrite,   //write register enable
output          jump,       //jump or not
output  [2:0]   aluop       //specify the behaviour of alu(input of aluop_decoder)
    );
    reg [9:0]   controls;   //10 bits, combination of output signals
    assign  {regWrite, regDst, aluSrc, branch, memWrite, memToReg, aluop, jump} = controls;
    
    always @(*)
        case(op)
            6'b000000: controls <= 10'b1100000100;  //Rtype
            6'b100011: controls <= 10'b1010010000;  //LW
            6'b101011: controls <= 10'b0010100000;  //SW
            6'b000100: controls <= 10'b0001000010;  //BEQ
            6'b000010: controls <= 10'b0000000001;  //J
            6'b001000: controls <= 10'b1010000000;  //ADDI
            6'b001101: controls <= 10'b1010001010;  //ORI
            6'b001100: controls <= 10'b1010001000;  //ANDI
            6'b001010: controls <= 10'b1010001100;  //SLTI
            default:   controls <= 10'bxxxxxxxxxx;  //???
        endcase
    
endmodule
