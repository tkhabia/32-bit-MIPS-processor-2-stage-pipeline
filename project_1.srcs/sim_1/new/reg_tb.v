`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 21:49:54
// Design Name: 
// Module Name: reg_tb
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


module reg_tb;

reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [31:0]write_in;
    reg wen;
    reg regdes;
    reg clk;
    wire [31:0] o1;
    wire [31:0] o2;
regfile r1 (
    rs,
    rt,
    rd,
    write_in,
    wen,
    regdes,
    clk,
    o1,
    o2
    );
    initial begin 
        clk = 1; 
        rs = 1 ; 
        rt = 2 ;
        rd = 1 ;
        write_in = 5 ; 
        wen = 1; 
        regdes =1 ;
         
        #3 ; 
        rs = 1 ; 
        rt = 2 ;
        rd = 1;
        write_in = 7 ; 
        wen = 1; 
        regdes =0;
        #4 $finish ; 
    end 
    always  #2 clk =~clk ; 
endmodule
