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

module mod_10(q,qb,clr,clk);

output [3:0]q,qb;
input clr,clk;

nand(clr,q[3],q[2],q[1]);

jk_master_slv jk1(q[0],qb[0],1,1,clr,clk);
jk_master_slv jk2(q[1],qb[1],1,1,clr,q[0]);
jk_master_slv jk3(q[2],qb[2],1,1,clr,q[1]);
jk_master_slv jk4(q[3],qb[3],1,1,clr,q[2]);



endmodule







