module top_module(
    input clk,
    input in,
    input reset,
    output out); //
parameter A=2'b00;
    parameter B=2'b01;
    parameter C=2'b10;
    parameter D=2'b11;
    reg [1:0]ps,ns;
    
    always@(posedge clk)begin
        if(reset)
            ps<=A;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
            A:ns=in?B:A;
            B:ns=in?B:C;
            C:ns=in?D:A;
            D:ns=in?B:C;
        endcase
    end
    assign out =(ps==D);

endmodule
