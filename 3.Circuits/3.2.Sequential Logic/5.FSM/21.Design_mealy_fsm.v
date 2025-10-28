module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
parameter s0=2'b00;
    parameter s1=2'b01;
    parameter s2=2'b10;
    reg [1:0]ps,ns;
    
    always@(posedge clk or negedge aresetn)begin
        if(~aresetn)
            ps<=s0;
        else
            ps<=ns;
    end
    always@(*)begin
        z=0;
        case(ps)
            s0:ns=x?s1:s0;
            s1:ns=x?s1:s2;
            s2:begin
                if(x)begin
                    ns=s1;
                    z=1;
                end
                else begin
                    ns=s0;
                z=0;
            end
            end
            default:ns=s0;
        endcase
    end
                    
endmodule
