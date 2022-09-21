`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 10:57:52 AM
// Design Name: 
// Module Name: REGFILE_TB
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


module REGFILE_TB;

reg clk,regwrite;
reg [31:0]inst_out;
reg [31:0] memtoregdata;
wire [31:0] regfileoutData1 ,regfileoutData2;

register_file regf1 (.clk(clk),.wr_ctrl(regwrite),.regno1(inst_out[19:15]),
.regno2(inst_out[24:20]),.wraddr(inst_out[11:7]),.in_Data(memtoregdata),
.outData1 (regfileoutData1),.outData2 (regfileoutData2));

initial 
begin
clk=0;
regwrite=0;
inst_out= 32'h00308383;
memtoregdata=32'h00000001;
#10
clk=1;
regwrite=1;
inst_out= 32'h00308383;
memtoregdata=32'h00000001;
#10
clk=0;
regwrite=1;
inst_out= 32'h00308383;
memtoregdata=32'h00000002;
#10
clk=1;
regwrite=1;
inst_out= 32'h00308383;
memtoregdata=32'h00000002;
#10
clk=0;
regwrite=0;
inst_out= 32'h00308383;
memtoregdata=32'h00000001;
#10
clk=1;
regwrite=1;
inst_out= 32'h00308383;
memtoregdata=32'h00000001;
#10
clk=0;
regwrite=1;
inst_out= 32'h00308383;
memtoregdata=32'h00000001;
#10
clk=1;
regwrite=0;
inst_out= 32'h00308383;
memtoregdata=32'h00000001;

//////////////////////////////////////////

end
always #10 clk=~clk;
endmodule
