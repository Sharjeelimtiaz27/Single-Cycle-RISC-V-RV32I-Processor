`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 02:40:33 PM
// Design Name: 
// Module Name: imgen
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
module RISC_V_TB;

reg clk,rst;
wire [1:0]ALUopcheck;
wire[31:0] datacheck1,datacheck2;

RISC_V_Top RV1(.clk(clk),.rst(rst),.ALUopcheck(ALUopcheck),.datacheck1(datacheck1),.datacheck2(datacheck2));
initial 
begin
clk=0;
rst=0;
#10
rst=1;
#10
rst=0;
#10
rst=0;
#10
rst=0;
#10
rst=0;
#10
rst=0;
end
always  #10 clk=~clk;
endmodule