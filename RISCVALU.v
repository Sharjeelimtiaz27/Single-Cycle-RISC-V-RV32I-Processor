`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2022 04:07:57 PM
// Design Name: 
// Module Name: RISCVALU
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


module RISCVALU(
input [3:0]ALUct1,
input [31:0] A, B,

input clk, rst,
output reg [31:0] ALUout,
output zero

    );
    
  assign zero = (ALUout == 0) ? 1 : 0;
  always @(posedge clk)
  begin
  if (rst==1)
  ALUout<=0;
  else
    case(ALUct1)
    4'b0000: ALUout<= A&B;
    4'b0001: ALUout<= A |B;
    4'b0010: ALUout<= A+B;
    4'b0110: ALUout<= A-B;
    4'b0101: ALUout<= A<B?1:0;
    4'b1100: ALUout<= ~(A|B);
    4'b0111: ALUout<= (A^B);
    4'b1000: ALUout<= (A>>B);
    4'b1010: ALUout<= (A>>>B);
    4'b0100: ALUout<= ((~A+1)<(~B+1))?1:0;
     default: ALUout <=32'hxxxxxxxx;
    endcase
  end
    
endmodule
