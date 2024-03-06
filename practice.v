module E3_toBc(OT,IN);

input [3:0]IN;
output [3:0]OT;
wire w1,w2,w3,w4;

not n1(OT[0],IN[0]);
xor xr1(OT[1],IN[0],IN[1]);
not n2(w1,IN[1]);
or (w2,w1,OT[0]);
xor xr2(OT[2],IN[2],w2);
and (w3,IN[0],IN[1]);
or (w4,w3,IN[3]);
and(OT[3],IN[3],w4);

endmodule

module e3pt;

reg [3:0]IN;
wire [3:0]OT;
E3_toBc  p1(OT,IN); 
initial
begin
#0 IN=4'd3;
#100 IN=4'd4; 
#100 IN=4'd5; 
#100 IN=4'd6; 
#100 IN=4'd7; 
#100 IN=4'd8;
#100 IN=4'd9; 
end
endmodule

