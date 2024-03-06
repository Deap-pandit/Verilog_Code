module jk_master_slv(q,qb,j,k,clr,clk);

output q,qb;
input j,k,clr,clk;
wire a,b,y,z,c,d,clkb;

nand(a,qb,j,clk,clr);
nand(b,q,clk,k);
nand(y,a,z);
nand(z,y,b,clr);

not(clkb,clk);

nand(c,y,clkb);
nand(d,z,clkb);
nand(q,c,qb);
nand(qb,q,d,clr);

endmodule

module up_downcounter(Q,QB,clr,clk,mode);

output [2:0]Q,QB;
input clk,clr,mode;
wire w1,w2,w3,w4,w5,w6;
reg j=1'b1,k=1'b1;

wire mode_b;
not(mode_b,mode);

jk_master_slv ms1(Q[0],QB[0],j,k,clr,clk);

and(w1,Q[0],mode_b);
and(w2,QB[0],mode);
or(w3,w1,w2);

jk_master_slv ms2(Q[1],QB[1],w3,w3,clr,clk);

and(w4,Q[1],w1);
and(w5,QB[1],w2);
or(w6,w4,w5);
jk_master_slv ms3(Q[2],QB[2],w6,w6,clr,clk);

endmodule


