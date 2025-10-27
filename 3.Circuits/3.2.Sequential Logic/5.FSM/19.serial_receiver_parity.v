module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);
parameter idle=4'd0;
    parameter start=4'd1;
    parameter d0=4'd2;
    parameter d1=4'd3;
    parameter d2=4'd4;
    parameter d3=4'd5;
    parameter d4=4'd6;
    parameter d5=4'd7;
    parameter d6=4'd8;
    parameter d7=4'd9;
    parameter check=4'd10;
    parameter error=4'd11;
    parameter stop=4'd12;

    reg [3:0]ps,ns;
   
    always@(posedge clk)begin
        if(reset)
            ps<=idle;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
             idle:begin
                if(in)
                    ns=idle;
                else
                    ns=start;
            end
            start,d0,d1,d2,d3,d4,d5,d6,d7:begin
                ns=ps+1;
            end
            check:begin
                if(in)
                    ns=stop;
                else
                    ns=error;
            end
             error:begin
                if(in)
                    ns=idle;
                else
                    ns=error;
            end
            stop:begin
                if(in)
                    ns=idle;
                else
                    ns=start;
           end
            default:ns=idle;
        endcase
    end
    wire parity_reset=(ps==idle)||(ps==stop);
    parity dut(.clk(clk),.reset(reset||parity_reset),.in(in),.odd(odd));
    reg [7:0]data;
    wire odd;
    reg valid;
    always@(posedge clk)begin
        valid<=odd;
        if(ps<d7)
            data<={in,data[7:1]};
    end       
        assign out_byte=data;
    assign done=(valid)&(ps==stop);
endmodule