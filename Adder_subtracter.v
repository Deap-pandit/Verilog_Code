
module Four_bit_Adder_subtracter(st,cout,a,b,cin);

output [3:0]st;
wire c0,c1,c2;
output cout;
input [3:0]a,b;
input cin;

Full_Adder fadd0(st[0],c0,a[0],(b[0]^cin),cin);
Full_Adder fadd1(st[1],c1,a[1],(b[1]^cin),c0);
Full_Adder fadd2(st[2],c2,a[2],(b[2]^cin),c1);
Full_Adder fadd3(st[3],cout,a[3],(b[3]^cin),c2);


endmodule


module Full_Adder(s,ct,A,B,C);
output s,ct;
input A,B,C;
wire w1,w2,w3;

xor(w1,A,B);
xor(s,w1,C);

and(w2,A,B);
and(w3,C,w1);
or(ct,w3,w2);

endmodule

module testAdder;
reg[3:0]a,b;
reg cin;

wire[3:0]st;
wire cout;

Four_bit_Adder_subtracter fadd(st,cout,a,b,cin);

initial
begin
#0 a=4'd8; b=4'd3; cin=1;
#100 a=4'd2; b=4'd2; cin=1;
#100 a=4'd5; b=4'd6; cin=1'b1;
#100 a=4'd7; b=4'd4; cin=1'b0;
#100 a=4'd3; b=4'd8; cin=1'b0;
end
endmodule