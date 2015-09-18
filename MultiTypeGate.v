module mulGate
  (output reg  z,
    input [1:0] sel,
     input a,
	input b);
    
    always @*
      case (sel)
        2'b00: z = (~(a | b));
        2'b01: z = (a ^ b);
        2'b10: z = ~(a ^ b);
        2'b11: z = (a & b);
        
    endcase
endmodule 

