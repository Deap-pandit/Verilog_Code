module BCD_to_EXCESS(OT,IN);
output [3:0]OT;
input  [3:0]IN;
wire w1,w2,w3;
not n1(OT[0],IN[0]);
xor xr1(w1,IN[0],IN[1]);
not n2(OT[1],w1);
or r1(w2,IN[0],IN[1]);
xor xr2(OT[2],w2,IN[2]);
and ad1(w3,w2,IN[2]);
or r2(OT[3],w3,IN[3]);
endmodule


module test;
reg [3:0]IN;
wire [3:0]OT;
BCD_to_EXCESS b_e(OT,IN);


initial 
begin 
#0 IN = 4'd0;
#100 IN = 4'd1;
#100 IN = 4'd2;
#100 IN = 4'd3;
#100 IN = 4'd4;
end

endmodule





