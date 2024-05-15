module b2g_converter #(parameter WIDTH = 4) (
	input [WIDTH - 1 : 0] din,
	output [WIDTH - 1 : 0] dout
); 

genvar i;
generate
	for(i = 0; i < WIDTH - 1; i = i + 1) begin
		assign dout[i] = din[i] ^ din[i+1];
	end
endgenerate

assign dout[WIDTH - 1] = din[WIDTH - 1];
 
endmodule
