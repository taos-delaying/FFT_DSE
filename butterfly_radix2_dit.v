module butterfly_radix2_dit(
    input signed [15:0] data1_in_real,
    input signed [15:0] data1_in_imag,
    input signed [15:0] data2_in_real,
    input signed [15:0] data2_in_imag,
    input signed [15:0] twiddle_factor_real,
    input signed [15:0] twiddle_factor_imag,
    input [1:0] sel,
    output signed [15:0] y0_real,
    output signed [15:0] y0_imag,
    output signed [15:0] y1_real,
    output signed [15:0] y1_imag
);

`include "common_func.vh"

wire signed [32:0] product_real;
wire signed [32:0] product_imag;

reg signed [16:0] y0_real_w17;
reg signed [16:0] y0_imag_w17;
reg signed [16:0] y1_real_w17;
reg signed [16:0] y1_imag_w17;

assign product_real = data2_in_real * twiddle_factor_real - data2_in_imag * twiddle_factor_imag;
assign product_imag = data2_in_real * twiddle_factor_imag + data2_in_imag * twiddle_factor_real;

always @(*) begin
    case (sel)
        2'b00: begin
            // k=0, no twiddle factor multiplication
            y0_real_w17 = data1_in_real + data2_in_real;
            y0_imag_w17 = data1_in_imag + data2_in_imag;
            y1_real_w17 = data1_in_real - data2_in_real;
            y1_imag_w17 = data1_in_imag - data2_in_imag;
        end
        2'b01: begin
            // common situation
            y0_real_w17 = data1_in_real + sum33_to_w16(product_real);
            y0_imag_w17 = data1_in_imag + sum33_to_w16(product_imag);
            y1_real_w17 = data1_in_real - sum33_to_w16(product_real);
            y1_imag_w17 = data1_in_imag - sum33_to_w16(product_imag);
        end
        2'b10: begin
            // k=N/4, twiddle factor = -j
            y0_real_w17 = data1_in_real + data2_in_imag;
            y0_imag_w17 = data1_in_imag - data2_in_real;
            y1_real_w17 = data1_in_real - data2_in_imag;
            y1_imag_w17 = data1_in_imag + data2_in_real;
        end
        default: begin
            // Default case, no operation
            y0_real_w17 = 16'sd0;
            y0_imag_w17 = 16'sd0;
            y1_real_w17 = 16'sd0;
            y1_imag_w17 = 16'sd0;
        end
    endcase
end

assign y0_real = sum17_to_w16(y0_real_w17);
assign y0_imag = sum17_to_w16(y0_imag_w17);
assign y1_real = sum17_to_w16(y1_real_w17);
assign y1_imag = sum17_to_w16(y1_imag_w17);

endmodule