`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 10:58:54
// Design Name: 
// Module Name: datapath
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


module datapath(
input           clk, reset,
input           memToReg, pcSrc,
input           aluSrc, regDst,
input           regWrite, jump,
input   [2:0]   aluControl,
output          zero,
output  [31:0]  pc,         //input of imem
input   [31:0]  instr,      //output of imem 
output  [31:0]  aluout,     //input of dmem: address
output  [31:0]  writeData,  //input of dmem: write data
input   [31:0]  readData    //output of dmem: read data
    );
    wire    [31:0]  pcnext;         //pcnextbrach or pcjump
    wire    [31:0]  pcbranch;       //pc+4+signimm
    wire    [31:0]  pcplus4;        //pc+4
    wire    [31:0]  pcnextbrach;    //pcplus4 or pcbranch
    wire    [31:0]  pcjump;         //{pcplus4[31:28], instr[25:0], 2'b00}
    assign  pcjump = {pcplus4[31:28], instr[25:0], 2'b00};
    
    wire    [4:0]   writeRegAddr;   //depends on regDst, 0: rt, 1: rd
    wire    [31:0]  regWriteData;   //depends on memToReg, 0: alu result, 1: memory read data
    wire    [31:0]  srcA, srcB;     //operator of ALU
    assign  zero = !aluout;
    
    wire    [31:0]  signImm, signImmSh;
    //sign extend
    sign_extend SignExt(.x(instr[15:0]), .y(signImm));
    
    //next PC logic
    pc  #(32)   PC(.clk(clk), .reset(reset), .nextPC(pcnext), .currPC(pc));
    adder       pcadd1(.a(pc), .b(32'b100), .y(pcplus4)); //PC+4
    sl2         immsh(.x(signImm), .y(signImmSh));   
    adder       pcadd2(.a(pcplus4), .b(signImmSh), .y(pcbranch));
    mux2 #(32)  pcbranchmux(.d0(pcplus4),.d1(pcbranch), .s(pcSrc), .y(pcnextbrach));    
    mux2 #(32)  pcmux(.d0(pcnextbrach), .d1(pcjump), .s(jump), .y(pcnext));
    
    //register file logic
    regfile     regFile(.clk(clk), .regWriteEnable(regWrite), 
    .regWriteAddress(writeRegAddr), .regWriteData(regWriteData),
    .RsAddress(instr[25:21]), .RsData(srcA),
    .RtAddress(instr[20:16]), .RtData(writeData));
    mux2 #(5)   writeRegAddrMUX(.d0(instr[20:16]), .d1(instr[15:11]), .s(regDst), .y(writeRegAddr));
    mux2 #(32)  regWriteDataMUX(.d0(aluout), .d1(readData), .s(memToReg), .y(regWriteData));
    
    //ALU logic
    mux2 #(32)  srcBmux(.d0(writeData), .d1(signImm), .s(aluSrc), .y(srcB));
    alu         ALU(srcA, srcB, aluControl, aluout);
endmodule
