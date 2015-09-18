`timescale 1ms/1ms

module mulGate_tb;
  wire z;
  reg [1:0] sel;
  reg a,b;

task apply_test(input [1:0] sel_test,input a_test,input b_test ) ;
  begin
	   sel = sel_test;    
	   a = a_test;
	   b = b_test;	
          #100;
end 
endtask

mulGate duv(.z(z),.sel(sel),.a(a),.b(b));

initial begin
  apply_test(2'b00,1'b0,1'b1);
  apply_test(2'b01,1'b1,1'b0);
  apply_test(2'b10,1'b0,1'b0);
  apply_test(2'b11,1'b1,1'b0);
  $wait;
end 

endmodule

