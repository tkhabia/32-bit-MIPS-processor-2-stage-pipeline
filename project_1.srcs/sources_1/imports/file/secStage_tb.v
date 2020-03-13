`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 00:28:10
// Design Name: 
// Module Name: secStage_tb
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


module secStage_tb;
    reg [31:0] in  , jal ; 
    reg clk  , reset;
    wire zero_flag ; 
    wire [31: 0 ] write_in;
    secStage uut (
        in,
        clk,
        zero_flag,
        reset,
        write_in,
        jal
    );
    initial begin 
        clk = 1 ; 
        reset = 0 ;
        jal = 0;
        #1 ; 
        in  = 32'b00100000000000010000000000000101;
        #1 ;
        clk = 0 ;
        #1 ;
        clk = 1 ;         
        in = 32'b00100000001000010000000000000101 ;
        #1; 
        clk = 0 ;
        #1 ; 
        clk = 1;
        in = 32'b00000000000000010001000000000000;
        #1 clk = 0 ; 
        #1 clk =1 ;
        in = 32'b10101100000000010000000000000000;
        #1
        clk = 0; 
        
        #1 $finish;
    end         
endmodule
