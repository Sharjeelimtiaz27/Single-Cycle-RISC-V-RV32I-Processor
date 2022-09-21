`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2022 02:50:09 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
input clk,rst,
input branch,memread,memtoreg,memwrite,ALUsrc,regwrite,
input [1:0]ALUop,
output [6:0] mainctrlinst,
output [31:0] datacheck1,datacheck2
    );
    
    wire [31:0] PCout,PCnext,inst_out,memtoregdata,regfileoutData1,regfileoutData2,immgenout,genmuxout,ALUout,add1,add2,datamemout ;
    wire [3:0] ALUctrl ;
    wire zero,mux2sel;
    
    assign datacheck1=memtoregdata;
    assign datacheck2=PCnext;
    assign add1=PCout+4;
    assign add2=PCout+immgenout;
    assign PCnext =(mux2sel==1) ? add2 :add1;
   
    Program_counter PC1(.PCnext(PCnext),.clk(clk),.rst(rst),.PCout(PCout));
    inst_memory instmem1(.PC_out(PCout),.clk(clk),.rst(rst),.inst_out(inst_out));
    assign mainctrlinst=inst_out[6:0];
    register_file regf1 (.clk(clk),.wr_ctrl(regwrite),.regno1(inst_out[19:15]),.regno2(inst_out[24:20]),.wraddr(inst_out[11:7]),.in_Data(memtoregdata),.outData1 (regfileoutData1),.outData2 (regfileoutData2));
    immgen ig1 (.instr(inst_out),.out(immgenout),.clk(clk),.rst(rst));
    assign genmuxout=(ALUsrc==0) ? regfileoutData2 : immgenout;
    ALUCTRL aluctrl1(.instr({inst_out[30],inst_out[14:12]}),.ALUop(ALUop),.ALUctrl (ALUctrl ),.clk(clk));
    RISCVALU RISCVALU1(.ALUct1(ALUctrl),.A(regfileoutData1),.B(genmuxout),.clk(clk),.rst(rst),.ALUout(ALUout),.zero(zero));
    assign mux2sel=zero*branch;
    
    data_mem datamem1 (.in_addr(ALUout),.in_data(regfileoutData2),.clk(clk),.rst(rst),.wr_en(memwrite),.rd_en(memread),.out_data(datamemout));
    assign memtoregdata=(memtoreg==1)? datamemout :ALUout;
    
endmodule








