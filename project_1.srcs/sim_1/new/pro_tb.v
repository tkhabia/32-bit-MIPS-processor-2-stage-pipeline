`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2020 18:55:37
// Design Name: 
// Module Name: pro_tb
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


module pro_tb;
reg clk ,reset;
wire [31: 0 ]  write_in;
wire [31: 0] inst , inst_f;
processor pro(
    clk,
    inst,
    inst_f,
    reset,
    write_in
    );
    initial begin 
         reset=0;
         clk = 1; 
         #55 $finish ; 
        
    end 
    always #1 clk = ~clk ; 
endmodule
