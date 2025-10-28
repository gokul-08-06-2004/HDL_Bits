module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
parameter s0=3'b000;
    parameter s1=3'b001;
    parameter s2=3'b010;
    parameter s3=3'b011;
    parameter s4=3'b100;
    reg [2:0]ps,ns;
    
    always@(posedge clk)begin
        if(reset)
            ps<=s0;
        else 
            ps=ns;
    end
    always@(*)begin
        case(ps)
            s0:ns=x?s1:s0;
            s1:ns=x?s4:s1;
            s2:ns=x?s1:s2;
            s3:ns=x?s2:s1;
            s4:ns=x?s4:s3;
        endcase
    end
    assign z=(ps==s3)||(ps==s4);
        
endmodule
