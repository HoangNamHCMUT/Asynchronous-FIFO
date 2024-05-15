module tb;
parameter WIDTH = 4;

reg clk = 0;
reg rst_n = 0;
reg [WIDTH - 1 : 0] din = 0;
wire [WIDTH - 1 : 0] dout;

two_ff_synchronizer dut (
	.clk(clk),
	.rst_n(rst_n),
	.din(din),
	.dout(dout)
);

endmodule
