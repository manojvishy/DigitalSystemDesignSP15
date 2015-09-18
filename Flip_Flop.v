
module dff (
data  , // Data Input
clk    , // Clock Input
reset , // Reset input 
q         // Q output
);
//-----------Input Ports---------------
input data, clk, reset ; 

//-----------Output Ports---------------
output q;

//------------Internal Variables--------
reg q;

//-------------Code Starts Here---------
always @ ( negedge clk)
if (~reset) begin
  q <= 1'b0;
end  else begin
  q <= data;
end

endmodule //End Of Module dff

module tff (
data  , // Data Input
clk   , // Clock Input
reset , // Reset input
q       // Q output
);
//-----------Input Ports---------------
input data, clk, reset ; 
//-----------Output Ports---------------
output q;
//------------Internal Variables--------
reg q;
//-------------Code Starts Here---------
always @ ( posedge clk or negedge reset)
if (~reset) begin
  q <= 1'b0;
end else if (data) begin
  q <= !q;
end

endmodule //End Of Module tff



//-----------JK--FlipFlop-------------------

//------------------------------------------
module jkflipflop ( j ,k ,clk ,reset ,q ,qb );

output q ;
reg q ;
output qb ;
reg qb ;

input j ;
wire j ;
input k ;
wire k ;
input clk ;
wire clk ;
input reset ;
wire reset ;

always @ (negedge (clk)) begin
 if (reset) begin
  q <= 0;
  qb <= 1;
 end
 else begin
  if (j!=k) begin
   q <= j;
   qb <= k;
  end
  else if (j==1 && k==1) begin
   q <= ~q;
   qb <= ~qb;
  end
 end
end
 
endmodule



module srff(s,r,clk,rst, q,qb);
input s,r,clk,rst;
output q,qb;
reg q,qb;
reg [1:0]sr;
always@(negedge clk)
begin
sr={s,r};
if(rst==0)
begin
case (sr)
2'd1:q=1'b0;
2'd2:q=1'b1;
2'd3:q=1'b1;
default: begin end
endcase
end
else
begin
q=1'b0;
end

qb=~q;
end

endmodule

	
