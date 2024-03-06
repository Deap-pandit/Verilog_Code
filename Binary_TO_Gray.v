module Binary_to_Gray(OT,IN);
output [3:0]OT;
input  [3:0]IN;
xor xr1(OT[0],IN[0] ,IN[1]);
xor xr2(OT[1],IN[1],IN[2]);
xor xr3(OT[2],IN[2],IN[3]);
buf b1(OT[3],IN[3]);
endmodule


module testbgr;
reg [3:0]IN;
wire [3:0]OT;
Binary_to_Gray  b_g(OT,IN);

initial
begin

#0 IN = 4'd0;
#100 IN = 4'd1;
#100 IN = 4'd2;
#100 IN = 4'd3;
#100 IN = 4'd4;

end

endmodule
