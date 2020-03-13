`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 16:21:37
// Design Name: 
// Module Name: datapath
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


module datapath(
    input regdes,
    input clk,
    input alusrc,
    input regen,
    input memwr,
    input memtoreg,
    input [3:0]aluctr,
    input extop,
    output zero_flag,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input sft,
    input [4:0] shmt,
    input [15:0 ] imm,
    input reset,
    output reg [31: 0 ]  write_in ,
    input [31: 0 ]  jal,
    input j  
    );
    
    reg [31:0] dataMemory [0:511] ;
    wire [31: 0 ]extOutput , l4 , l3 , aluOut;
    //reg [31: 0 ]  write_in ; 
    reg [31: 0 ]  memoryout ,l2 , l1 ; 
    
    initial begin 
        $readmemb("data.mem", dataMemory);
        $monitor (" hello 0 = %h  , 1 =%h | 2= %h d4  = %h" , dataMemory[0] , dataMemory[1] , dataMemory[2] ,dataMemory[4] )  ; 
        $monitor("%d alu out = %h ,writein =  %h , l1  = %h , l2 = %h , l3 = %h  , l4 = %h  , memout = %h , aluctr = %h " ,$time,aluOut , write_in , l1 , l2 , l3, l4 ,memoryout  ,  aluctr ) ; 
    end
    
    
    // i or r type 
    always @ (*) begin 
        if(alusrc == 1)begin
            l2 = extOutput;
        end else  begin 
            l2 = l3 ; 
        end
    end       
    
    // memory data fetching 
    
    always @ (*)begin 
        memoryout = dataMemory[aluOut] ; 
    end 
    
    // decide which goes in the register block
    always @ (memoryout ,aluOut , memtoreg ) begin 
        if(memtoreg == 1)begin
            write_in  = memoryout;
        end else  begin 
            write_in  = aluOut ; 
        end
        
    end 
    // writing the data in the memory 
    always @ (negedge clk)begin 
        if(memwr == 1) begin  
            dataMemory[aluOut] <= l3 ;    
           // $writememb("data.mem", dataMemory , aluOut , aluOut);
        end
        
    end  
    // shift 
    always @ (shmt , l4, sft) begin 
        if(sft)
            l1 ={{27{1'b0}} , shmt} ;
        else 
            l1 = l4 ;
    end
    extend f1 (imm , extop ,extOutput);
    
    regfile r1 (
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .write_in(write_in),
    .wen(regen),
    .regdes(regdes),
    .clk(clk),
    .o1(l4),
    .o2(l3),
    .reset(reset),
    .j(j),
    .jal(jal)
    ); 
    alu32 al1 (zero_flag ,aluctr, l1 , l2 , aluOut);  
endmodule
