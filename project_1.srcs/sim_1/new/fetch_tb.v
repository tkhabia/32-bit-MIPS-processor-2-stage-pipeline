`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2020 14:27:52
// Design Name: 
// Module Name: fetch_tb
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


module fetch_tb;

    reg zero_flag , clk ;
    wire [31: 0 ] inst_f;
    reg [31: 0 ] inst;
    fetch f1 (.zero_flag(zero_flag ),
    .inst_o(inst_f),
    .inst(inst),
    .clk(clk) ); 
    initial begin 
         clk = 1 ; 
         zero_flag = 1 ; 
         #1 clk = 0 ;
         
        #1 clk =1 ; 
        inst  = 32'b00100000000000010000000000000101;
        
        #1 ;
        clk = 0 ;
        #1 ;
        clk = 1 ;         
        inst= 32'b00100000001000010000000000000101 ;
        #1; 
        clk = 0 ;
        #1 ; 
        clk = 1;
        inst = 32'b10101100000000010000000000000000;
        #1 clk = 0 ; 
        #1 clk =1 ;
        inst= 32'b00001000000000000000000000000000;
        #1
        clk = 0; 
        
        #1 $finish;
    end 
    
endmodule
