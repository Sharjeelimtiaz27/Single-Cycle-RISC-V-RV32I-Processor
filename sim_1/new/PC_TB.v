`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 09:39:37 AM
// Design Name: 
// Module Name: PC_TB
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


module PC_TB;
reg clk;
reg rst;
reg [31:0] PCnext;

wire [31:0]PCout;

Program_counter PC1(.PCnext(PCnext),.clk(clk),.rst(rst),.PCout(PCout));

initial
begin
clk=0;
rst=1;
PCnext=32'h00000001;
#10
clk=1;
rst=1;
PCnext=32'h00000001;
#10
clk=0;
rst=0;
PCnext=32'h00000001;
#10
clk=1;
rst=0;
PCnext=32'h00000001;
#10
clk=0;
rst=0;
PCnext=32'h00000002;
#10
clk=1;
rst=0;
PCnext=32'h00000002;
#10
clk=0;
rst=0;
PCnext=32'h00000003;
#10;
clk=1;
rst=0;
PCnext=32'h00000003;


end



always #10 clk=~clk;
endmodule
