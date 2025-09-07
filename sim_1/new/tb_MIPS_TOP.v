`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 04:39:17 PM
// Design Name: 
// Module Name: tb_MIPS_TOP
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


module tb_MIPS_TOP;
reg clk, reset;
    wire [31:0] PC, instruction, alu_result, wb_value;

    MIPS_TOP uut (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .instruction(instruction),
        .alu_result(alu_result),
        .wb_value(wb_value)
    );
initial begin
 forever #5 clk = ~clk;
 end
    initial begin
        clk = 0;
        reset = 1;
        #100 reset = 0;
        
        #1000 $finish;
    end

   

    initial begin
        $monitor("Time=%t PC=%h instruction=%h", $time, PC, instruction);
    end
endmodule
