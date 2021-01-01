`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 15:40:45
// Design Name: 
// Module Name: dmem
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


module dmem(
input   clk, we,
input   [31:0]  address,
input   [31:0]  writeData,
output  [31:0]  readData
    );
    reg [7:0] RAM[255:0];
    //read
    assign readData = (address + 3 < 256)? {RAM[address+3], RAM[address+2], RAM[address+1], RAM[address]} : 32'bx;
    //write if we is 1
    always @(posedge clk)
        if(we & address + 3 < 256)begin
            RAM[address+3] <= writeData[31:24];
            RAM[address+2] <= writeData[23:16];
            RAM[address+1] <= writeData[15:8];
            RAM[address+0] <= writeData[7:0];
        end
endmodule
