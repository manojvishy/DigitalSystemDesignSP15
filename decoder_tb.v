`timescale 1ms/1ms

module decoder_tb;
  wire [3:0]z;
  reg [1:0] a;

task apply_test(input [1:0] a_test) ;
  begin
          a = a_test;
          #100;
end 
endtask

decoder duv(.z(z),.a(a));

initial begin
  apply_test(2'b00);
  apply_test(2'b01);
  apply_test(2'b10);
  apply_test(2'b11);
  $wait;
end 

endmodule
        
    