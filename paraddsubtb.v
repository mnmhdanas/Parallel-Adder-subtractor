module paraddsubtb ();
  reg [3:0]A,B;
  reg MODE;
  wire [3:0]Dataout;
  wire cout;
  
  paraddsub DUT(MODE,A,B,Dataout,cout);
  
  initial
    begin
      A = 4'b0;
      B = 4'b0;
      MODE = 1'b0; 
    end
  
  initial
    begin
      repeat (10)
      begin
        A = {$random}%16;
        B = {$random}%16;
        MODE = {$random}%2;
        #10;
      end
    end
  
  initial
    $monitor("A=%b  B=%b  MODE= %b  Output = %b  cout= %b",
             A,B,MODE,Dataout,cout);
  
  initial
    #110 $finish;
  
endmodule
