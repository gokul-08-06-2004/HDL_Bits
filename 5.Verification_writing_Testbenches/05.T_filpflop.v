module top_module ();
    reg clk,reset,t;
    wire q;
    tff tf(clk,reset,t,q);
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
     initial begin
        reset = 1'b0;#10
        reset = 1'b1;#10
        reset = 1'b0;   
    end
    always@(posedge clk)begin
        if(reset)
            t <= 1'b0;
        else
            t <= 1'b1;
    end
endmodule
