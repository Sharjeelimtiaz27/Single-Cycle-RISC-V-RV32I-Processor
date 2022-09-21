`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2022 05:25:21 PM
// Design Name: 
// Module Name: RISC_V_Top
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


module RISC_V_Top(
input clk,rst,
output [1:0]ALUopcheck,
output [31:0] datacheck1,datacheck2
    );
    
   
wire branch,memread,memtoreg,memwrite,ALUsrc,regwrite;
wire [1:0]ALUop;
wire [6:0] mainctrlinst;

assign ALUopcheck=ALUop;

Datapath datapath1(.clk(clk),.rst(rst),.branch(branch),.memread(memread),.memtoreg(memtoreg),.memwrite(memwrite),.ALUsrc(ALUsrc),.regwrite(regwrite),.ALUop(ALUop),.mainctrlinst(mainctrlinst),.datacheck1(datacheck1),.datacheck2(datacheck2));
main_control MC1 (.clk(clk),.rst(rst),.instr(mainctrlinst),.branch(branch),.memread(memread),.memtoreg(memtoreg),.memwrite(memwrite),.ALUsrc(ALUsrc),.regwrite(regwrite),.ALUop(ALUop));
endmodule
