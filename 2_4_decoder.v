module decoder
  (output reg [3:0] z,
    input [1:0] a);
    
    always @*
      case (a)
        2'b00: z = 4'b0001;
        2'b01: z = 4'b0010;
        2'b10: z = 4'b0100;
        2'b11: z = 4'b1000;
        
    endcase
endmodule 
