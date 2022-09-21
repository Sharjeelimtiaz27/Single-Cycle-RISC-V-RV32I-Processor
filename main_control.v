`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2022 02:17:52 PM
// Design Name: 
// Module Name: main_control
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


module main_control(
input clk,rst,
input [6:0]instr,
output branch,memread,memtoreg,memwrite,ALUsrc,regwrite,jump,
output [1:0] ALUop

    );
    reg [8:0]ctrloutsig;
    assign  {ALUsrc,memtoreg,regwrite,memread,memwrite,branch,jump,ALUop}=ctrloutsig;
    always @(posedge clk)
    begin
    if (rst==1)
    ctrloutsig=32'h00000000;
    else
    case(instr[6:0])
    7'b0110011 : ctrloutsig <= 9'b001000010; // R-type
    7'b0000011 : ctrloutsig <= 9'b111100000; // lw-type
    7'b0100011 : ctrloutsig <= 9'b1x0010000; // sw-type
    7'b1100011 : ctrloutsig <= 9'b0x0001001; // sb-type
    7'b0010011 : ctrloutsig <= 9'b101000011; // I-type
    7'b1100111 : ctrloutsig <= 9'b111xx0100; // jalr-type
    7'b1101111 : ctrloutsig <= 9'b111xx0100; // jal-type
    default: ctrloutsig=32'hxxxxxxxxx;
    endcase 
    end
endmodule
