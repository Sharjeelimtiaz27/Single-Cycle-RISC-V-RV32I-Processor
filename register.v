`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2022 01:07:59 PM
// Design Name: 
// Module Name: register
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


module register_file(
input clk,wr_ctrl,
input [4:0]regno1, regno2, wraddr,
input [31:0] in_Data,
output [31:0] outData1 ,outData2
    );
    
    reg [31:0] reg_file [31:0];
assign outData1=reg_file[regno1];
assign outData2=reg_file[regno2];

always @ (posedge clk)
begin
if (wr_ctrl==1)
reg_file[wraddr]<=in_Data;
    else
    reg_file[wraddr]<=32'h00000000;
    end
endmodule
