`timescale 1ns / 1ps

module controller(
input   [5:0]   op, func,
input           zero,       //whether the alu result is zero
output          memToReg,   //write memory data or alu result to register file
output          memWrite,   //memory write enable
output          pcSrc,      //0: PC+4   1: BRANCH
output          aluSrc,     //source of operator b, 0: register data, 1: immediate
output          regDst,     //register address of write data, 0: rt, 1: rd
output          regWrite,   //write register enable
output          jump,       
output  [2:0]   aluControl //control signals of alu
);
    wire [2:0]  aluop;  //specify the behaviour of alu: 000-ADD, 01-SUB, 10-depends on func
    wire        branch; //whether branch instruction or not
    
    assign pcSrc = branch & zero;   //beq
    
    op_decoder od(.op(op), .memToReg(memToReg), .memWrite(memWrite), .branch(branch),
    .aluSrc(aluSrc), .regDst(regDst), .regWrite(regWrite), .jump(jump), .aluop(aluop));
    
    aluop_decoder ad(.func(func), .aluop(aluop), .aluControl(aluControl));
endmodule