module top_module (input a, input b, input c, output out);//
wire y;
    andgate inst1 ( y,a, b, c,1,1 );
assign out=~y;
endmodule
