`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2025 09:52:00 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
 input  wire [31:0] opr1, 
    input  wire [31:0] opr2,
    input  wire [3:0]  ALUop,
    output reg  [31:0] result,
    output reg         zero
);

    always @(* ) begin
        case(ALUop)
            4'b0010: result = opr1 + opr2;                      
            4'b0110: result = opr1 - opr2;                     
            4'b0000: result = opr1 & opr2;                     
            4'b0001: result = opr1 | opr2;                    
            4'b0111: result = opr1 < opr2;  
            default: result = 32'b0;
        endcase
        zero = (result == 32'b0);
    end
endmodule
