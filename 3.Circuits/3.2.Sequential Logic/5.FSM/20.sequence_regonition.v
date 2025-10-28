module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
parameter none=4'd0,one=4'd1,two=4'd2,three=4'd3,four=4'd4,five=4'd5,six=4'd6,seven=4'd7,dis=4'd8,fla=4'd9,er=4'd10;
    reg [3:0]ps,ns;
    always@(posedge clk)begin
        if(reset)
            ps<=none;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
            none:ns=in?one:none;
            one:ns=in?two:none;
            two:ns=in?three:none;
            three:ns=in?four:none;
            four:ns=in?five:none;
            five:ns=in?six:dis;
            six:ns=in?er:fla;
            dis:ns=in?one:none;
            fla:ns=in?one:none;
            er:ns=in?er:none;
        endcase
    end
    assign disc=(ps==dis);
    assign flag=(ps==fla);
    assign err=(ps==er);
endmodule
