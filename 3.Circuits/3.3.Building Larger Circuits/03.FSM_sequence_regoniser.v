module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
parameter s0=0,s1=1,s2=2,s3=3,s4=4;
    reg [2:0]ps,ns;
    
    always@(posedge clk)begin
        if(reset)
            ps<=s0;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
            s0:ns=data?s1:s0;
            s1:ns=data?s2:s0;
            s2:ns=data?s2:s3;
            s3:ns=data?s4:s0;
            s4:ns=s4;
        endcase
    end
    assign start_shifting=(ps==s4);
endmodule
