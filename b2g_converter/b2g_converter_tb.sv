`include "/home/hoangnam/Verilog/Asynchronous-FIFO/parameters.vh"
module tb;
  reg [`WIDTH - 1 : 0] din = {`WIDTH{1'b0}};
  wire [`WIDTH - 1 : 0] dout;

b2g_converter dut (
        .din(din),
        .dout(dout)
);
  
defparam dut.WIDTH = `WIDTH; 
integer i = 0;
initial begin
	$monitor("Binary: %b --> Gray: %b", din, dout);
	for(i = 0; i < 5; i = i + 1) begin
		din = $urandom;
		#1;
	end
	$finish();
end

endmodule
