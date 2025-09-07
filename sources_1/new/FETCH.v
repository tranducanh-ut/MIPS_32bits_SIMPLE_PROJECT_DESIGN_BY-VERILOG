`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2025 08:47:58 PM
// Design Name: 
// Module Name: FETCH
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


module FETCH(
input wire clk,reset,
output reg [31:0] PC,
output reg [31:0] instruction,
input wire branch ,zero
,input wire [15:0] offset

    );
    reg [31:0] ins_mem [0:31];
     initial begin
        $readmemh("E:/RISC-V/MIPS_32-bit/instruction.hex", ins_mem);
    end

    always@(posedge clk or posedge reset) begin
    if(reset) begin
    instruction<=32'b0;
    PC<=32'b0;
    end
    else begin
      instruction<=  ins_mem[PC>>2];
    if(branch==1&&zero==1) begin
    PC <=PC+4 +(offset<<2);
   
    end
    else 
   
    
    
    
  
    PC<=PC+4;
    end
    
    end
endmodule
