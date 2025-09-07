`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2025 10:46:02 PM
// Design Name: 
// Module Name: MEM
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


module MEM(
 input  wire        clk, reset,
    input  wire        mem_read, mem_write,
    input  wire        mem_to_reg,   // chọn dữ liệu WB
    input  wire [31:0] addr,
    input  wire [31:0] write_data,
    input  wire [31:0] alu_result,   // giá trị từ ALU
    output reg  [31:0] wb_value,     // giá trị đưa về regfile
    output reg  [31:0] read_data     // dữ liệu load từ mem
);

    reg [31:0] memfile[0:31];
    integer i;
    always @(posedge reset) begin
    for (i=0;i<32;i=i+1)begin
    memfile[i]=32'b0;
    end
    end

    always @(*) begin
        if (reset) begin
            read_data = 32'b0;
            wb_value  = 32'b0;
        end else begin
            // LOAD
            if (mem_read) begin
                read_data = memfile[addr[4:0]];
            end

            // STORE
            if (mem_write) begin
                memfile[addr[4:0]] = write_data;
            end

            // WB mux
            
            end
            if (mem_to_reg)
                wb_value = read_data;    // lấy từ bộ nhớ
            else
                wb_value = alu_result;   // lấy từ ALU
        end
    
endmodule
