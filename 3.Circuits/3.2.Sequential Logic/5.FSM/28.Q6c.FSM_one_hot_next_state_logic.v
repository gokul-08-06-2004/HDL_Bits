module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    //reg [6:1]Y;
    //assign Y2=Y[2];
    //assign Y4=Y[4];
    assign Y2=y[1]&~w;
    assign Y4=(y[2]&w)|(y[3]&w)|(y[5]&w)|(y[6]&w);
endmodule