module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
wire d,e;
    assign d=E?w:Q;
    assign e=L?R:d;
    always@(posedge clk)
        Q<=e;
endmodule