module butterfly_radix2_dit(//得到的计算结果是（A+-WB）/2，A和B是输入数据，W是旋转因子
    input signed [15:0] data1_in_real,
    input signed [15:0] data1_in_imag,
    input signed [15:0] data2_in_real,
    input signed [15:0] data2_in_imag,
    input signed [15:0] twiddle_factor_real,
    input signed [15:0] twiddle_factor_imag,
    input [1:0] sel,
    output reg signed [15:0] y0_real,
    output reg signed [15:0] y0_imag,
    output reg signed [15:0] y1_real,
    output reg signed [15:0] y1_imag
);

`include "common_func.vh"

wire signed [33:0] data1_in_real_q30 = {{3{data1_in_real[15]}}, data1_in_real, 15'b0};
wire signed [33:0] data1_in_imag_q30 = {{3{data1_in_imag[15]}}, data1_in_imag, 15'b0};

wire signed [32:0] product_real;
wire signed [32:0] product_imag;

wire signed [33:0] y0_real_w34;
wire signed [33:0] y0_imag_w34;
wire signed [33:0] y1_real_w34;
wire signed [33:0] y1_imag_w34;

assign product_real = data2_in_real * twiddle_factor_real - data2_in_imag * twiddle_factor_imag;
assign product_imag = data2_in_real * twiddle_factor_imag + data2_in_imag * twiddle_factor_real;

assign y0_real_w34 = data1_in_real_q30 + product_real;
assign y0_imag_w34 = data1_in_imag_q30 + product_imag;
assign y1_real_w34 = data1_in_real_q30 - product_real;
assign y1_imag_w34 = data1_in_imag_q30 - product_imag;

always @(*) begin
    case (sel)
        2'b00: begin
            // k=0, no twiddle factor multiplication
            y0_real = sum17_to_w16_div2(data1_in_real + data2_in_real);
            y0_imag = sum17_to_w16_div2(data1_in_imag + data2_in_imag);
            y1_real = sum17_to_w16_div2(data1_in_real - data2_in_real);
            y1_imag = sum17_to_w16_div2(data1_in_imag - data2_in_imag);
        end
        2'b01: begin
            // common situation
            y0_real = sum34_to_w16_div2(y0_real_w34);
            y0_imag = sum34_to_w16_div2(y0_imag_w34);
            y1_real = sum34_to_w16_div2(y1_real_w34);
            y1_imag = sum34_to_w16_div2(y1_imag_w34);
        end
        2'b10: begin
            // k=N/4, twiddle factor = -j
            y0_real = sum17_to_w16_div2(data1_in_real + data2_in_imag);
            y0_imag = sum17_to_w16_div2(data1_in_imag - data2_in_real);
            y1_real = sum17_to_w16_div2(data1_in_real - data2_in_imag);
            y1_imag = sum17_to_w16_div2(data1_in_imag + data2_in_real);
        end
        default: begin
            // Default case, no operation
            y0_real = 16'sd0;
            y0_imag = 16'sd0;
            y1_real = 16'sd0;
            y1_imag = 16'sd0;
        end
    endcase
end

endmodule