`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 15:01:44
// Design Name: 
// Module Name: dmem_tb
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


module dmem_tb();
    reg [31:0]   address;
    reg [31:0]  writeData;
    reg         clk, we;
    wire[31:0]  readData;
    dmem DMEM (
      .address(address),      
      .writeData(writeData),      
      .clk(clk),  // input wire clk
      .we(we),    // input wire we
      .readData(readData)  
    );
    initial begin 
        clk = 0;
        we = 0;
        //read data from address0
        address = 0;
        #20;
        //write 8 at address0
        writeData = 8;
        we = 1;
        #20;
        we = 0;
        #10;
        //write 8 at last word
        we = 1;
        address = 252;
        #40
        //read last word
        we = 0;
        #10
        //read from out scope
        address = 253;
        #10;
        //write 9 to out scope
        we = 1;
        writeData = 9;
        #40;
        //read last word, no change
        we = 0;
        address = 252;
    end
    
    always #10 clk = ~clk;
endmodule
