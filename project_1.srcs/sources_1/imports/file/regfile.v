`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 00:14:39
// Design Name: 
// Module Name: regfile
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


module regfile(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0]write_in,
    input wen,
    input regdes,
    input clk,
    output reg [31:0] o1,
    output reg [31:0] o2,
    input reset,
    input j,
    input [31: 0 ] jal
    );
    
    reg [31: 0] regfile [0: 31] ; 
    initial begin 
        regfile[0] = 0  ;
        
        $readmemb("registers.mem", regfile ,1 , 31);
        $monitor ("rs = %d rt = %d rd = %d , regdes = %d ,write_in = %d t =  %d" , rs , rt, rd , regdes , write_in ,$time ) ; 
         
    end
    always @ (*) begin 
        o1 = regfile [rs] ; 
        o2 = regfile [rt] ; 
    end 
    
    always@(negedge clk) begin 
        if(reset)begin 
            regfile[0] <= 0  ;
            
            $readmemb("registers.mem", regfile ,1 , 31);
        end else 
        if(wen ==1) begin
            if(regdes ==1'b1)begin 
               regfile [rt] <= write_in;
               
            end 
            else begin 
               regfile [rd] <= write_in;
            end
            //$writememb("registers.mem",regfile); 
        end else if(j) begin 
            regfile [31] <= jal; 
        end     
    end 
endmodule
