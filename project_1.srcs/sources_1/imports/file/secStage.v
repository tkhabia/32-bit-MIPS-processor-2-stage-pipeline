`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 00:13:56
// Design Name: 
// Module Name: secStage
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


module secStage(
    input [31:0] in,
    input clk,
    output zero_flag,
    input reset,
    output [31: 0 ]  write_in,
    input [31: 0 ] jal
    );
    wire alusrc, sft , regdes , regen, memwr , memtoreg , extop , j ; 
    wire [3:0 ] aluctr ; 
    wire [4:0] rs , rt, rd, shmt;
    wire [15: 0 ] imm ; 
    
    decode d(
    in,
    alusrc,
    aluctr,
    regdes,
    regen,
    memwr,
    memtoreg,
    rs,
    rt,
    rd,
    imm,
    sft,
    shmt,
    extop,
    j
    );
    
    datapath dp1 (
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
    imm,
    reset ,
    write_in,
    jal,
    j
    );
    
endmodule