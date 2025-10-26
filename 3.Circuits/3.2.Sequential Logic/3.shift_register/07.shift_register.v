module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]data;
    always@(posedge clk)begin
        if(!resetn)
            data<=4'b0000;
        else begin
            //data<={in,data[3:1]};
            data[3]<=in;
        data[2]<=data[3];
        data[1]<=data[2];
        data[0]<=data[1];
    end
    end
    assign out =data[0];
endmodule
