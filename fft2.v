module fft2 (
    input clk,
    input rst_n,
    input signed [15:0] data0_in_real,
    input signed [15:0] data0_in_imag,
    input signed [15:0] data1_in_real,
    input signed [15:0] data1_in_imag,
    output reg signed [15:0] data0_out_real,
    output reg signed [15:0] data0_out_imag,
    output reg signed [15:0] data1_out_real,
    output reg signed [15:0] data1_out_imag
);
`include "common_func.vh"

wire signed [16:0] data0_out_real_wire;
wire signed [16:0] data0_out_imag_wire;
wire signed [16:0] data1_out_real_wire;
wire signed [16:0] data1_out_imag_wire;

assign data0_out_real_wire = data0_in_real + data1_in_real;
assign data0_out_imag_wire = data0_in_imag + data1_in_imag;
assign data1_out_real_wire = data0_in_real - data1_in_real;
assign data1_out_imag_wire = data0_in_imag - data1_in_imag;

always @(posedge clk)
    if (!rst_n) begin
        //data_out_valid <= 1'b0;
        data0_out_real <= 16'd0;
        data0_out_imag <= 16'd0;
        data1_out_real <= 16'd0;
        data1_out_imag <= 16'd0;
    end else begin
        //data_out_valid <= data_valid;
        data0_out_real <= sum17_to_w16(data0_out_real_wire);
        data0_out_imag <= sum17_to_w16(data0_out_imag_wire);
        data1_out_real <= sum17_to_w16(data1_out_real_wire);
        data1_out_imag <= sum17_to_w16(data1_out_imag_wire);
    end

endmodule
