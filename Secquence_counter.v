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

module sequence_counter(Q,QB,j,k,clr,clk);

input j,k,clr,clk;
output [3:0]Q,QB;
wire w1,w2,w3,w4;


xor xr1(w1,Q[0],Q[1]);
jk_master_slv s1(Q[0],QB[0],w1,w1,clr,clk);

xor xr2(w2,Q[1],Q[2]);
jk_master_slv s2(Q[1],QB[1],w2,w2,clr,clk);

xor xr3(w3,Q[2],Q[3]);
jk_master_slv s3(Q[2],QB[2],w3,w3,clr,clk);

xnor xnr1(w4,Q[0],Q[3]);
jk_master_slv s4(Q[3],QB[3],w4,w4,clr,clk);

endmodule


