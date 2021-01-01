`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 11:09:05
// Design Name: 
// Module Name: signext_tb
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


module signext_tb();
    reg     [15:0]  imm;
    wire    [31:0]  signext_imm;
    //สตภýปฏ
    sign_extend SignExt(.x(imm), .y(signext_imm));
    initial begin
        imm = 0;
        #10;
        imm = 16'hffff;
        #10;
        imm = 16'hfe17;
    end
endmodule
