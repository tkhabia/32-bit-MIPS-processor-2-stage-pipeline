`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 19:30:30
// Design Name: 
// Module Name: decode
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


module decode(
    input [31:0] in,
    output reg alusrc,
    output reg [3:0] aluctr,
    output reg regdes,
    output reg regen,
    output reg memwr,
    output reg memtoreg,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [15:0] imm,
    output reg sft,
    output reg [4:0] shmt,
    output reg extop,
    output reg j 
    );
    wire [5:0]opcode;
    wire [5:0 ]fu;  
    assign fu = in [5:0]; 
    assign opcode = in [31:26] ;
    always @ (*) begin 
    case (opcode)
        6'b000000:begin // r type 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = in [15:11];
            imm =16'bx;
            shmt = in [10 : 6] ;
            j = 0 ; 
            case (fu)
            6'b100000: begin //add
                extop = 1'bx;
                sft = 0 ;
                alusrc = 0 ;
                aluctr = 0;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0 ;
                end 
            6'b100010: begin // sub 
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 1;
                regdes = 0;
                sft =0 ;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0 ;
            end
            6'b100100: begin //and
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 5;
                sft =0 ;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0 ;              
            end  
            6'b100101: begin // or 
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 4;
                sft =0 ;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0 ; 
            end 
            6'b101001: begin // sltu
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 10;
                sft =0 ;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0; 
            end
            6'b101010: begin // slt
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 8;
                sft =0 ;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0; 
            end
             
            6'b000000: begin //sll
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 7;
                regdes = 0;
                regen = 1 ;
                sft =1 ; 
                memwr = 0 ;
                memtoreg = 0;    
            end 
            6'b000100: begin //sllv
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 7;
                regdes = 0;
                regen = 1 ;
                sft = 0 ; 
                memwr = 0 ;
                memtoreg = 0;
            end
            6'b000011: begin //sra
                extop  = 1'bx;
                alusrc = 0;
                aluctr = 6;
                regdes = 0;
                regen  = 1;
                sft    = 1 ; 
                memwr  = 0 ;
                memtoreg = 0;    
            end 
            6'b000111: begin //srav
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 6;
                regdes = 0;
                regen = 1 ;
                sft = 0 ; 
                memwr = 0 ;
                memtoreg = 0;
            end
            6'b000010: begin //srl
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 3;
                regdes = 0;
                regen = 1 ;
                sft = 1 ; 
                memwr = 0 ;
                memtoreg = 0;
            end
            6'b000110: begin //srlv
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 3;
                regdes = 0;
                regen = 1 ;
                sft = 0 ; 
                memwr = 0 ;
                memtoreg = 0;
            end
            6'b100110: begin // xor 
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 9;
                sft =0 ;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0 ; 
            end 
            default begin  
                extop = 1'bx;
                alusrc = 0 ;
                aluctr = 9;
                sft =0 ;
                regdes = 0;
                regen = 1 ; 
                memwr = 0 ;
                memtoreg = 0 ; 
            end
            endcase
        end 
        6'b001110:begin //xori 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            shmt = in [10 : 6] ;
            imm =in [15:0] ; 
            extop = 1'b0;
            alusrc = 1;
            aluctr = 9;
            sft    =0 ;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0;
            j = 0  ; 
        end 
        6'b001000:begin //add i 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            j = 0 ; 
            shmt = in [10 : 6] ;
            imm =in [15:0] ; 
            extop = 1'b1;
            alusrc = 1;
            aluctr = 0;
            sft =0 ;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0;
        end
        6'b001100: begin //andi
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            shmt = in [10 : 6] ;
            sft =0 ;
            j= 0 ;
            imm =in [15:0] ; 
            extop = 1'b0;
            alusrc = 1;
            aluctr = 5;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0;
        end
        6'b001101: begin // ori 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            shmt = in [10 : 6] ;
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'b0;
            sft =0 ;
            j = 0 ;
            alusrc = 1;
            aluctr = 4;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0;
        end 
        6'b001001: begin // sltiu 
            rs = in [25:21]; 
            j = 0 ;
            rt = in [20:16] ; 
            rd = 5'bx ;
            shmt = in [10 : 6] ;
            imm =in [15:0] ; 
            extop = 1'b1;
            sft =0 ;
            alusrc = 1;
            aluctr = 10;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0; 
        end
        6'b001010: begin // slti 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            shmt = in [10 : 6] ;
            imm =in [15:0] ; 
            extop = 1'b1;
            sft =0 ;
            j = 0 ;
            alusrc = 1;
            aluctr = 8;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 0; 
        end 
        6'b100011: begin // lw 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            shmt = in [10 : 6] ;
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'b1;
            sft =0 ;
            j = 0 ;
            alusrc = 1;
            aluctr = 0;
            regdes = 1;
            regen = 1 ; 
            memwr = 0 ;
            memtoreg = 1;
        end 
        6'b101011 : begin //sw
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'b1;
            shmt = in [10 : 6];
            sft =0 ;
            j = 0 ;
            alusrc = 1;
            aluctr = 0;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 1 ;
            memtoreg = 1'bx;
        end 
        6'b000100: begin // beq
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'bx;
            sft =0 ;
            j = 0 ;
            alusrc = 1'b0;
            aluctr = 1;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 0 ;
            memtoreg = 1'bx;
        end
        6'b000110 : begin // BLEZ
            rs = in [25:21]; 
            rt = in [20:16]; 
            rd = 5'bx ;
            imm =in [15:0]; 
            extop = 1'bx;
            sft =0 ;
            alusrc = 1'b0;
            aluctr = 11;
            regdes = 1'bx;
            regen = 0 ;
            j = 0 ; 
            memwr = 0 ;
            memtoreg = 1'bx;
        end 
        6'b000101: begin // Bne
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'bx;
            sft =0 ;
            j = 0 ;
            alusrc = 1'b0;
            aluctr = 13;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 0 ;
            memtoreg = 1'bx;
        end 
        6'b000111: begin // BGTZ
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'bx;
            sft =0 ;
            j = 0 ;
            alusrc = 1'b0;
            aluctr = 12;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 0 ;
            memtoreg = 1'bx;
        end 
        6'b000010:begin // jump
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'bx;
            sft =0 ;
            j = 0 ;
            alusrc = 1'bx;
            aluctr = 4'bx;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 0 ;
            memtoreg = 1'bx;
        end 
        6'b000011 :begin // jal 
            rs = in [25:21]; 
            rt = in [20:16] ; 
            rd = 5'bx ;
            imm =in [15:0] ; 
            extop = 1'bx;
            sft =0 ;
            j = 1;
            alusrc = 1'bx;
            aluctr = 4'bx;
            regdes = 1'bx;
            regen = 0 ; 
            memwr = 0 ;
            memtoreg = 1'bx;
        end
    endcase  
    end 
endmodule
