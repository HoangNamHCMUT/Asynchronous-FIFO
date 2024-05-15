module g2b_converter #(parameter WIDTH = 4)(
	input [WIDTH - 1 : 0] din,
	output [WIDTH - 1 : 0] dout
);

genvar i;
generate
	for(i = WIDTH - 2; i >= 0; i = i - 1) begin
		assign dout[i]	= din [i] ^ dout[i+1];	
	end
endgenerate

assign dout[WIDTH - 1] = din[WIDTH - 1];

endmodule
