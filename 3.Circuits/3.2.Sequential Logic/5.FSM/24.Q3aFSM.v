module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
parameter A=0;
    parameter B=1;
    reg ps,ns;
    reg [1:0]count,count1;
    always@(posedge clk)begin
        if(reset)begin
            ps<=A;
            count=0;
            count1=0;
        end
    else begin
        ps<=ns;
        
        if(ps==B)begin
            if(count1==3)begin
                count=0;
                count1=0;
            end
            if(w==1)begin
            count=count+1;
            end
            count1=count1+1;
            
    end
    end
    end
    always@(*)begin
        case(ps)
            A:ns=s?B:A;
            B:ns=B;
            default:ns=A;
        endcase
    end
    assign z=(count1==3)&&(count==2);
       
endmodule
