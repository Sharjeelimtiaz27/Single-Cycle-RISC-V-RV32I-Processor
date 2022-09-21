`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2022 04:30:16 PM
// Design Name: 
// Module Name: inst_memory
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


module inst_memory(
input [31:0] PC_out,
input clk,rst,
output reg [31:0] inst_out

    );
    reg [31:0] inst_mem [1023:0];
    wire [31:0] rom_addr;
    assign rom_addr= PC_out[9:0];
    initial 
    begin
   // $readmemb("E:/ITU/Thesis/Winogard_Conv/Codes/Processordesign/inst.txt", inst_mem);
inst_mem[0] = 32'h002081B3; // add $1, $2, $3
inst_mem[4] = 32'h403202B3; // sub $4, $3, $5
inst_mem[8] = 32'h00308383; // lw $7, 3($1)
inst_mem[12] = 32'h0013F333; // and $7, $1, $6
inst_mem[16] = 32'h001112B3; // sll $5, $2, $1
inst_mem[20] = 32'h001122B3; // slt $5, $2, $1
inst_mem[24] = 32'h00210463; // beq $2, $3, 4 // 4 is offset
inst_mem[28] = 32'h001132B3; // sltu $5, $2, $1
inst_mem[32] = 32'h001142B3; // xor $5, $2, $1
inst_mem[36] = 32'h001152B3; // srl $5, $2, $1
inst_mem[40] = 32'h401152B3; // sra $5, $2, $1
inst_mem[44] = 32'h008002EF; // jal $5, 2 
inst_mem[48] = 32'h00110293; // addi $5, $2, 1
inst_mem[52] = 32'h00312293; // slti $5, $2, 3
inst_mem[56] = 32'h00517293; // andi $5, $2, 5
inst_mem[60] = 32'h00211293; // slli $5, $2, 2
inst_mem[64] = 32'h002102E7; // jar $5, $2, 2  // will jump on instruction 4
    end
    always @ (posedge clk)
    begin
    if (rst==1)
    inst_out<= 32'h00000000;
    else
    inst_out<=inst_mem[rom_addr];
    end
endmodule
