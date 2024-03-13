module generic_count_1#(
parameter WIDTH = 32 ,
parameter DEPTH = $clog2(WIDTH) 
 ) 
(

input [WIDTH-1 : 0] d_in,
input clk,rst,
output reg [DEPTH-1: 0] d_out

);

 reg [DEPTH-1: 0] add_q;
 integer i;


 always @(*)
 begin
        add_q = {DEPTH{1'b0}};
    for(i=0; i<WIDTH; i = i+1)
        begin
        add_q = d_in[i] + add_q; 
        end
 end



always @(posedge clk or posedge rst) 
begin
   if(rst)
    begin
        d_out <= {DEPTH{1'b0}};
    end
    else
        d_out <= add_q;

end


endmodule
