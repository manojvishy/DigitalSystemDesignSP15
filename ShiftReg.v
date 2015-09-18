module Universal_shift_reg (data_out_final, data_in,sel, clk, rst);

output [3:0] data_out_final;            // Hold
//output       msb_out, lsb_out;    // Serial shift from msb
input  [3:0] data_in;             // Serial shift from lsb
  
input        clk, rst;
input  [2:0] sel;                 //Selector for type of shifter
reg    [3:0]     data_out;


always @ (posedge clk)
begin
 if (rst) data_out<=0;
 else case (sel)
 0 : data_out <= {data_in[1:0],2'b00};  //SHL2
 1 : data_out <= data_in;               //HOLD
 2 : data_out <= 4'b1111;//Set
 3 : data_out <= 0;      //Reset
 4 : data_out <= {data_in[2:0],~data_in[3]};
 5 : data_out <= {3'b000,data_in[3]};
 6 : data_out <= {data_in[1:0],data_in[3:2]};
 
 
 endcase
 
end
assign data_out_final = data_out;
endmodule  
