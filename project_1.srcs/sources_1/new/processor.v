`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2020 14:15:56
// Design Name: 
// Module Name: processor
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

module processor(
    input clk,
    output reg [31: 0 ] inst,
    output [31: 0 ] inst_f,
    input reset,
    output [31: 0 ]  write_in
    );
    //reg [31: 0 ]inst;
    //wire [31: 0 ]inst_f;
    initial begin 
        inst = 0 ; 
    end 
    wire zero_flag ;  
    wire [31: 0 ] jal ; 
    
    fetch f1 (.zero_flag(zero_flag ),
    .inst_o(inst_f),
    .inst(inst),
    .clk(clk) ,
    .reset(reset),
    .jal(jal)
    );
    
    secStage ssg1 (
        .in(inst),
        .clk(clk),
        .zero_flag(zero_flag ),
        .reset(reset),
        .write_in( write_in),
        .jal(jal)
    );
     
    always @ (negedge clk )begin 
        inst <= inst_f ; 
    end
endmodule
