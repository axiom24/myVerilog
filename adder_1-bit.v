module adder_1-bit(input x,input y,output a);
  xor#(10) a1(a,x,y);
  and#(7) a2(b,x,y);
  
endmodule

module test();
  reg x,y;
  wire a,b;
  adder_1-bit a1(x,y,a);
  adder_1-bit a2(x,y,b);
  initial
  begin
    x=1;
    y=1;
    
    
  end
endmodule
