module dlatch(input d,input e, output q,output qbar);
  
  wire temp,temp1;
  nand n1(temp,d,e);
  nand n2(temp1,temp,e);
  nand n3(q,qbar,temp);
  nand n4(qbar,q,temp1);
endmodule

module flipflop(input d,input clk,output q,output qbar);
  wire t1,t2,t2bar;
  not(t1,clk);
  dlatch d2(d,clk,t2,t2bar);
  dlatch d3(t2,t1,q,qbar);
endmodule

module testbe();
  wire q,qbar;
  reg d,clk;
  flipflop d1(d,clk,q,qbar);
  initial
  begin
    d=0;
    clk =0;
    #3 d=1;
    #3 d=0;
    #3 $finish;
    
  end
  
always  #2  clk = ~clk;
endmodule
