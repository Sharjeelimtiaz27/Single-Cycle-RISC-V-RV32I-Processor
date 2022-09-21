`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2022 12:46:22 PM
// Design Name: 
// Module Name: immgen
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


module immgen(
input [31:0] instr,
output reg [31:0] out,
input clk,rst
    );
    
    always @(posedge clk)
    begin
    if(rst==1)
    out<=32'h00000000;
    else
    case(instr[6:0])
    //7'b0000011 : out <= {{{20}{instr[31]}},instr[31:20]};
    //7'b0100011 : out <= {{{20}{instr[31]}},instr[31:25],instr[11:7]};
    //7'b1100011 : out <= {{{20}{instr[31]}},instr[31],instr[7],instr[30:25],instr[11:8]};
    //7'b0010011 : out <= {{{20}{instr[31]}},instr[31:20]};
    //7'b1100111 : out <= {{{20}{instr[31]}},instr[31:20]};
    //7'b1101111 : out <= {{{12}{instr[31]}},instr[31],instr[19:12],instr[20],instr[30:21]};
    7'b0000011 : out <= {{20'b11111111111111111111},instr[31:20]};
    7'b0100011 : out <= {{20'b11111111111111111111},instr[31:25],instr[11:7]};
    7'b1100011 : out <= {{20'b11111111111111111111},instr[31],instr[7],instr[30:25],instr[11:8]};
    7'b0010011 : out <= {{20'b11111111111111111111},instr[31:20]};
    7'b1100111 : out <= {{20'b11111111111111111111},instr[31:20]};
    7'b1101111 : out <= {{12'b111111111111},instr[31],instr[19:12],instr[20],instr[30:21]};
    default : out <= 32'h00000000;
endcase
    end
endmodule
