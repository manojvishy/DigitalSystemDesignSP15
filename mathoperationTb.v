
`timescale 1ms/1ms

module mathOperation_tb;
  wire signed [8:0] final;
  reg signed [3:0] x;
  reg signed [3:0]y;

task apply_test(input signed [3:0] x_test,input signed [3:0] y_test ) ;
  begin
	      
	   x = x_test;
	   y = y_test;	
          #100;
end 
endtask

mathOperation duv(.final(final),.x(x),.y(y));

initial begin
  apply_test(4'b0101,4'b1010);
  apply_test(4'b0110,4'b1011);
  apply_test(4'b0111,4'b1111);
  apply_test(4'b0100,4'b1010);
  apply_test(4'b1100,4'b1011);
  apply_test(4'b1101,4'b1110);
  apply_test(4'b1111,4'b1010);
  apply_test(4'b0101,4'b1010);
  apply_test(4'b0101,4'b1010);
  apply_test(4'b0101,4'b1010);
 apply_test(4'b1111,4'b0110);
  apply_test(4'b0101,4'b0010);
  apply_test(4'b0101,4'b0101);
  apply_test(4'b0101,4'b0011);
$wait;
end 

endmodule