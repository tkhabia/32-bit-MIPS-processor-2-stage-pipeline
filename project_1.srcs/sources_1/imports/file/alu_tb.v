`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2020 15:05:03
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    wire zero_flag;
    reg [3:0]alu_ctr = 0 ;
    reg [31:0] rs ;
    reg [31:0] rt;
    wire [31:0 ] out;
    
    alu32 uut (zero_flag , alu_ctr , rs , rt , out );
    integer k ; 
    initial begin 
        alu_ctr = 0 ; 
        rs =  2; 
        rt = 3; 
        for (k = 0 ; k < 9 ; k=k+1)begin 
            #1 alu_ctr = k ; 
        end
        #1 ; 
        rs = -1 ; 
        rt = -5; 
        for (k = 0 ; k < 9 ; k=k+1)begin 
            #1 alu_ctr = k ; 
        end
        #1 $finish ;   
    end 
endmodule
