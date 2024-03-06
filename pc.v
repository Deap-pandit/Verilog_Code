module BCD_2_XS3(e,b);
    input [3:0]b;
    output [3:0]e;
    wire w1,w2;

    or(w1,b[1],b[0]);
    and(w2,b[2],w1);
    or(e[3],w2,b[3]);
    xor(e[2],w1,b[2]);
    xnor(e[1],b[1],b[0]);
    not(e[0],b[0]);
endmodule

module BCD_2_XS3_tb;
    reg [3:0]bcd;
    wire [3:0]excess3;
    
  BCD_2_XS3  excess3(.e(excess3),.b(bcd));

  initial 
      begin
      
        bcd = 4'b0000;
        #100
        bcd = 4'b0001;
	#100
	bcd = 4'b0010;
	#100
	bcd = 4'b0011;
	#100
	bcd = 4'b0100;
	#100
	bcd = 4'b0101;
	#100
	bcd = 4'b0110;
	#100
	bcd = 4'b0111;
	#100
	bcd = 4'b1000;
	#100
	bcd = 4'b1001;
      end
endmodule
