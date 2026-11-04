module fft8_dit2(
    input clk,
    input rst_n,
    input signed [15:0] data0_in_real,
    input signed [15:0] data0_in_imag,
    input signed [15:0] data1_in_real,
    input signed [15:0] data1_in_imag,
    input signed [15:0] data2_in_real,
    input signed [15:0] data2_in_imag,
    input signed [15:0] data3_in_real,
    input signed [15:0] data3_in_imag,
    input signed [15:0] data4_in_real,
    input signed [15:0] data4_in_imag,
    input signed [15:0] data5_in_real,
    input signed [15:0] data5_in_imag,
    input signed [15:0] data6_in_real,
    input signed [15:0] data6_in_imag,
    input signed [15:0] data7_in_real,
    input signed [15:0] data7_in_imag,
    output reg signed [15:0] data0_out_real,
    output reg signed [15:0] data0_out_imag,
    output reg signed [15:0] data1_out_real,
    output reg signed [15:0] data1_out_imag,
    output reg signed [15:0] data2_out_real,
    output reg signed [15:0] data2_out_imag,
    output reg signed [15:0] data3_out_real,
    output reg signed [15:0] data3_out_imag,
    output reg signed [15:0] data4_out_real,
    output reg signed [15:0] data4_out_imag,
    output reg signed [15:0] data5_out_real,
    output reg signed [15:0] data5_out_imag,
    output reg signed [15:0] data6_out_real,
    output reg signed [15:0] data6_out_imag,
    output reg signed [15:0] data7_out_real,
    output reg signed [15:0] data7_out_imag
);

localparam signed [15:0] twiddle_factor = 16'sd23170; // 0.7071067811865476 in Q15 format

wire signed [15:0] e0_out_real_wire;
wire signed [15:0] e0_out_imag_wire;
wire signed [15:0] e1_out_real_wire;
wire signed [15:0] e1_out_imag_wire;
wire signed [15:0] e2_out_real_wire;
wire signed [15:0] e2_out_imag_wire;
wire signed [15:0] e3_out_real_wire;
wire signed [15:0] e3_out_imag_wire;

wire signed [15:0] o0_out_real_wire;
wire signed [15:0] o0_out_imag_wire;
wire signed [15:0] o1_out_real_wire;
wire signed [15:0] o1_out_imag_wire;
wire signed [15:0] o2_out_real_wire;
wire signed [15:0] o2_out_imag_wire;
wire signed [15:0] o3_out_real_wire;
wire signed [15:0] o3_out_imag_wire;

wire signed [15:0] data0_out_real_wire;
wire signed [15:0] data0_out_imag_wire;
wire signed [15:0] data1_out_real_wire;
wire signed [15:0] data1_out_imag_wire;
wire signed [15:0] data2_out_real_wire;
wire signed [15:0] data2_out_imag_wire;
wire signed [15:0] data3_out_real_wire;
wire signed [15:0] data3_out_imag_wire;
wire signed [15:0] data4_out_real_wire;
wire signed [15:0] data4_out_imag_wire;
wire signed [15:0] data5_out_real_wire;
wire signed [15:0] data5_out_imag_wire;
wire signed [15:0] data6_out_real_wire;
wire signed [15:0] data6_out_imag_wire;
wire signed [15:0] data7_out_real_wire;
wire signed [15:0] data7_out_imag_wire;

fft4_dit4 fft4_dit4_inst1 (
    .clk(clk),
    .rst_n(rst_n),
    .data0_in_real(data0_in_real),
    .data0_in_imag(data0_in_imag),
    .data1_in_real(data2_in_real),
    .data1_in_imag(data2_in_imag),
    .data2_in_real(data4_in_real),
    .data2_in_imag(data4_in_imag),
    .data3_in_real(data6_in_real),
    .data3_in_imag(data6_in_imag),
    .data0_out_real(e0_out_real_wire),
    .data0_out_imag(e0_out_imag_wire),
    .data1_out_real(e1_out_real_wire),
    .data1_out_imag(e1_out_imag_wire),
    .data2_out_real(e2_out_real_wire),
    .data2_out_imag(e2_out_imag_wire),
    .data3_out_real(e3_out_real_wire),
    .data3_out_imag(e3_out_imag_wire)
);

fft4_dit4 fft4_dit4_inst2 (
    .clk(clk),
    .rst_n(rst_n),
    .data0_in_real(data1_in_real),
    .data0_in_imag(data1_in_imag),
    .data1_in_real(data3_in_real),
    .data1_in_imag(data3_in_imag),
    .data2_in_real(data5_in_real),
    .data2_in_imag(data5_in_imag),
    .data3_in_real(data7_in_real),
    .data3_in_imag(data7_in_imag),
    .data0_out_real(o0_out_real_wire),
    .data0_out_imag(o0_out_imag_wire),
    .data1_out_real(o1_out_real_wire),
    .data1_out_imag(o1_out_imag_wire),
    .data2_out_real(o2_out_real_wire),
    .data2_out_imag(o2_out_imag_wire),
    .data3_out_real(o3_out_real_wire),
    .data3_out_imag(o3_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst1 (
    .data1_in_real(e0_out_real_wire),
    .data1_in_imag(e0_out_imag_wire),
    .data2_in_real(o0_out_real_wire),
    .data2_in_imag(o0_out_imag_wire),
    .twiddle_factor_real(twiddle_factor),
    .twiddle_factor_imag(-twiddle_factor),
    .sel(2'b00),
    .y0_real(data0_out_real_wire),
    .y0_imag(data0_out_imag_wire),
    .y1_real(data4_out_real_wire),
    .y1_imag(data4_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst2 (
    .data1_in_real(e1_out_real_wire),
    .data1_in_imag(e1_out_imag_wire),
    .data2_in_real(o1_out_real_wire),
    .data2_in_imag(o1_out_imag_wire),
    .twiddle_factor_real(twiddle_factor),
    .twiddle_factor_imag(-twiddle_factor),
    .sel(2'b01),
    .y0_real(data1_out_real_wire),
    .y0_imag(data1_out_imag_wire),
    .y1_real(data5_out_real_wire),
    .y1_imag(data5_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst3 (
    .data1_in_real(e2_out_real_wire),
    .data1_in_imag(e2_out_imag_wire),
    .data2_in_real(o2_out_real_wire),
    .data2_in_imag(o2_out_imag_wire),
    .twiddle_factor_real(-twiddle_factor),
    .twiddle_factor_imag(-twiddle_factor),
    .sel(2'b10),
    .y0_real(data2_out_real_wire),
    .y0_imag(data2_out_imag_wire),
    .y1_real(data6_out_real_wire),
    .y1_imag(data6_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst4 (
    .data1_in_real(e3_out_real_wire),
    .data1_in_imag(e3_out_imag_wire),
    .data2_in_real(o3_out_real_wire),
    .data2_in_imag(o3_out_imag_wire),
    .twiddle_factor_real(-twiddle_factor),
    .twiddle_factor_imag(-twiddle_factor),
    .sel(2'b01),
    .y0_real(data3_out_real_wire),
    .y0_imag(data3_out_imag_wire),
    .y1_real(data7_out_real_wire),
    .y1_imag(data7_out_imag_wire)
);

always @(posedge clk)
    if (!rst_n) begin
        data0_out_real <= 16'd0;
        data0_out_imag <= 16'd0;
        data1_out_real <= 16'd0;
        data1_out_imag <= 16'd0;
        data2_out_real <= 16'd0;
        data2_out_imag <= 16'd0;
        data3_out_real <= 16'd0;
        data3_out_imag <= 16'd0;
        data4_out_real <= 16'd0;
        data4_out_imag <= 16'd0;
        data5_out_real <= 16'd0;
        data5_out_imag <= 16'd0;
        data6_out_real <= 16'd0;
        data6_out_imag <= 16'd0;
        data7_out_real <= 16'd0;
        data7_out_imag <= 16'd0;
    end else begin
        data0_out_real <= data0_out_real_wire;
        data0_out_imag <= data0_out_imag_wire;
        data1_out_real <= data1_out_real_wire;
        data1_out_imag <= data1_out_imag_wire;
        data2_out_real <= data2_out_real_wire;
        data2_out_imag <= data2_out_imag_wire;
        data3_out_real <= data3_out_real_wire;
        data3_out_imag <= data3_out_imag_wire;
        data4_out_real <= data4_out_real_wire;
        data4_out_imag <= data4_out_imag_wire;
        data5_out_real <= data5_out_real_wire;
        data5_out_imag <= data5_out_imag_wire;
        data6_out_real <= data6_out_real_wire;
        data6_out_imag <= data6_out_imag_wire;
        data7_out_real <= data7_out_real_wire;
        data7_out_imag <= data7_out_imag_wire;
    end


endmodule