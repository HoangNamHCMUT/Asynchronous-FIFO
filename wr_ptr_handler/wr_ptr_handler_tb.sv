module tb;
	reg wclk = 1'b0;
	reg wrst_n = 1'b0;
	reg w_en = 1'b0;	
	wire [`PTR_WIDTH - 1 : 0] binary_wptr;
	wire [`PTR_WIDTH - 1: 0] gray_wptr;
	wire full;
	reg [`PTR_WIDTH - 1 : 0] gray_rptr = {`PTR_WIDTH{1'b0}};

	wr_ptr_handler dut(
		.wclk(wclk),
		.wrst_n(wrst_n),
		.w_en(w_en),
		.binary_wptr(binary_wptr),
		.gray_wptr(gray_wptr),
		.full(full),
		.gray_rptr(gray_rptr)
	);

	reg rst_done = 0;
	reg pass = 0;

	always #5 wclk = ~wclk;

	initial begin
		$display("START RESET");
		wrst_n = 1'b0;
		#64;
		wrst_n = 1'b1;
		$display("STOP RESET");
		@(posedge wclk);
		rst_done = 1;
	end

	initial begin
		wait(rst_done == 1);
		#1;
		w_en = 1'b1;
		repeat(15) @(posedge wclk);
		#1;
		w_en = 1'b0;
		@(posedge wclk);
		pass = 1;
	end

	initial begin
		wait(rst_done == 1);
		$monitor("Write enable: %d, Write pointer: %b (binary) %b (gray) \t|\t Read pointer: %b (gray) \t|\t full: %d", w_en, binary_wptr, gray_wptr, gray_rptr, full);
	end

	always@(*) begin
		if(pass == 1) begin
		repeat(10) @(posedge wclk);
		$display("SIMULATION PASSED !!!");
		$finish();
		end
	end

	

endmodule
