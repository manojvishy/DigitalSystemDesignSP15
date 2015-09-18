`timescale 1ms/1ms

module shiftReg_tb ;
  
  wire [3:0] data_out_final;
  reg [3:0] data_in;
  reg [2:0] sel;
  
  task apply_testcase (input [3:0] data_test,
                        input [2:0] sel_test);
        begin
          data_in = data_test;
          sel = sel_test;
          #1000;
       end
  endtask
  
  
Universal_shift_reg (.data_out_final(data_out_final),.data_in(data_in),.sel(sel));

initial begin

apply_testcase(4'b0101,3'b000);
apply_testcase(4'b0101,3'b001);
apply_testcase(4'b0101,3'b010);
apply_testcase(4'b0101,3'b011);
apply_testcase(4'b0101,3'b100);
apply_testcase(4'b0101,3'b101);
apply_testcase(4'b0101,3'b110);
apply_testcase(4'b0101,3'b111);

end

endmodule

  
