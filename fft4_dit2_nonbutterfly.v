module fft4_dit2(
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
    output reg signed [15:0] data0_out_real,
    output reg signed [15:0] data0_out_imag,
    output reg signed [15:0] data1_out_real,
    output reg signed [15:0] data1_out_imag,
    output reg signed [15:0] data2_out_real,
    output reg signed [15:0] data2_out_imag,
    output reg signed [15:0] data3_out_real,
    output reg signed [15:0] data3_out_imag
);
`include "common_func.vh"

wire signed [15:0] e0_out_real_wire;
wire signed [15:0] e0_out_imag_wire;
wire signed [15:0] e1_out_real_wire;
wire signed [15:0] e1_out_imag_wire;

wire signed [15:0] o0_out_real_wire;
wire signed [15:0] o0_out_imag_wire;
wire signed [15:0] o1_out_real_wire;
wire signed [15:0] o1_out_imag_wire;

wire signed [16:0] data0_out_real_wire;
wire signed [16:0] data0_out_imag_wire;
wire signed [16:0] data1_out_real_wire;
wire signed [16:0] data1_out_imag_wire;
wire signed [16:0] data2_out_real_wire;
wire signed [16:0] data2_out_imag_wire;
wire signed [16:0] data3_out_real_wire;
wire signed [16:0] data3_out_imag_wire;

fft2 fft2_inst1 (
    .clk(clk),
    .rst_n(rst_n),
    .data0_in_real(data0_in_real),
    .data0_in_imag(data0_in_imag),
    .data1_in_real(data2_in_real),
    .data1_in_imag(data2_in_imag),
    .data0_out_real(e0_out_real_wire),
    .data0_out_imag(e0_out_imag_wire),
    .data1_out_real(e1_out_real_wire),
    .data1_out_imag(e1_out_imag_wire)
);

fft2 fft2_inst2 (
    .clk(clk),
    .rst_n(rst_n),
    .data0_in_real(data1_in_real),
    .data0_in_imag(data1_in_imag),
    .data1_in_real(data3_in_real),
    .data1_in_imag(data3_in_imag),
    .data0_out_real(o0_out_real_wire),
    .data0_out_imag(o0_out_imag_wire),
    .data1_out_real(o1_out_real_wire),
    .data1_out_imag(o1_out_imag_wire)
);

assign data0_out_real_wire = e0_out_real_wire + o0_out_real_wire;
assign data0_out_imag_wire = e0_out_imag_wire + o0_out_imag_wire;
assign data1_out_real_wire = e1_out_real_wire + o1_out_imag_wire;
assign data1_out_imag_wire = e1_out_imag_wire - o1_out_real_wire;
assign data2_out_real_wire = e0_out_real_wire - o0_out_real_wire;
assign data2_out_imag_wire = e0_out_imag_wire - o0_out_imag_wire;
assign data3_out_real_wire = e1_out_real_wire - o1_out_imag_wire;
assign data3_out_imag_wire = e1_out_imag_wire + o1_out_real_wire;

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
    end else begin
        data0_out_real <= sum17_to_w16(data0_out_real_wire);
        data0_out_imag <= sum17_to_w16(data0_out_imag_wire);
        data1_out_real <= sum17_to_w16(data1_out_real_wire);
        data1_out_imag <= sum17_to_w16(data1_out_imag_wire);
        data2_out_real <= sum17_to_w16(data2_out_real_wire);
        data2_out_imag <= sum17_to_w16(data2_out_imag_wire);
        data3_out_real <= sum17_to_w16(data3_out_real_wire);
        data3_out_imag <= sum17_to_w16(data3_out_imag_wire);
    end

endmodule