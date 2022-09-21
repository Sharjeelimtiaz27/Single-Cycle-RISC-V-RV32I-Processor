`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2022 06:15:06 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
input [31:0] in_addr, 
input [31:0] in_data,
input clk,rst,wr_en,rd_en,
output reg [31:0] out_data

    );
    reg [31:0] data_mem [1023:0];
    wire [31:0]opcode_addr;
    assign opcode_addr = in_addr;
    initial
    begin
    data_mem[0] = 32'h00000000;
    data_mem[1] = 32'h00000001;
    data_mem[2] = 32'h00000002;
    data_mem[3] = 32'h00000003;
    data_mem[4] = 32'h00000004;
    data_mem[5] = 32'h00000005;
    data_mem[6] = 32'h00000006;
    data_mem[7] = 32'h00000007;
    data_mem[8] = 32'h00000010;
    data_mem[9] = 32'h00000011;
    data_mem[10]= 32'h00000012;
    data_mem[11]= 32'h00000013;
    data_mem[12]= 32'h00000014;
    data_mem[13]= 32'h00000015;
    data_mem[14]= 32'h00000016;
    data_mem[15]= 32'h00000017;
    end
    always @(posedge clk)
    begin
    if (rst==1)
    out_data<=32'h00000000;
    else
        if(wr_en)
        data_mem[opcode_addr]<=in_data;
        if(rd_en)
        out_data<=data_mem[opcode_addr];
        else
        out_data<=32'h00000000;
    end
endmodule
