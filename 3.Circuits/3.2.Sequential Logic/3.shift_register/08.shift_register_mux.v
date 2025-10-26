module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF M1(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],LEDR[3]);
    MUXDFF M2(KEY[0],KEY[1],KEY[2],LEDR[3],SW[2],LEDR[2]);
    MUXDFF M3(KEY[0],KEY[1],KEY[2],LEDR[2],SW[1],LEDR[1]);
    MUXDFF M4(KEY[0],KEY[1],KEY[2],LEDR[1],SW[0],LEDR[0]);
    
endmodule

module MUXDFF (input clk,e,l,w,r,output q);
    wire [1:0]wi;
    assign wi[0]=e?w:q;
    assign wi[1]=l?r:wi[0];
    always@(posedge clk)begin
        q<=wi[1];
    end
endmodule
