`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 00:04:42
// Design Name: 
// Module Name: extend
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


module extend(
    input [15:0] in,
    input extop,
    output reg [31:0] out
    );
    always @(*) begin 
        if (extop == 1'b1 )begin 
            out = {{16 {in[15]}} , in } ;
        end  else 
            out = {{16 {1'b0}} , in };
    end 
endmodule
