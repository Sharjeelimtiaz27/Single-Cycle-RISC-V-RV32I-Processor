`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 05:19:43 PM
// Design Name: 
// Module Name: ALU_TB
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


module ALU_TB;
reg [3:0]ALUctrl;
reg [31:0] regfileoutData1, genmuxout;

reg clk, rst;
wire [31:0] ALUout;
wire zero;

RISCVALU RISCVALU1(.ALUct1(ALUctrl),.A(regfileoutData1),.B(genmuxout),.clk(clk),.rst(rst),.ALUout(ALUout),.zero(zero));

initial 
begin
clk=0;
rst=0;
ALUctrl=4'b0000;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=1;
rst=0;
ALUctrl=4'b0000;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=1;
rst=0;
ALUctrl=4'b0000;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=0;
rst=1;
ALUctrl=4'b0000;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=1;
rst=1;
ALUctrl=4'b0000;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
//////
clk=0;
rst=0;
ALUctrl=4'b0110;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=1;
rst=1;
ALUctrl=4'b0110;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=0;
rst=1;
ALUctrl=4'b0110;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;
#10
clk=1;
rst=0;
ALUctrl=4'b0110;
regfileoutData1=32'h00000011;
genmuxout=32'h00000001;

end
always #10 clk=~clk;
endmodule
