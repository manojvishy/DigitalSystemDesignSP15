module mathOperation (
output reg signed  [8:0]final,
input signed   [3:0]x,
input  signed [3:0]y
);


always @*
final= x - 5*y;



//assign final = final_signed;
endmodule	