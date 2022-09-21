`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 03:31:56 PM
// Design Name: 
// Module Name: ALUCTRL_TB
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


module ALUCTRL_TB;
reg [3:0] inst_out;
reg [1:0]ALUop;
wire [3:0] ALUctrl ;
reg clk;

 ALUCTRL aluctrl1(.instr(inst_out),.ALUop(ALUop),.ALUctrl (ALUctrl ),.clk(clk));
 initial
 begin
 
 clk=0;
 #10
ALUop=2'b00;
inst_out=4'b0110;
 #10
 ALUop=2'b01;
inst_out=4'b0110;
 #10
 ALUop=2'b10;
inst_out=4'b0110;
// clk=0;
// ALUop=2'b10;
// inst_out=4'b0110;
// #10
// clk=0;
// #10
// clk=1;
// ALUop=2'b00;
// //inst_out=4'b0000;
// #10
// clk=0;
// ALUop=2'b00;
// //inst_out=4'b0000;
// #10
// clk=1;
// ALUop=2'b11;
// inst_out=4'b0011;
// #10
// clk=0;
//  ALUop=2'b11;
// inst_out=4'b0011;
// #10
// clk=1;
// ALUop=2'b01;
// inst_out=4'b0011;
// #10
// clk=0;
// ALUop=2'b01;
// inst_out=4'b0011;
// #10
//  clk=1;
// ALUop=2'b11;
// inst_out=4'b1101;
// #10
// clk=0;
//  ALUop=2'b11;
// inst_out=4'b1101;
 
// ///////
//  #10
// clk=1;
// ALUop=2'b10;
// inst_out=4'b0000;
// #10
// clk=0;
//  ALUop=2'b10;
// inst_out=4'b0000;
// #10
// clk=1;
// ALUop=2'b00;
// inst_out=4'bxxxx;
// #10
// clk=0;
//ALUop=2'b00;
// inst_out=4'bxxxx;
// #10
//  clk=1;
//ALUop=2'b00;
// inst_out=4'bxxxx;
// #10
// clk=0;
//ALUop=2'b10;
// inst_out=4'b0000;
 end
 always #10 clk=~clk;
endmodule
