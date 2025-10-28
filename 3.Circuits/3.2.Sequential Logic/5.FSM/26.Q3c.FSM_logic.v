module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    reg [2:0]ns;
    assign Y0=ns[0];
    always@(*)begin
        case({y,x})
            4'b0000:ns=3'b000;
            4'b0001:ns=3'b001;
            4'b0010:ns=3'b001;
             4'b0011:ns=3'b100;
             4'b0100:ns=3'b010;
             4'b0101:ns=3'b001;
             4'b0110:ns=3'b001;
             4'b0111:ns=3'b010;
             4'b1000:ns=3'b011;
             4'b1001:ns=3'b100;
        endcase
    end
    assign z=(y==3'b011)||(y==3'b100);
            
endmodule
