module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
parameter s0=0,s1=1,s2=2;
    reg [1:0]ps,ns;
    always@(posedge clk or posedge areset)begin
        if(areset)
            ps<=s0;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
            s0:ns=x?s1:s0;
            s1:ns=x?s2:s1;
            s2:ns=x?s2:s1;
            default:ns=s0;
        endcase
    end
    assign z=(ps==s1);
endmodule
