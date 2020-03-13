`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 13:57:39
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb;
    reg regdes;
    reg clk;
    reg alusrc;
    reg regen;
    reg memwr;
    reg memtoreg;
    reg [3:0]aluctr;
    reg extop;
    wire zero_flag;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg sft;
    reg [4:0] shmt;
    reg [15:0 ] imm;
 datapath uut (
    regdes,
    clk,
    alusrc,
    regen,
    memwr,
    memtoreg,
    aluctr,
    extop,
    zero_flag,
    rs,
    rt,
    rd,
    sft,
    shmt,
    imm
    );
    
    initial begin 
            clk = 1;
            #1; 
            rs = 0; 
            rt = 1; 
            rd = 5'bx ;
            shmt =0;
            imm = 4; 
            extop = 1'b1;
            alusrc = 1;
            aluctr = 0;
            sft =0 ;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0; 
            #1  ; 
            clk = 0; 
            #1 ; 
            clk = 1; 
            rs = 1; 
            rt = 2; 
            rd = 5'bx ;
            shmt =0;
            imm = 5; 
            extop = 1'b1;
            alusrc = 1;
            aluctr = 0;
            sft =0 ;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0;
              
            #1  ; 
            clk = 0; 
            #1 ; 
            // sw
            clk = 1;
            rs = 1; 
            rt = 1; 
            rd = 5'bx ;
            imm = 0 ; 
            extop = 1'b1;
            shmt = 0;
            sft = 0;
            alusrc = 1;
            aluctr = 0;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 1 ;
            memtoreg = 1'bx;
            #1  ; 
            clk = 0; 
            #1 ; 
            clk = 1;
            // lw
            rs = 1; 
            rt = 1; 
            shmt =0 ;
            rd = 5'bx ;
            imm =0; 
            extop = 1'b1;
            sft =0 ;
            alusrc = 1;
            aluctr = 0;
            regdes = 1;
            regen =  1; 
            memwr =  0;
            memtoreg <= 1;
            #1 $finish ; 
            
    end 
    
    
    
endmodule
