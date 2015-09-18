`timescale 1ms/1ms

module demux_tb;
  wire [7:0] z;
  reg a;
  reg [2:0] sel;
  
  task apply_testcase (input  a_test,
                        input [2:0] sel_test);
        begin
          a = a_test;
          sel = sel_test;
          #1000;
       end
endtask

demux duv (.z(z),.a(a),.sel(sel));

initial begin 
  apply_testcase(1,3'b000);
  apply_testcase(0,3'b000);
  apply_testcase(1,3'b001);
  apply_testcase(0,3'b001);
  apply_testcase(1,3'b010);
  apply_testcase(0,3'b010);
  apply_testcase(1,3'b011);
  apply_testcase(0,3'b011);
  apply_testcase(1,3'b100);
  apply_testcase(0,3'b100);
  apply_testcase(1,3'b101);
  apply_testcase(0,3'b101);
  apply_testcase(1,3'b110);
  apply_testcase(0,3'b110);
  apply_testcase(1,3'b111);
  apply_testcase(0,3'b111);
  $wait;
end 
endmodule