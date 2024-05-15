`include "/home/hoangnam/Verilog/Asynchronous-FIFO/b2g_converter/b2g_converter.v"
`include "/home/hoangnam/Verilog/Asynchronous-FIFO/parameters.vh"

module wr_ptr_handler (
	input wclk,
	input wrst_n,
	input w_en,
	output reg [`PTR_WIDTH - 1 : 0] binary_wptr,
	output reg [`PTR_WIDTH - 1 : 0] gray_wptr,
	output reg full,
	input [`PTR_WIDTH - 1 : 0] gray_rptr
);
	
	wire full_p;
	wire [`PTR_WIDTH - 1 : 0] binary_wptr_p;
	wire [`PTR_WIDTH - 1 : 0] gray_wptr_p;

	// Combinational logic
	b2g_converter b2g_converter0(binary_wptr_p, gray_wptr_p);
	//assign binary_wptr_p = (w_en == 1'b1 && full == 1'b0) ? (binary_wptr + 1) : binary_wptr;
	assign binary_wptr_p = binary_wptr + (w_en && (!full));
	assign full_p = (gray_wptr == {~gray_rptr[`PTR_WIDTH - 1], gray_rptr[`PTR_WIDTH - 2 : 0]});

	// Sequential logic
	always@(posedge wclk or negedge wrst_n) begin
		if(!wrst_n) begin
			binary_wptr <= {`PTR_WIDTH{1'b0}};
			gray_wptr <= {`PTR_WIDTH{1'b0}};
			full <= 1'b0;
		end
		else begin
			binary_wptr <= binary_wptr_p;
			gray_wptr <= gray_wptr_p;
			full <= full_p;
		end
	end

endmodule
