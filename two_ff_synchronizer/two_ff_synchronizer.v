 module two_ff_synchronizer #(parameter WIDTH = 4)(
	input clk, rst_n,
	input [WIDTH - 1 : 0] din,
	output reg [WIDTH - 1 : 0] dout
);

reg [WIDTH - 1 : 0] q1;

always@(posedge clk or negedge rst_n ) begin
	if(!rst_n) begin
		q1 <= 0;
		dout <= 0;
	end
	else begin
		q1 <= din;
		dout <= q1;
	end
end

endmodule
