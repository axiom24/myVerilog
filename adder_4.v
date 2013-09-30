module adder_4 (
         input a,
         input b,
         input cin,
         output s,
         output cout );
         
         // wires (from ands to or)
         wire w1, w2, w3;
         
         // carry-out circuitry
         and( w1, a, b );
         and( w2, a, cin );
         and( w3, b, cin );
         or( cout, w1, w2, w3 );
         
         // sum
         xor( s, a, b, cin );

endmodule


module add4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output carry
    );
        wire cin;
        
        assign cin = 1'b0;
        add2er_4 s0( .a( a[0] ), .b( b[0]), .cin( cin ), .s( sum[0]), .cout( ripple0 ) );
        add2er_4 s1( .a( a[1] ), .b( b[1]), .cin( ripple0 ), .s( sum[1]), .cout( ripple1 ) );
        add2er_4 s2( .a( a[2] ), .b( b[2]), .cin( ripple1 ), .s( sum[2]), .cout( ripple2 ) );
        add2er_4 s3( .a( a[3] ), .b( b[3]), .cin( ripple2 ), .s( sum[3]), .cout( carry ) );

endmodule


module test1();
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] sum;
  wire carry;
  add4 w1(a,b,sum,carry);
  initial
  begin
    a=4'b1011;
    b=4'b1000;
  end
endmodule

  
  
