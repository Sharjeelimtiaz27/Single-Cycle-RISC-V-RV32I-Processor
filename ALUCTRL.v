`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2022 04:43:03 PM
// Design Name: 
// Module Name: ALUCTRL
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


module ALUCTRL(
input [3:0] instr,
input [1:0]ALUop,
output reg [3:0] ALUctrl ,
input clk

    );
    
    wire [5:0]alucheck;
    
    assign alucheck={ALUop,instr}; 
    always @ (posedge clk)
    begin
            case(ALUop)

    2'b00: ALUctrl<= 4'b0010; //add
    2'b01: ALUctrl<= 4'b0110; //sub
    2'b10: case(instr)
         4'b0000: ALUctrl<= 4'b0010; //add 
         4'b0111: ALUctrl<= 4'b0000; //and 
         4'b0110: ALUctrl<= 4'b0001; //or  
         4'b1000: ALUctrl<= 4'b0110; //sub 
         4'b0001: ALUctrl<= 4'b0011; //sll 
         4'b0010: ALUctrl<= 4'b0100; //slt 
         4'b0011: ALUctrl<= 4'b0101; //sltu
         4'b0100: ALUctrl<= 4'b0111; //xor 
         4'b0101: ALUctrl<= 4'b1000; //srl 
         4'b1101: ALUctrl<= 4'b1010; //sra 
             default: ALUctrl<= 4'bxxxx;
             endcase //
    2'b11:case(instr)
        4'b0000 : ALUctrl <= 4'b0010; // addi
        4'b0010 : ALUctrl <= 4'b0100; // slti
        4'b0011 : ALUctrl <= 4'b0101; // sltui
        4'b0100 : ALUctrl <= 4'b0111; // xori
        4'b0110 : ALUctrl <= 4'b0001; // ori
        4'b0111 : ALUctrl <= 4'b0000; // andi
        4'b0001 : ALUctrl <= 4'b0011; // slli
        4'b0101 : ALUctrl <= 4'b1000; // srli
        4'b1101 : ALUctrl <= 4'b1010; // srai
        default: ALUctrl<= 4'bxxxx;
          
  endcase
    default: ALUctrl<= 4'bxxxx;
    endcase
    end
endmodule
