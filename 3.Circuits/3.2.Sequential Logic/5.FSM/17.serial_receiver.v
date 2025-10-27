module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
);
    parameter idle= 3'b000,start= 3'b001,receive= 3'b010,waits= 3'b011,stop= 3'b100;
    reg [2:0] ps,ns;
integer i;
    
    always@(posedge clk)begin
        if(reset)
            ps<=idle;
        else
            ps<=ns;
    end
	always @(*) begin
        case(ps)
			idle: begin
                if(in)
                    ns<=idle;
                else
                    ns<=start;
            end
			start:begin
                ns=receive;
            end
			receive: begin
				if (i==8) begin
					if(in) 
                        ns=stop;
					else 
                        ns=waits;
				end 
				else 
                    ns<=receive;			
			end
		waits:begin
            if(in)
                ns<=idle;
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
 
	always @(posedge clk) begin
        if(reset) begin
			done<= 0;
			i<= 0;
		end
		else begin
            case(ns) 
				receive: begin
					done <= 0;
					i = i + 1;
				end
				stop: begin
					done <= 1;
					i <= 0;
				end
				default : begin
					done <= 0;
					i <= 0;
				end
			endcase
		end
	end

endmodule