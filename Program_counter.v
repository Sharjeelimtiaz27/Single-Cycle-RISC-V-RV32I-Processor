`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2022 11:42:15 AM
// Design Name: 
// Module Name: Program_counter
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


module Program_counter(
input [31:0] PCnext,
input clk,rst,
output reg [31:0] PCout 
    );
    initial
        begin
    
        PCout=32'h00000000;
        end
        always @(posedge clk)
        begin 
            if (rst==1)
            begin 
                PCout<=32'h00000000;
            end 
            else
           
                PCout<=PCnext;
               
                end
                    
endmodule
