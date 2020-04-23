module array_tb ();
	
	localparam M = 64,
			   N = 64,
			   P = 64,
			   SIZE = 4,
			   WIDTH = 16,
			   ACC_WIDTH = 81;

	reg clock;
	reg reset;

	reg [WIDTH-1:0] io_A_in [0:SIZE-1];
	reg [WIDTH-1:0] io_B_in [0:SIZE-1];
	reg io_C_in_zero [0:SIZE-1];
	reg io_C_in_nan [0:SIZE-1];
	reg [ACC_WIDTH-1:0] io_C_in [0:SIZE-1];
	reg io_prop_in [0:SIZE-1];
	wire io_C_out_zero [0:SIZE-1];
	wire io_C_out_nan [0:SIZE-1];
	wire [ACC_WIDTH-1:0] io_C_out [0:SIZE-1];

	initial begin
		integer i;
		clock = 0;
		reset = 0;
	end

	always begin
		#(`CLOCK_PERIOD / 2) clock = ~clock;
	end

	reg [WIDTH-1:0] A [0:N-1][0:P-1];
	reg [WIDTH-1:0] B [0:M-1][0:N-1];
	reg [ACC_WIDTH-1:0] C [0:M-1][0:P-1];
	reg C_zero [0:M-1][0:P-1];
	reg C_nan [0:M-1][0:P-1];
	reg [ACC_WIDTH-1:0] C_gold [0:M-1][0:P-1];

	task tile;
		input [WIDTH-1:0] A [0:N-1][0:P-1];
		input [WIDTH-1:0] B [0:M-1][0:N-1];
		input [ACC_WIDTH-1:0] C [0:M-1][0:P-1];
		input C_zero [0:M-1][0:P-1];
		input C_nan [0:M-1][0:P-1];
		output [WIDTH-1:0] A_tiled [0:(N-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
		output [WIDTH-1:0] B_tiled [0:(M-1)/SIZE][0:(N-1)/SIZE][0:SIZE-1][0:SIZE-1];
		output [ACC_WIDTH-1:0] C_tiled [0:(M-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
		output C_zero_tiled [0:(M-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
		output C_nan_tiled [0:(M-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
		begin
			integer i, j, p, q;
			for (p = 0; p < (N-1)/SIZE+1; p = p + 1) begin
				for (q = 0; q < (P-1)/SIZE+1; q = q + 1) begin
					for (i = 0; i < SIZE; i = i + 1) begin
						for (j = 0; j < SIZE; j = j + 1) begin
							A_tiled[p][q][i][j] = A[p*SIZE+i][q*SIZE+j];
						end
					end
				end
			end
			for (p = 0; p < (M-1)/SIZE+1; p = p + 1) begin
				for (q = 0; q < (N-1)/SIZE+1; q = q + 1) begin
					for (i = 0; i < SIZE; i = i + 1) begin
						for (j = 0; j < SIZE; j = j + 1) begin
							B_tiled[p][q][i][j] = B[p*SIZE+i][q*SIZE+j];
						end
					end
				end
			end
			for (p = 0; p < (M-1)/SIZE+1; p = p + 1) begin
				for (q = 0; q < (P-1)/SIZE+1; q = q + 1) begin
					for (i = 0; i < SIZE; i = i + 1) begin
						for (j = 0; j < SIZE; j = j + 1) begin
							C_tiled[p][q][i][j] = C[p*SIZE+i][q*SIZE+j];
							C_zero_tiled[p][q][i][j] = C_zero[p*SIZE+i][q*SIZE+j];
							C_nan_tiled[p][q][i][j] = C_nan[p*SIZE+i][q*SIZE+j];
						end
					end
				end
			end
		end
	endtask

	task tiled_matmul;
		input [WIDTH-1:0] A [0:N-1][0:P-1];
		input [WIDTH-1:0] B [0:M-1][0:N-1];
		input [ACC_WIDTH-1:0] C_init [0:M-1][0:P-1];
		input C_zero_init [0:M-1][0:P-1];
		input C_nan_init [0:M-1][0:P-1];
		output [ACC_WIDTH-1:0] C [0:M-1][0:P-1];
		output C_zero [0:M-1][0:P-1];
		output C_nan [0:M-1][0:P-1];
		begin
			integer m, n, i, j, p, q;
			reg [WIDTH-1:0] A_tiled [0:(N-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
			reg [WIDTH-1:0] B_tiled [0:(M-1)/SIZE][0:(N-1)/SIZE][0:SIZE-1][0:SIZE-1];
			reg [ACC_WIDTH-1:0] C_tiled [0:(M-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
			reg C_zero_tiled [0:(M-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];
			reg C_nan_tiled [0:(M-1)/SIZE][0:(P-1)/SIZE][0:SIZE-1][0:SIZE-1];

			$write("Multiplying matrix A:\n");
			for (i = 0; i < N; i = i + 1) begin
				for (j = 0; j < P; j = j + 1) begin
					$write("%h ", A[i][j]);
				end
				$write("\n");
			end

			$write("By matrix B:\n");
			for (i = 0; i < M; i = i + 1) begin
				for (j = 0; j < N; j = j + 1) begin
					$write("%h ", B[i][j]);
				end
				$write("\n");
			end

			tile(A, B, C_init, C_zero_init, C_nan_init, A_tiled, B_tiled, C_tiled, C_zero_tiled, C_nan_tiled);

			for (n = 0; n < (N-1)/SIZE+1; n = n + 1) begin
				for (p = 0; p < (P-1)/SIZE+1; p = p + 1) begin
					load_A(A_tiled[n][p]);
					for (m = 0; m < (M-1)/SIZE+1; m = m + 1) begin
						single_matmul(B_tiled[m][n], C_zero_tiled[m][p], C_nan_tiled[m][p], C_tiled[m][p], C_zero_tiled[m][p], C_nan_tiled[m][p], C_tiled[m][p]);
					end
				end
			end

			for (p = 0; p < (M-1)/SIZE+1; p = p + 1) begin
				for (q = 0; q < (P-1)/SIZE+1; q = q + 1) begin
					for (i = 0; i < SIZE; i = i + 1) begin
						for (j = 0; j < SIZE; j = j + 1) begin
							C[p*SIZE+i][q*SIZE+j] = C_tiled[p][q][i][j];
							C_zero[p*SIZE+i][q*SIZE+j] = C_zero_tiled[p][q][i][j];
							C_nan[p*SIZE+i][q*SIZE+j] = C_nan_tiled[p][q][i][j];
						end
					end
				end
			end

			$write("Gives result C:\n");
			for (i = 0; i < M; i = i + 1) begin
				for (j = 0; j < P; j = j + 1) begin
					$write("%h ", C_zero[i][j] || C_nan[i][j] ? 0 : C[i][j]);
				end
				$write("\n");
			end
			
		end
	endtask
	
	task load_A;
		input [WIDTH-1:0] A_in [0:SIZE-1][0:SIZE-1];
		begin
			integer i, j;
			for (i = 0; i < 2 * SIZE - 1; i = i + 1) begin
				for (j = 0; j < SIZE; j = j + 1) begin
					io_A_in[j] = (i - j >= 0 && i - j < SIZE) ? A_in[SIZE - 1 - i + j][j] : 0;
					io_prop_in[j] = (i - j >= 0 && i - j < SIZE) ? 0 : 1;
				end
				@(negedge clock);
			end
		end
	endtask

	task single_matmul;
		input [WIDTH-1:0] B_in [0:SIZE-1][0:SIZE-1];
		input C_in_zero [0:SIZE-1][0:SIZE-1];
		input C_in_nan [0:SIZE-1][0:SIZE-1];
		input [ACC_WIDTH-1:0] C_in [0:SIZE-1][0:SIZE-1];
		output C_out_zero [0:SIZE-1][0:SIZE-1];
		output C_out_nan [0:SIZE-1][0:SIZE-1];
		output [ACC_WIDTH-1:0] C_out [0:SIZE-1][0:SIZE-1];
		begin
			integer i, j;
			fork
				begin
					for (j = 0; j < SIZE; j = j + 1) begin
						io_A_in[j] = 0;
						io_prop_in[j] = 1;
					end
					for (i = 0; i < 2 * SIZE - 1; i = i + 1) begin
						for (j = 0; j < SIZE; j = j + 1) begin
							io_B_in[j] = (i - j >= 0 && i - j < SIZE) ? B_in[i - j][j] : 0;
							io_C_in_zero[j] = (i - j >= 0 && i - j < SIZE) ? C_in_zero[i - j][j] : 0;
							io_C_in_nan[j] = (i - j >= 0 && i - j < SIZE) ? C_in_nan[i - j][j] : 0;
							io_C_in[j] = (i - j >= 0 && i - j < SIZE) ? C_in[i - j][j] : 0;
						end
						@(negedge clock);
					end
					for (j = 0; j < SIZE; j = j + 1) begin
						io_B_in[j] = 0;
					end
				end
				begin
					integer i, j;
					repeat (SIZE) @(negedge clock);
					for (i = 0; i < 2 * SIZE - 1; i = i + 1) begin
						for (j = 0; j < SIZE; j = j + 1) begin
							if (i - j >= 0 && i - j < SIZE) begin
								C_out_zero[i - j][j] = io_C_out_zero[j];
								C_out_nan[i - j][j] = io_C_out_nan[j];
								C_out[i - j][j] = io_C_out[j];
							end
						end
						@(negedge clock);
					end
				end
			join
		end
	endtask

	function check_result;
		input [ACC_WIDTH-1:0] C [0:M-1][0:P-1];
		input [ACC_WIDTH-1:0] C_gold [0:M-1][0:P-1];
		begin
			integer i, j;
			reg result = 1;
			for (i = 0; i < M; i = i + 1) begin
				for (j = 0; j < P; j = j + 1) begin
					if (C[i][j] !== C_gold[i][j]) begin
						result = 0;
					end else begin
						result = result & 1;
					end
				end
			end
			check_result = result;
		end
	endfunction

	initial begin
		$vcdpluson;
		$vcdplusmemon;
		$readmemh("../../src/A_init.hex", A);
		$readmemh("../../src/B_init.hex", B);
		$readmemh("../../src/C_init.hex", C);
		$readmemh("../../src/C_zero_init.hex", C_zero);
		$readmemh("../../src/C_nan_init.hex", C_nan);
		$readmemh("../../src/C_gold.hex", C_gold);
		tiled_matmul(A, B, C, C_zero, C_nan, C, C_zero, C_nan);
		if (check_result(C, C_gold) == 1) begin
			$display("Passed");
		end else begin
			$display("Failed");
		end
		$finish();
	end
/*
	always @ (posedge clock) begin
		integer i;
		for (i = 0; i < SIZE; i = i + 1) begin
			$write("%h ", io_C_out[i]);
		end
		$write("\n");
	end
*/
	linearPositArray dut (
		.clock(clock),
		.reset(reset),
		.io_A_in_0(io_A_in[0]),
		.io_A_in_1(io_A_in[1]),
		.io_A_in_2(io_A_in[2]),
		.io_A_in_3(io_A_in[3]),
		.io_B_in_0(io_B_in[0]),
		.io_B_in_1(io_B_in[1]),
		.io_B_in_2(io_B_in[2]),
		.io_B_in_3(io_B_in[3]),
		.io_C_in_0_zero(io_C_in_zero[0]),
		.io_C_in_0_nan(io_C_in_nan[0]),
		.io_C_in_0_number(io_C_in[0]),
		.io_C_in_1_zero(io_C_in_zero[1]),
		.io_C_in_1_nan(io_C_in_nan[1]),
		.io_C_in_1_number(io_C_in[1]),
		.io_C_in_2_zero(io_C_in_zero[2]),
		.io_C_in_2_nan(io_C_in_nan[2]),
		.io_C_in_2_number(io_C_in[2]),
		.io_C_in_3_zero(io_C_in_zero[3]),
		.io_C_in_3_nan(io_C_in_nan[3]),
		.io_C_in_3_number(io_C_in[3]),
		.io_prop_in_0(io_prop_in[0]),
		.io_prop_in_1(io_prop_in[1]),
		.io_prop_in_2(io_prop_in[2]),
		.io_prop_in_3(io_prop_in[3]),
		.io_C_out_0_zero(io_C_out_zero[0]),
		.io_C_out_0_nan(io_C_out_nan[0]),
		.io_C_out_0_number(io_C_out[0]),
		.io_C_out_1_zero(io_C_out_zero[1]),
		.io_C_out_1_nan(io_C_out_nan[1]),
		.io_C_out_1_number(io_C_out[1]),
		.io_C_out_2_zero(io_C_out_zero[2]),
		.io_C_out_2_nan(io_C_out_nan[2]),
		.io_C_out_2_number(io_C_out[2]),
		.io_C_out_3_zero(io_C_out_zero[3]),
		.io_C_out_3_nan(io_C_out_nan[3]),
		.io_C_out_3_number(io_C_out[3])
	);

	initial begin
		#100000;
		$finish();
	end

endmodule
