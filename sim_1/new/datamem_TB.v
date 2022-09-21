`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2022 11:26:08 AM
// Design Name: 
// Module Name: datamem_TB
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


module datamem_TB;

reg [31:0] ALUout; 
reg [31:0] regfileoutData2;
reg clk,rst,memwrite,memread;
wire [31:0] datamemout;

data_mem datamem1 (.in_addr(ALUout),.in_data(regfileoutData2),.clk(clk),.rst(rst),
.wr_en(memwrite),.rd_en(memread),.out_data(datamemout));

initial 
begin
clk=0;
rst=1;
memread=1;
memwrite=0;
ALUout=32'h00000003;
regfileoutData2=32'h00000000;
#10
clk=1;
rst=0;
memread=1;
memwrite=0;
ALUout=32'h00000003;
regfileoutData2=32'h00000000;
#10
clk=0;
rst=1;
memread=1;
memwrite=0;
ALUout=32'h00000003;
regfileoutData2=32'h00000000;
#10
clk=1;
rst=1;
memread=1;
memwrite=0;
ALUout=32'h00000003;
regfileoutData2=32'h00000000;
////mem read
#10
clk=0;
rst=1;
memread=0;
memwrite=1;
ALUout=32'h00000004;
regfileoutData2=32'h00000010;
#10
clk=1;
rst=0;
memread=0;
memwrite=1;
ALUout=32'h00000004;
regfileoutData2=32'h00000010;
#10
clk=0;
rst=1;
memread=0;
memwrite=1;
ALUout=32'h00000004;
regfileoutData2=32'h00000010;
#10
clk=1;
rst=1;
memread=0;
memwrite=1;
ALUout=32'h00000004;
regfileoutData2=32'h00000010;
#10
clk=0;
rst=1;
memread=1;
memwrite=0;
ALUout=32'h00000004;
regfileoutData2=32'h00000000;
#10
clk=1;
rst=0;
memread=1;
memwrite=0;
ALUout=32'h00000004;
regfileoutData2=32'h00000000;
#10
clk=0;
rst=1;
memread=1;
memwrite=0;
ALUout=32'h00000004;
regfileoutData2=32'h00000000;
#10
clk=1;
rst=1;
memread=1;
memwrite=0;
ALUout=32'h00000004;
regfileoutData2=32'h00000000;

end


 always #10 clk=~clk;
 
endmodule
