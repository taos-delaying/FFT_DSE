module fft16_dit2(
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
    input signed [15:0] data8_in_real,
    input signed [15:0] data8_in_imag,
    input signed [15:0] data9_in_real,
    input signed [15:0] data9_in_imag,
    input signed [15:0] data10_in_real,
    input signed [15:0] data10_in_imag,
    input signed [15:0] data11_in_real,
    input signed [15:0] data11_in_imag,
    input signed [15:0] data12_in_real,
    input signed [15:0] data12_in_imag,
    input signed [15:0] data13_in_real,
    input signed [15:0] data13_in_imag,
    input signed [15:0] data14_in_real,
    input signed [15:0] data14_in_imag,
    input signed [15:0] data15_in_real,
    input signed [15:0] data15_in_imag,
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
    output reg signed [15:0] data7_out_imag,
    output reg signed [15:0] data8_out_real,
    output reg signed [15:0] data8_out_imag,
    output reg signed [15:0] data9_out_real,
    output reg signed [15:0] data9_out_imag,
    output reg signed [15:0] data10_out_real,
    output reg signed [15:0] data10_out_imag,
    output reg signed [15:0] data11_out_real,
    output reg signed [15:0] data11_out_imag,
    output reg signed [15:0] data12_out_real,
    output reg signed [15:0] data12_out_imag,
    output reg signed [15:0] data13_out_real,
    output reg signed [15:0] data13_out_imag,
    output reg signed [15:0] data14_out_real,
    output reg signed [15:0] data14_out_imag,
    output reg signed [15:0] data15_out_real,
    output reg signed [15:0] data15_out_imag
);

localparam signed [15:0] sin_pi_8 = 16'sh30FC;
localparam signed [15:0] sin_3_pi_8 = 16'sh7642;
localparam signed [15:0] sin_pi_4 = 16'sh5A82;

wire signed [15:0] e0_out_real_wire;
wire signed [15:0] e0_out_imag_wire;
wire signed [15:0] e1_out_real_wire;
wire signed [15:0] e1_out_imag_wire;
wire signed [15:0] e2_out_real_wire;
wire signed [15:0] e2_out_imag_wire;
wire signed [15:0] e3_out_real_wire;
wire signed [15:0] e3_out_imag_wire;
wire signed [15:0] e4_out_real_wire;
wire signed [15:0] e4_out_imag_wire;
wire signed [15:0] e5_out_real_wire;
wire signed [15:0] e5_out_imag_wire;
wire signed [15:0] e6_out_real_wire;
wire signed [15:0] e6_out_imag_wire;
wire signed [15:0] e7_out_real_wire;
wire signed [15:0] e7_out_imag_wire;

wire signed [15:0] o0_out_real_wire;
wire signed [15:0] o0_out_imag_wire;
wire signed [15:0] o1_out_real_wire;
wire signed [15:0] o1_out_imag_wire;
wire signed [15:0] o2_out_real_wire;
wire signed [15:0] o2_out_imag_wire;
wire signed [15:0] o3_out_real_wire;
wire signed [15:0] o3_out_imag_wire;
wire signed [15:0] o4_out_real_wire;
wire signed [15:0] o4_out_imag_wire;
wire signed [15:0] o5_out_real_wire;
wire signed [15:0] o5_out_imag_wire;
wire signed [15:0] o6_out_real_wire;
wire signed [15:0] o6_out_imag_wire;
wire signed [15:0] o7_out_real_wire;
wire signed [15:0] o7_out_imag_wire;

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
wire signed [15:0] data8_out_real_wire;
wire signed [15:0] data8_out_imag_wire;
wire signed [15:0] data9_out_real_wire;
wire signed [15:0] data9_out_imag_wire;
wire signed [15:0] data10_out_real_wire;
wire signed [15:0] data10_out_imag_wire;
wire signed [15:0] data11_out_real_wire;
wire signed [15:0] data11_out_imag_wire;
wire signed [15:0] data12_out_real_wire;
wire signed [15:0] data12_out_imag_wire;
wire signed [15:0] data13_out_real_wire;
wire signed [15:0] data13_out_imag_wire;
wire signed [15:0] data14_out_real_wire;
wire signed [15:0] data14_out_imag_wire;
wire signed [15:0] data15_out_real_wire;
wire signed [15:0] data15_out_imag_wire;

fft8_dit2 fft8_dit2_inst1 (
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
    .data4_in_real(data8_in_real),
    .data4_in_imag(data8_in_imag),
    .data5_in_real(data10_in_real),
    .data5_in_imag(data10_in_imag),
    .data6_in_real(data12_in_real),
    .data6_in_imag(data12_in_imag),
    .data7_in_real(data14_in_real),
    .data7_in_imag(data14_in_imag),
    .data0_out_real(e0_out_real_wire),
    .data0_out_imag(e0_out_imag_wire),
    .data1_out_real(e1_out_real_wire),
    .data1_out_imag(e1_out_imag_wire),
    .data2_out_real(e2_out_real_wire),
    .data2_out_imag(e2_out_imag_wire),
    .data3_out_real(e3_out_real_wire),
    .data3_out_imag(e3_out_imag_wire),
    .data4_out_real(e4_out_real_wire),
    .data4_out_imag(e4_out_imag_wire),
    .data5_out_real(e5_out_real_wire),
    .data5_out_imag(e5_out_imag_wire),
    .data6_out_real(e6_out_real_wire),
    .data6_out_imag(e6_out_imag_wire),
    .data7_out_real(e7_out_real_wire),
    .data7_out_imag(e7_out_imag_wire)
);

fft8_dit2 fft8_dit2_inst2 (
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
    .data4_in_real(data9_in_real),
    .data4_in_imag(data9_in_imag),
    .data5_in_real(data11_in_real),
    .data5_in_imag(data11_in_imag),
    .data6_in_real(data13_in_real),
    .data6_in_imag(data13_in_imag),
    .data7_in_real(data15_in_real),
    .data7_in_imag(data15_in_imag),
    .data0_out_real(o0_out_real_wire),
    .data0_out_imag(o0_out_imag_wire),
    .data1_out_real(o1_out_real_wire),
    .data1_out_imag(o1_out_imag_wire),
    .data2_out_real(o2_out_real_wire),
    .data2_out_imag(o2_out_imag_wire),
    .data3_out_real(o3_out_real_wire),
    .data3_out_imag(o3_out_imag_wire),
    .data4_out_real(o4_out_real_wire),
    .data4_out_imag(o4_out_imag_wire),
    .data5_out_real(o5_out_real_wire),
    .data5_out_imag(o5_out_imag_wire),
    .data6_out_real(o6_out_real_wire),
    .data6_out_imag(o6_out_imag_wire),
    .data7_out_real(o7_out_real_wire),
    .data7_out_imag(o7_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst0 (
    .data1_in_real(e0_out_real_wire),
    .data1_in_imag(e0_out_imag_wire),
    .data2_in_real(o0_out_real_wire),
    .data2_in_imag(o0_out_imag_wire),
    .twiddle_factor_real(sin_3_pi_8),
    .twiddle_factor_imag(-sin_pi_8),
    .sel(2'b00),
    .y0_real(data0_out_real_wire),
    .y0_imag(data0_out_imag_wire),
    .y1_real(data8_out_real_wire),
    .y1_imag(data8_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst1 (
    .data1_in_real(e1_out_real_wire),
    .data1_in_imag(e1_out_imag_wire),
    .data2_in_real(o1_out_real_wire),
    .data2_in_imag(o1_out_imag_wire),
    .twiddle_factor_real(sin_3_pi_8),
    .twiddle_factor_imag(-sin_pi_8),
    .sel(2'b01),
    .y0_real(data1_out_real_wire),
    .y0_imag(data1_out_imag_wire),
    .y1_real(data9_out_real_wire),
    .y1_imag(data9_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst2 (
    .data1_in_real(e2_out_real_wire),
    .data1_in_imag(e2_out_imag_wire),
    .data2_in_real(o2_out_real_wire),
    .data2_in_imag(o2_out_imag_wire),
    .twiddle_factor_real(sin_pi_4),
    .twiddle_factor_imag(-sin_pi_4),
    .sel(2'b01),
    .y0_real(data2_out_real_wire),
    .y0_imag(data2_out_imag_wire),
    .y1_real(data10_out_real_wire),
    .y1_imag(data10_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst3 (
    .data1_in_real(e3_out_real_wire),
    .data1_in_imag(e3_out_imag_wire),
    .data2_in_real(o3_out_real_wire),
    .data2_in_imag(o3_out_imag_wire),
    .twiddle_factor_real(sin_pi_8),
    .twiddle_factor_imag(-sin_3_pi_8),
    .sel(2'b01),
    .y0_real(data3_out_real_wire),
    .y0_imag(data3_out_imag_wire),
    .y1_real(data11_out_real_wire),
    .y1_imag(data11_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst4 (
    .data1_in_real(e4_out_real_wire),
    .data1_in_imag(e4_out_imag_wire),
    .data2_in_real(o4_out_real_wire),
    .data2_in_imag(o4_out_imag_wire),
    .twiddle_factor_real(-sin_pi_8),
    .twiddle_factor_imag(-sin_3_pi_8),
    .sel(2'b10),
    .y0_real(data4_out_real_wire),
    .y0_imag(data4_out_imag_wire),
    .y1_real(data12_out_real_wire),
    .y1_imag(data12_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst5 (
    .data1_in_real(e5_out_real_wire),
    .data1_in_imag(e5_out_imag_wire),
    .data2_in_real(o5_out_real_wire),
    .data2_in_imag(o5_out_imag_wire),
    .twiddle_factor_real(-sin_pi_8),
    .twiddle_factor_imag(-sin_3_pi_8),
    .sel(2'b01),
    .y0_real(data5_out_real_wire),
    .y0_imag(data5_out_imag_wire),
    .y1_real(data13_out_real_wire),
    .y1_imag(data13_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst6 (
    .data1_in_real(e6_out_real_wire),
    .data1_in_imag(e6_out_imag_wire),
    .data2_in_real(o6_out_real_wire),
    .data2_in_imag(o6_out_imag_wire),
    .twiddle_factor_real(-sin_pi_4),
    .twiddle_factor_imag(-sin_pi_4),
    .sel(2'b01),
    .y0_real(data6_out_real_wire),
    .y0_imag(data6_out_imag_wire),
    .y1_real(data14_out_real_wire),
    .y1_imag(data14_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst7 (
    .data1_in_real(e7_out_real_wire),
    .data1_in_imag(e7_out_imag_wire),
    .data2_in_real(o7_out_real_wire),
    .data2_in_imag(o7_out_imag_wire),
    .twiddle_factor_real(-sin_3_pi_8),
    .twiddle_factor_imag(-sin_pi_8),
    .sel(2'b01),
    .y0_real(data7_out_real_wire),
    .y0_imag(data7_out_imag_wire),
    .y1_real(data15_out_real_wire),
    .y1_imag(data15_out_imag_wire)
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
        data8_out_real <= 16'd0;
        data8_out_imag <= 16'd0;
        data9_out_real <= 16'd0;
        data9_out_imag <= 16'd0;
        data10_out_real <= 16'd0;
        data10_out_imag <= 16'd0;
        data11_out_real <= 16'd0;
        data11_out_imag <= 16'd0;
        data12_out_real <= 16'd0;
        data12_out_imag <= 16'd0;
        data13_out_real <= 16'd0;
        data13_out_imag <= 16'd0;
        data14_out_real <= 16'd0;
        data14_out_imag <= 16'd0;
        data15_out_real <= 16'd0;
        data15_out_imag <= 16'd0;
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
        data8_out_real <= data8_out_real_wire;
        data8_out_imag <= data8_out_imag_wire;
        data9_out_real <= data9_out_real_wire;
        data9_out_imag <= data9_out_imag_wire;
        data10_out_real <= data10_out_real_wire;
        data10_out_imag <= data10_out_imag_wire;
        data11_out_real <= data11_out_real_wire;
        data11_out_imag <= data11_out_imag_wire;
        data12_out_real <= data12_out_real_wire;
        data12_out_imag <= data12_out_imag_wire;
        data13_out_real <= data13_out_real_wire;
        data13_out_imag <= data13_out_imag_wire;
        data14_out_real <= data14_out_real_wire;
        data14_out_imag <= data14_out_imag_wire;
        data15_out_real <= data15_out_real_wire;
        data15_out_imag <= data15_out_imag_wire;
    end

endmodule