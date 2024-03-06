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

module three_bit_secquential_counter(Q,QB,clr,clk);

input clr,clk;
output [2:0]Q;
wire w1,w2,w3;
output [2:0]QB;


//and(w1,Q[1],QB[2]);
jk_master_slv  g1(Q[0],QB[0],QB[0],QB[0],clr,clk);

and(w1,QB[1],Q[0]);


or(w2,QB[0],w1);
jk_master_slv  g2(Q[1],QB[1],w2,w2,clr,clk);

buf( w3,Q[1]);
jk_master_slv  g3(Q[2],QB[2],w3,w3,clr,clk);

endmodule




