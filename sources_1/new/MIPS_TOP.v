`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2025 09:23:57 PM
// Design Name: 
// Module Name: MIPS_TOP
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


module MIPS_TOP(
input wire clk,
    input wire reset,
    output wire [31:0] PC,
    output wire [31:0] instruction,
    output wire [31:0] alu_result,
    output wire [31:0] wb_value
);

    // Wires for connecting modules
    wire [31:0] data1, data2, read_data;
    wire [4:0] rs, rt, rd;
    wire [5:0] opcode, func;
    wire [3:0] ALUop;
    wire [15:0] offset;
    wire branch, zero, reg_write, mem_read, mem_write, mem_to_reg;
    

    // FETCH module
    FETCH fetch (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .instruction(instruction),
        .branch(branch),
        .zero(zero),
        .offset(instruction[15:0]) // Use instruction offset for branch
    );

    // Decode module
    Decode decode (
        .clk(clk),
        .reset(reset),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .wb_value(wb_value),
        .data1(data1),
        .data2(data2),
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .ALUop(ALUop),
        .reg_write(reg_write),
        .branch(branch)
    );
     // Control signals (simple control unit)
    assign mem_read = (opcode == 6'b100011);  // LW
    assign mem_write = (opcode == 6'b101011); // SW
    assign mem_to_reg = (opcode == 6'b100011); // LW

    // ALU module
    ALU alu (
        .opr1(data1),
        .opr2(data2),
        .ALUop(ALUop),
        .result(alu_result),
        .zero(zero)
    );

    // MEM module
    MEM mem (
        .clk(clk),
        .reset(reset),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .addr(alu_result),
        .write_data(data1),
        .alu_result(alu_result),
        .wb_value(wb_value),
        .read_data(read_data)
    );

   
  
endmodule
