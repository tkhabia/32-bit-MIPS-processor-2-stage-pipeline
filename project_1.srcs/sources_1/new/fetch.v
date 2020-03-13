`timescale 1ns / 1ps

module fetch(
    input zero_flag,
    output [31:0] inst_o,
    input [31:0]inst,
    input clk , 
    input reset,
    output reg [31: 0 ] jal 
    );
    
    reg [7: 0]instmem [0:125]; 
    reg [31 :0 ]pc ;
    reg [1:0] sel;
    
    initial begin 
        $readmemb ("inst.mem" , instmem); 
        pc = 0;
        $monitor ("pc = %b sel %b instout = %b" , pc  , sel , inst_o) ; 
    end 
    always @ (zero_flag , inst  ,pc) begin 
        if(zero_flag && inst[31: 26] == 6'b000100)begin // branch
            sel = 2; 
            jal = 0 ;
        end
        else if (inst[31: 26] == 6'b000010) // jump 
        begin 
            sel = 1; 
            jal = pc + 4;
        end else begin
            sel = 0;  
            jal = 0 ;
        end
            
    end       
    always @ (negedge clk) begin 
        if(reset)begin 
            pc <= 0; 
        end 
        else begin 
            case (sel)
                0:// normal 
                begin 
                    pc <= pc + 4; 
                end 
                1:begin // jump
                    pc <= {pc[31:28] ,inst[15:0] , 2'b00} ;  
                end 
                2:begin // branch
                    pc <= pc + {{14{inst[15]}} ,inst[15:0] , 2'b00 };
                end
            endcase    
        end           
    end 
    assign inst_o = {instmem [pc] ,instmem [pc+1] ,instmem [pc+2] ,instmem [pc  + 3] } ;  
endmodule