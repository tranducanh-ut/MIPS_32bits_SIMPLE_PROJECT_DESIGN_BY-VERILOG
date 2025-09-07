`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2025 10:26:15 PM
// Design Name: 
// Module Name: Decode
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


module Decode(
input wire clk,reset,
 output reg[4:0] rs,rt,rd,
 input wire[31:0] wb_value,
 output reg [31:0] data1,data2
 ,input wire [31:0] instruction,
 output reg [5:0] opcode, 
 output reg [5:0] func,
 output reg[3:0] ALUop,
 output reg reg_write,branch
 
 

    );
    
    reg[31:0] regfile[0:31];
    integer i;
    always @(*) begin
    opcode = instruction[31:26];
    rs = instruction[25:21];
    rt = instruction[20:16];
    rd = instruction[15:11];
    func = instruction[5:0];

  
    ALUop = 4'b0000;
    reg_write = 1'b0;
    branch = 1'b0;
    data1 = regfile[rs];
    data2 = 32'b0;

    case(opcode)
        6'b000000: begin // R-type
            case(func)
                6'b100000: ALUop = 4'b0010; // add
                6'b100010: ALUop = 4'b0110; // sub
                6'b100100: ALUop = 4'b0000; // and
                6'b100101: ALUop = 4'b0001; // or
                6'b101010: ALUop = 4'b0111; // slt
            endcase
            reg_write = 1'b1;
            data1 = regfile[rs];
            data2 = regfile[rt];
        end

        6'b001000: begin // addi
            ALUop = 4'b0010;
            reg_write = 1'b1;
            data1 = regfile[rs];
            data2 = {{16{instruction[15]}}, instruction[15:0]};
        end

        6'b100011: begin // lw
            ALUop = 4'b0010;
            reg_write = 1'b1;
            data1 = regfile[rs];
            data2 = {{16{instruction[15]}}, instruction[15:0]};
        end

        6'b101011: begin // sw
            ALUop = 4'b0010;
            reg_write = 1'b0;
            data1 = regfile[rs];
            data2 = {{16{instruction[15]}}, instruction[15:0]};
        end

        6'b000100: begin // beq
            ALUop = 4'b0110;
            reg_write = 1'b0;
            branch = 1'b1;
            data1 = regfile[rs];
            data2 = regfile[rt];
        end
    endcase
end


always @(posedge  clk or posedge reset) begin
    if(reset) begin
        for(i=0;i<32;i=i+1) 
            regfile[i] <= 32'b0;
    end
    else if(reg_write) begin
        if(opcode==6'b000000 && rd!=0) begin
            regfile[rd] <= wb_value;   // R-type 
        end
        else if(opcode==6'b001000) begin
            regfile[rt] <= wb_value;   // addi 
        end
        else if(opcode==6'b100011) begin
            regfile[rt] <= wb_value;   // lw 
        end
    end
end
endmodule
