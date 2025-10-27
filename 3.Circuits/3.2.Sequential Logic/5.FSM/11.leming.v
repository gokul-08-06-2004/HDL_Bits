module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter WALK_L=2'd0,WALK_R=2'd1,FALL_L=2'd2,FALL_R=2'd3;
    reg [1:0]ps,ns;
    always@(posedge clk or posedge areset)begin
        if(areset)
            ps<=WALK_L;
        else
            ps<=ns;
    end
    
    always@(*)begin
        case(ps)
            WALK_L:ns=ground?(bump_left)?WALK_R:WALK_L:FALL_L;
            WALK_R:ns=ground?(bump_right)?WALK_L:WALK_R:FALL_R;
            FALL_L:ns=ground?WALK_L:FALL_L;
            FALL_R:ns=ground?WALK_R:FALL_R;
        endcase
    end
    
    assign walk_left=(ps==WALK_L);
    assign walk_right=(ps==WALK_R);
    assign aaah=(ps==FALL_L)||(ps==FALL_R);
endmodule
