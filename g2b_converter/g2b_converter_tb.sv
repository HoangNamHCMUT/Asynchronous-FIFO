module tb;
parameter WIDTH = 4;
reg [WIDTH - 1 : 0] din = {WIDTH{1'b0}};
wire [WIDTH - 1 : 0] dout;

g2b_converter dut(
	.din(din),
	.dout(dout)
);

defparam dut.WIDTH = WIDTH;
integer i = 0;

initial begin
	$monitor("Gray: %b --> Binary: %b", din, dout);
	for(i = 0; i < 5; i = i + 1) begin
		din = $urandom;
		#1;
	end
	$finish();
end

endmodule
