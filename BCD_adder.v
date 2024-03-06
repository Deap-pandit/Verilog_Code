
module Four_bit_Adder(s,cout,a,b,cin);

output [3:0]s;
wire c0,c1,c2;
output cout;
input [3:0]a,b;
input cin;

Full_Adder fadd0(s[0],c0,a[0],b[0],cin);
Full_Adder fadd1(s[1],c1,a[1],b[1],c0);
Full_Adder fadd2(s[2],c2,a[2],b[2],c1);
Full_Adder fadd3(s[3],cout,a[3],b[3],c2);


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

module bcd_adder(s,cout,a,b,cin1,cin2);

input [3:0]a,b;
input cin1,cin2;
output [3:0]s;
output cout;
wire [3:0]ts,tb;
wire w1,w2,w3,tout,trush;
Four_bit_Adder adder1(ts,tout,a,b,cin1);
and(w1,ts[2],ts[3]);
and(w2,ts[1],ts[3]);
or(w3,w1,w2);
or(cout,tout,w3);
or(tb[0],0,0);
or(tb[1],0,cout);
or(tb[2],0,cout);
or(tb[3],0,0);

Four_bit_Adder adder2(s,trush,ts,tb,cin2);

endmodule

module test_bcd_adder;

reg[3:0]a,b;
reg cin1,cin2;
wire[3:0]s;
wire cout;


bcd_adder add1(s,cout,a,b,cin1,cin2);

initial
begin
cin1= 1'b0;
cin2 = 1'b0;
 #0 a = 4'd4;b = 4'd4;

#100 a = 4'd3;b = 4'd4;
#100 a = 4'd6;b = 4'd4;
#100 a = 4'd9;b = 4'd4;
#100 a = 4'd10;b = 4'd1;
#100 a = 4'd6;b = 4'd6;
end
endmodule
