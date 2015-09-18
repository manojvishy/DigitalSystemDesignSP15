`timescale 1ms/1ms

module mux_tb;
  wire z;
  reg [7:0] a;
  reg [2:0] sel;
  
  task apply_testcase (input [7:0] a_test,
                        input [2:0] sel_test);
        begin
          a = a_test;
          sel = sel_test;
          #1000;
       end
  endtask
  
  Mux8_v duv (.z(z),.a(a),.sel(sel));
  
  initial begin 
    apply_testcase (7'b00001111,3'b000);
    apply_testcase (7'b11001111,3'b001);
    apply_testcase (7'b00111100,3'b010);
    apply_testcase (7'b11110000,3'b011);
    apply_testcase (7'b11111111,3'b100);
    apply_testcase (7'b01101111,3'b101);
    apply_testcase (7'b01001111,3'b110);
    apply_testcase (7'b01101111,3'b111);    
    $wait;
end
endmodule
                