//ripple carry adder

module rca(a,b,cin,sum,cout);
  input [3:0] a;
  input [3:0] b;
  input cin;
  output [3:0] sum;
  output cout;
  
  wire c0,c1,c2;
  
  full_adder FA1 (a[0],b[0],cin,sum[0],c0);
  full_adder FA2 (a[1],b[1],c0,sum[1],c1);
  full_adder FA3 (a[2],b[2],c1,sum[2],c2);
  full_adder FA4 (a[3],b[3],c2,sum[3],cout);
  
endmodule
