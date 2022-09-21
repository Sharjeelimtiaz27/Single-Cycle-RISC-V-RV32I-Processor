`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 10:04:43 AM
// Design Name: 
// Module Name: IM_TB
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


module IM_TB;

reg clk;
reg rst;
reg [31:0] PCout;

wire [31:0]inst_out;

inst_memory instmem1(.PC_out(PCout),.clk(clk),.rst(rst),.inst_out(inst_out));
initial
begin
clk=0;
rst=1;
PCout=32'h00000000;
#10
clk=1;
rst=1;
PCout=32'h00000000;
#10
clk=0;
rst=0;
PCout=32'h00000000;
#10
clk=1;
rst=0;
PCout=32'h00000000;
#10
clk=0;
rst=0;
PCout=32'h00000002;
#10
clk=1;
rst=0;
PCout=32'h00000002;
#10
clk=0;
rst=0;
PCout=32'h00000004;
#10
clk=1;
rst=0;
PCout=32'h00000004;
end


always #10 clk=~clk;
endmodule
