module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);
    parameter idle=3'd0,start=3'd1,receive=3'd2,waits=3'd3,stop=3'd4;
    reg [2:0]ps,ns;
    integer i;
    reg [7:0]out;
    
    always@(posedge clk)begin
        if(reset)
            ps<=idle;
        else
            ps<=ns;
    end
    
    always@(*)begin
       
        case(ps)
          
            idle:begin
                if(in)begin
                    ns<=idle;
                end
                else
                    ns<=start;
            end
            start:begin
                ns<=receive;
            end
            receive:begin
                if(i==8)begin
                    if(in)
                        ns<=stop;
                    else
                        ns<=waits;
                end
                else
                    ns<=receive;
            end
            waits:begin
                if(in)begin
                    ns<=idle;
                end
                else
                   ns<=waits;
            end
            stop:begin
                if(in)
                    ns<=idle;
                else
                    ns<=start;
            end
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin
            done<=0;
            i<=0;
        end
        else begin
            case(ns)
                receive:begin
                    done<=0;
                    i<=i+1;
                end
                stop:begin
                    done<=1;
                    i<=0;
                end
                default:begin
                    done<=0;
                    i<=0;
                end
            endcase
        end
    end
            
    always@(posedge clk)begin
        if(reset)
          out <=0;
        else if(ns==receive)
            out[i]=in;
        end
        
                    

            
    assign out_byte=done?out :0;
endmodule
