module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
parameter A=0,B=1,C=2,D=3;
    reg [1:0]ps,ns;
    
    always@(posedge clk)begin
        if(!resetn)
            ps<=A;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
            A:begin
                if(r[1])
                    ns=B;
                else if(~r[1]&r[2])
                    ns=C;
                else if(~r[1]&~r[2]&r[3])
                    ns<=D;
                else
                    ns<=A;
            end
            B:ns<=r[1]?B:A;
            C:ns<=r[2]?C:A;
            D:ns<=r[3]?D:A;
        endcase
    end
             assign g[1]=(ps==B);
             assign g[2]=(ps==C);
             assign g[3]=(ps==D);
endmodule
