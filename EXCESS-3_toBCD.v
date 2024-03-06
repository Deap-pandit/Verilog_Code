module EXCESS3_TO_BCD(OT,IN);

output [3:0]OT;
input [3:0]IN;
wire w1,w2,w3,w4,w5;
and d1(w1,IN[1],IN[0]);
or r1(w2,IN[2],w1);
and d2(OT[3],IN[3],w2);

not t1(w3,IN[1]);
not t2(w4,IN[0]);
or r2(w5,w3,w4);
xor xr1(OT[2],IN[2],w5);
xor xr2(OT[1],IN[1],IN[0]);
not t3(OT[0],IN[0]);
endmodule


module testt;
reg[3:0]IN;
wire[3:0]OT;

EXCESS3_TO_BCD bb(OT,IN);

initial 
begin
#0 IN = 4'd3;
#100 IN = 4'd4;
#100 IN = 4'd5;
#100 IN = 4'd6;
#100 IN = 4'd7;
end

endmodule

