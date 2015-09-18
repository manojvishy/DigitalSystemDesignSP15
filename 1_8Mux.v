module Mux8_v
  (output reg  z,
    input [7:0]a,
    input [2:0]sel);
    
always @*
    case(sel)
      3'b000 : z = a[0];
      3'b001 : z = a[1];
      3'b010 : z = a[2];
      3'b011 : z = a[3];
      3'b100 : z = a[4];
      3'b101 : z = a[5];
      3'b110 : z = a[6];
      3'b111 : z = a[7];
    endcase
  endmodule
  
      
