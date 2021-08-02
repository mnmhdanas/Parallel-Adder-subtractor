
module paraddsub(MODE,A,B,Dataout,cout);
  input [3:0] A,B;
  input MODE; //(~add/sub))
  output [3:0] Dataout;
  output cout;
  wire w1,w2,w3,w4;
  wire [3:0] Bmod;
  xor X1(w1,B[0],MODE);
  xor X2(w2,B[1],MODE);
  xor X3(w3,B[2],MODE);
  xor X4(w4,B[3],MODE);
  wire cout1,cout2;
  assign cout = MODE?cout2:cout1;
  assign Bmod = {w4,w3,w2,w1};
  
  wire [3:0] S; 
  wire comb;
  
 
  rca RCA1(A,Bmod,MODE,S,cout1);
  
  assign comb = (~cout1)&MODE;
  
  wire w5,w6,w7,w8;
  
  xor X5(w5,S[0],comb);
  xor X6(w6,S[1],comb);
  xor X7(w7,S[2],comb);
  xor X8(w8,S[3],comb);
  
  wire [3:0] Smod = {w8,w7,w6,w5};
  rca RCA2(Smod,4'b0,comb,Dataout,cout2);
  
  
endmodule
