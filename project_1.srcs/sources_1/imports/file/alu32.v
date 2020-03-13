`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 18:21:56
// Design Name: 
// Module Name: alu32
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


module alu32(
    output reg zero_flag,
    input [3:0]alu_ctr,
    input [31:0] rs,
    input [31:0] rt,
    output reg [31:0 ] out
    );
    reg signed [31: 0] l1 , l2; 

    always @(alu_ctr , rs , rt, l1 , l2 ) begin
           l1 = rs;           
           l2 = rt;
            case (alu_ctr)
                2:// nor
                    out = ~(rs | rt ); 
                0:// add addi
                    out = l1 + l2 ; 
                3:// srlv , 
                    out = rt >> rs  ;  
                1:// sub 
                    out = l1 - l2 ; 
                4://or 
                    out = rs | rt ; 
                5: // and 
                    out = rs & rt;
                6:// right shift srav  sra
                    out = l2 >> l1;
                7: // left shift sllv sll 
                    out = l2 << l1;
                8: // slt 
                    if(l1 < l2 ) begin 
                        out  = 1; 
                    end 
                    else 
                        out = 0; 
                9:  //xor   
                begin 
                    out = rs ^ rt ; 
                end
                10:begin // sltu 
                    if(rs < rt ) begin 
                        out  = 1; 
                    end 
                    else 
                        out = 0; 
                end 
                11: // blez 
                    if(l1 <= l2 ) begin 
                        out = 0; 
                    end 
                    else 
                        out <= 1 ; 
                12: // bgtz
                    if(l1 > l2 ) begin 
                        out = 0; 
                    end 
                    else 
                        out = 1 ; 
                13: // bne 
                    if(rs != rt) 
                        out = 0 ; 
                default :
                        out = rs + rt ; 
                
    
             endcase   
             zero_flag = ~| out ;
    end 
endmodule
