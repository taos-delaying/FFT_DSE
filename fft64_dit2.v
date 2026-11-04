module fft64_dit2(
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
    input signed [15:0] data16_in_real,
    input signed [15:0] data16_in_imag,
    input signed [15:0] data17_in_real,
    input signed [15:0] data17_in_imag,
    input signed [15:0] data18_in_real,
    input signed [15:0] data18_in_imag,
    input signed [15:0] data19_in_real,
    input signed [15:0] data19_in_imag,
    input signed [15:0] data20_in_real,
    input signed [15:0] data20_in_imag,
    input signed [15:0] data21_in_real,
    input signed [15:0] data21_in_imag,
    input signed [15:0] data22_in_real,
    input signed [15:0] data22_in_imag,
    input signed [15:0] data23_in_real,
    input signed [15:0] data23_in_imag,
    input signed [15:0] data24_in_real,
    input signed [15:0] data24_in_imag,
    input signed [15:0] data25_in_real,
    input signed [15:0] data25_in_imag,
    input signed [15:0] data26_in_real,
    input signed [15:0] data26_in_imag,
    input signed [15:0] data27_in_real,
    input signed [15:0] data27_in_imag,
    input signed [15:0] data28_in_real,
    input signed [15:0] data28_in_imag,
    input signed [15:0] data29_in_real,
    input signed [15:0] data29_in_imag,
    input signed [15:0] data30_in_real,
    input signed [15:0] data30_in_imag,
    input signed [15:0] data31_in_real,
    input signed [15:0] data31_in_imag,
    input signed [15:0] data32_in_real,
    input signed [15:0] data32_in_imag,
    input signed [15:0] data33_in_real,
    input signed [15:0] data33_in_imag,
    input signed [15:0] data34_in_real,
    input signed [15:0] data34_in_imag,
    input signed [15:0] data35_in_real,
    input signed [15:0] data35_in_imag,
    input signed [15:0] data36_in_real,
    input signed [15:0] data36_in_imag,
    input signed [15:0] data37_in_real,
    input signed [15:0] data37_in_imag,
    input signed [15:0] data38_in_real,
    input signed [15:0] data38_in_imag,
    input signed [15:0] data39_in_real,
    input signed [15:0] data39_in_imag,
    input signed [15:0] data40_in_real,
    input signed [15:0] data40_in_imag,
    input signed [15:0] data41_in_real,
    input signed [15:0] data41_in_imag,
    input signed [15:0] data42_in_real,
    input signed [15:0] data42_in_imag,
    input signed [15:0] data43_in_real,
    input signed [15:0] data43_in_imag,
    input signed [15:0] data44_in_real,
    input signed [15:0] data44_in_imag,
    input signed [15:0] data45_in_real,
    input signed [15:0] data45_in_imag,
    input signed [15:0] data46_in_real,
    input signed [15:0] data46_in_imag,
    input signed [15:0] data47_in_real,
    input signed [15:0] data47_in_imag,
    input signed [15:0] data48_in_real,
    input signed [15:0] data48_in_imag,
    input signed [15:0] data49_in_real,
    input signed [15:0] data49_in_imag,
    input signed [15:0] data50_in_real,
    input signed [15:0] data50_in_imag,
    input signed [15:0] data51_in_real,
    input signed [15:0] data51_in_imag,
    input signed [15:0] data52_in_real,
    input signed [15:0] data52_in_imag,
    input signed [15:0] data53_in_real,
    input signed [15:0] data53_in_imag,
    input signed [15:0] data54_in_real,
    input signed [15:0] data54_in_imag,
    input signed [15:0] data55_in_real,
    input signed [15:0] data55_in_imag,
    input signed [15:0] data56_in_real,
    input signed [15:0] data56_in_imag,
    input signed [15:0] data57_in_real,
    input signed [15:0] data57_in_imag,
    input signed [15:0] data58_in_real,
    input signed [15:0] data58_in_imag,
    input signed [15:0] data59_in_real,
    input signed [15:0] data59_in_imag,
    input signed [15:0] data60_in_real,
    input signed [15:0] data60_in_imag,
    input signed [15:0] data61_in_real,
    input signed [15:0] data61_in_imag,
    input signed [15:0] data62_in_real,
    input signed [15:0] data62_in_imag,
    input signed [15:0] data63_in_real,
    input signed [15:0] data63_in_imag,
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
    output reg signed [15:0] data15_out_imag,
    output reg signed [15:0] data16_out_real,
    output reg signed [15:0] data16_out_imag,
    output reg signed [15:0] data17_out_real,
    output reg signed [15:0] data17_out_imag,
    output reg signed [15:0] data18_out_real,
    output reg signed [15:0] data18_out_imag,
    output reg signed [15:0] data19_out_real,
    output reg signed [15:0] data19_out_imag,
    output reg signed [15:0] data20_out_real,
    output reg signed [15:0] data20_out_imag,
    output reg signed [15:0] data21_out_real,
    output reg signed [15:0] data21_out_imag,
    output reg signed [15:0] data22_out_real,
    output reg signed [15:0] data22_out_imag,
    output reg signed [15:0] data23_out_real,
    output reg signed [15:0] data23_out_imag,
    output reg signed [15:0] data24_out_real,
    output reg signed [15:0] data24_out_imag,
    output reg signed [15:0] data25_out_real,
    output reg signed [15:0] data25_out_imag,
    output reg signed [15:0] data26_out_real,
    output reg signed [15:0] data26_out_imag,
    output reg signed [15:0] data27_out_real,
    output reg signed [15:0] data27_out_imag,
    output reg signed [15:0] data28_out_real,
    output reg signed [15:0] data28_out_imag,
    output reg signed [15:0] data29_out_real,
    output reg signed [15:0] data29_out_imag,
    output reg signed [15:0] data30_out_real,
    output reg signed [15:0] data30_out_imag,
    output reg signed [15:0] data31_out_real,
    output reg signed [15:0] data31_out_imag,
    output reg signed [15:0] data32_out_real,
    output reg signed [15:0] data32_out_imag,
    output reg signed [15:0] data33_out_real,
    output reg signed [15:0] data33_out_imag,
    output reg signed [15:0] data34_out_real,
    output reg signed [15:0] data34_out_imag,
    output reg signed [15:0] data35_out_real,
    output reg signed [15:0] data35_out_imag,
    output reg signed [15:0] data36_out_real,
    output reg signed [15:0] data36_out_imag,
    output reg signed [15:0] data37_out_real,
    output reg signed [15:0] data37_out_imag,
    output reg signed [15:0] data38_out_real,
    output reg signed [15:0] data38_out_imag,
    output reg signed [15:0] data39_out_real,
    output reg signed [15:0] data39_out_imag,
    output reg signed [15:0] data40_out_real,
    output reg signed [15:0] data40_out_imag,
    output reg signed [15:0] data41_out_real,
    output reg signed [15:0] data41_out_imag,
    output reg signed [15:0] data42_out_real,
    output reg signed [15:0] data42_out_imag,
    output reg signed [15:0] data43_out_real,
    output reg signed [15:0] data43_out_imag,
    output reg signed [15:0] data44_out_real,
    output reg signed [15:0] data44_out_imag,
    output reg signed [15:0] data45_out_real,
    output reg signed [15:0] data45_out_imag,
    output reg signed [15:0] data46_out_real,
    output reg signed [15:0] data46_out_imag,
    output reg signed [15:0] data47_out_real,
    output reg signed [15:0] data47_out_imag,
    output reg signed [15:0] data48_out_real,
    output reg signed [15:0] data48_out_imag,
    output reg signed [15:0] data49_out_real,
    output reg signed [15:0] data49_out_imag,
    output reg signed [15:0] data50_out_real,
    output reg signed [15:0] data50_out_imag,
    output reg signed [15:0] data51_out_real,
    output reg signed [15:0] data51_out_imag,
    output reg signed [15:0] data52_out_real,
    output reg signed [15:0] data52_out_imag,
    output reg signed [15:0] data53_out_real,
    output reg signed [15:0] data53_out_imag,
    output reg signed [15:0] data54_out_real,
    output reg signed [15:0] data54_out_imag,
    output reg signed [15:0] data55_out_real,
    output reg signed [15:0] data55_out_imag,
    output reg signed [15:0] data56_out_real,
    output reg signed [15:0] data56_out_imag,
    output reg signed [15:0] data57_out_real,
    output reg signed [15:0] data57_out_imag,
    output reg signed [15:0] data58_out_real,
    output reg signed [15:0] data58_out_imag,
    output reg signed [15:0] data59_out_real,
    output reg signed [15:0] data59_out_imag,
    output reg signed [15:0] data60_out_real,
    output reg signed [15:0] data60_out_imag,
    output reg signed [15:0] data61_out_real,
    output reg signed [15:0] data61_out_imag,
    output reg signed [15:0] data62_out_real,
    output reg signed [15:0] data62_out_imag,
    output reg signed [15:0] data63_out_real,
    output reg signed [15:0] data63_out_imag
);

localparam signed [15:0] sin_pi_4 = 16'sh5A82;
localparam signed [15:0] sin_pi_8 = 16'sh30FC;
localparam signed [15:0] sin_3_pi_8 = 16'sh7642;
localparam signed [15:0] sin_pi_16 = 16'sh18F9;
localparam signed [15:0] sin_3_pi_16 = 16'sh471D;
localparam signed [15:0] sin_5_pi_16 = 16'sh6A6E;
localparam signed [15:0] sin_7_pi_16 = 16'sh7D8A;
localparam signed [15:0] sin_pi_32 = 16'sh0C8C;
localparam signed [15:0] sin_3_pi_32 = 16'sh2528;
localparam signed [15:0] sin_5_pi_32 = 16'sh3C57;
localparam signed [15:0] sin_7_pi_32 = 16'sh5134;
localparam signed [15:0] sin_9_pi_32 = 16'sh62F2;
localparam signed [15:0] sin_11_pi_32 = 16'sh70E3;
localparam signed [15:0] sin_13_pi_32 = 16'sh7A7D;
localparam signed [15:0] sin_15_pi_32 = 16'sh7F62;

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
wire signed [15:0] e8_out_real_wire;
wire signed [15:0] e8_out_imag_wire;
wire signed [15:0] e9_out_real_wire;
wire signed [15:0] e9_out_imag_wire;
wire signed [15:0] e10_out_real_wire;
wire signed [15:0] e10_out_imag_wire;
wire signed [15:0] e11_out_real_wire;
wire signed [15:0] e11_out_imag_wire;
wire signed [15:0] e12_out_real_wire;
wire signed [15:0] e12_out_imag_wire;
wire signed [15:0] e13_out_real_wire;
wire signed [15:0] e13_out_imag_wire;
wire signed [15:0] e14_out_real_wire;
wire signed [15:0] e14_out_imag_wire;
wire signed [15:0] e15_out_real_wire;
wire signed [15:0] e15_out_imag_wire;
wire signed [15:0] e16_out_real_wire;
wire signed [15:0] e16_out_imag_wire;
wire signed [15:0] e17_out_real_wire;
wire signed [15:0] e17_out_imag_wire;
wire signed [15:0] e18_out_real_wire;
wire signed [15:0] e18_out_imag_wire;
wire signed [15:0] e19_out_real_wire;
wire signed [15:0] e19_out_imag_wire;
wire signed [15:0] e20_out_real_wire;
wire signed [15:0] e20_out_imag_wire;
wire signed [15:0] e21_out_real_wire;
wire signed [15:0] e21_out_imag_wire;
wire signed [15:0] e22_out_real_wire;
wire signed [15:0] e22_out_imag_wire;
wire signed [15:0] e23_out_real_wire;
wire signed [15:0] e23_out_imag_wire;
wire signed [15:0] e24_out_real_wire;
wire signed [15:0] e24_out_imag_wire;
wire signed [15:0] e25_out_real_wire;
wire signed [15:0] e25_out_imag_wire;
wire signed [15:0] e26_out_real_wire;
wire signed [15:0] e26_out_imag_wire;
wire signed [15:0] e27_out_real_wire;
wire signed [15:0] e27_out_imag_wire;
wire signed [15:0] e28_out_real_wire;
wire signed [15:0] e28_out_imag_wire;
wire signed [15:0] e29_out_real_wire;
wire signed [15:0] e29_out_imag_wire;
wire signed [15:0] e30_out_real_wire;
wire signed [15:0] e30_out_imag_wire;
wire signed [15:0] e31_out_real_wire;
wire signed [15:0] e31_out_imag_wire;

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
wire signed [15:0] o8_out_real_wire;
wire signed [15:0] o8_out_imag_wire;
wire signed [15:0] o9_out_real_wire;
wire signed [15:0] o9_out_imag_wire;
wire signed [15:0] o10_out_real_wire;
wire signed [15:0] o10_out_imag_wire;
wire signed [15:0] o11_out_real_wire;
wire signed [15:0] o11_out_imag_wire;
wire signed [15:0] o12_out_real_wire;
wire signed [15:0] o12_out_imag_wire;
wire signed [15:0] o13_out_real_wire;
wire signed [15:0] o13_out_imag_wire;
wire signed [15:0] o14_out_real_wire;
wire signed [15:0] o14_out_imag_wire;
wire signed [15:0] o15_out_real_wire;
wire signed [15:0] o15_out_imag_wire;
wire signed [15:0] o16_out_real_wire;
wire signed [15:0] o16_out_imag_wire;
wire signed [15:0] o17_out_real_wire;
wire signed [15:0] o17_out_imag_wire;
wire signed [15:0] o18_out_real_wire;
wire signed [15:0] o18_out_imag_wire;
wire signed [15:0] o19_out_real_wire;
wire signed [15:0] o19_out_imag_wire;
wire signed [15:0] o20_out_real_wire;
wire signed [15:0] o20_out_imag_wire;
wire signed [15:0] o21_out_real_wire;
wire signed [15:0] o21_out_imag_wire;
wire signed [15:0] o22_out_real_wire;
wire signed [15:0] o22_out_imag_wire;
wire signed [15:0] o23_out_real_wire;
wire signed [15:0] o23_out_imag_wire;
wire signed [15:0] o24_out_real_wire;
wire signed [15:0] o24_out_imag_wire;
wire signed [15:0] o25_out_real_wire;
wire signed [15:0] o25_out_imag_wire;
wire signed [15:0] o26_out_real_wire;
wire signed [15:0] o26_out_imag_wire;
wire signed [15:0] o27_out_real_wire;
wire signed [15:0] o27_out_imag_wire;
wire signed [15:0] o28_out_real_wire;
wire signed [15:0] o28_out_imag_wire;
wire signed [15:0] o29_out_real_wire;
wire signed [15:0] o29_out_imag_wire;
wire signed [15:0] o30_out_real_wire;
wire signed [15:0] o30_out_imag_wire;
wire signed [15:0] o31_out_real_wire;
wire signed [15:0] o31_out_imag_wire;

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
wire signed [15:0] data16_out_real_wire;
wire signed [15:0] data16_out_imag_wire;
wire signed [15:0] data17_out_real_wire;
wire signed [15:0] data17_out_imag_wire;
wire signed [15:0] data18_out_real_wire;
wire signed [15:0] data18_out_imag_wire;
wire signed [15:0] data19_out_real_wire;
wire signed [15:0] data19_out_imag_wire;
wire signed [15:0] data20_out_real_wire;
wire signed [15:0] data20_out_imag_wire;
wire signed [15:0] data21_out_real_wire;
wire signed [15:0] data21_out_imag_wire;
wire signed [15:0] data22_out_real_wire;
wire signed [15:0] data22_out_imag_wire;
wire signed [15:0] data23_out_real_wire;
wire signed [15:0] data23_out_imag_wire;
wire signed [15:0] data24_out_real_wire;
wire signed [15:0] data24_out_imag_wire;
wire signed [15:0] data25_out_real_wire;
wire signed [15:0] data25_out_imag_wire;
wire signed [15:0] data26_out_real_wire;
wire signed [15:0] data26_out_imag_wire;
wire signed [15:0] data27_out_real_wire;
wire signed [15:0] data27_out_imag_wire;
wire signed [15:0] data28_out_real_wire;
wire signed [15:0] data28_out_imag_wire;
wire signed [15:0] data29_out_real_wire;
wire signed [15:0] data29_out_imag_wire;
wire signed [15:0] data30_out_real_wire;
wire signed [15:0] data30_out_imag_wire;
wire signed [15:0] data31_out_real_wire;
wire signed [15:0] data31_out_imag_wire;
wire signed [15:0] data32_out_real_wire;
wire signed [15:0] data32_out_imag_wire;
wire signed [15:0] data33_out_real_wire;
wire signed [15:0] data33_out_imag_wire;
wire signed [15:0] data34_out_real_wire;
wire signed [15:0] data34_out_imag_wire;
wire signed [15:0] data35_out_real_wire;
wire signed [15:0] data35_out_imag_wire;
wire signed [15:0] data36_out_real_wire;
wire signed [15:0] data36_out_imag_wire;
wire signed [15:0] data37_out_real_wire;
wire signed [15:0] data37_out_imag_wire;
wire signed [15:0] data38_out_real_wire;
wire signed [15:0] data38_out_imag_wire;
wire signed [15:0] data39_out_real_wire;
wire signed [15:0] data39_out_imag_wire;
wire signed [15:0] data40_out_real_wire;
wire signed [15:0] data40_out_imag_wire;
wire signed [15:0] data41_out_real_wire;
wire signed [15:0] data41_out_imag_wire;
wire signed [15:0] data42_out_real_wire;
wire signed [15:0] data42_out_imag_wire;
wire signed [15:0] data43_out_real_wire;
wire signed [15:0] data43_out_imag_wire;
wire signed [15:0] data44_out_real_wire;
wire signed [15:0] data44_out_imag_wire;
wire signed [15:0] data45_out_real_wire;
wire signed [15:0] data45_out_imag_wire;
wire signed [15:0] data46_out_real_wire;
wire signed [15:0] data46_out_imag_wire;
wire signed [15:0] data47_out_real_wire;
wire signed [15:0] data47_out_imag_wire;
wire signed [15:0] data48_out_real_wire;
wire signed [15:0] data48_out_imag_wire;
wire signed [15:0] data49_out_real_wire;
wire signed [15:0] data49_out_imag_wire;
wire signed [15:0] data50_out_real_wire;
wire signed [15:0] data50_out_imag_wire;
wire signed [15:0] data51_out_real_wire;
wire signed [15:0] data51_out_imag_wire;
wire signed [15:0] data52_out_real_wire;
wire signed [15:0] data52_out_imag_wire;
wire signed [15:0] data53_out_real_wire;
wire signed [15:0] data53_out_imag_wire;
wire signed [15:0] data54_out_real_wire;
wire signed [15:0] data54_out_imag_wire;
wire signed [15:0] data55_out_real_wire;
wire signed [15:0] data55_out_imag_wire;
wire signed [15:0] data56_out_real_wire;
wire signed [15:0] data56_out_imag_wire;
wire signed [15:0] data57_out_real_wire;
wire signed [15:0] data57_out_imag_wire;
wire signed [15:0] data58_out_real_wire;
wire signed [15:0] data58_out_imag_wire;
wire signed [15:0] data59_out_real_wire;
wire signed [15:0] data59_out_imag_wire;
wire signed [15:0] data60_out_real_wire;
wire signed [15:0] data60_out_imag_wire;
wire signed [15:0] data61_out_real_wire;
wire signed [15:0] data61_out_imag_wire;
wire signed [15:0] data62_out_real_wire;
wire signed [15:0] data62_out_imag_wire;
wire signed [15:0] data63_out_real_wire;
wire signed [15:0] data63_out_imag_wire;

fft32_dit2 fft32_dit2_inst1 (
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
    .data8_in_real(data16_in_real),
    .data8_in_imag(data16_in_imag),
    .data9_in_real(data18_in_real),
    .data9_in_imag(data18_in_imag),
    .data10_in_real(data20_in_real),
    .data10_in_imag(data20_in_imag),
    .data11_in_real(data22_in_real),
    .data11_in_imag(data22_in_imag),
    .data12_in_real(data24_in_real),
    .data12_in_imag(data24_in_imag),
    .data13_in_real(data26_in_real),
    .data13_in_imag(data26_in_imag),
    .data14_in_real(data28_in_real),
    .data14_in_imag(data28_in_imag),
    .data15_in_real(data30_in_real),
    .data15_in_imag(data30_in_imag),
    .data16_in_real(data32_in_real),
    .data16_in_imag(data32_in_imag),
    .data17_in_real(data34_in_real),
    .data17_in_imag(data34_in_imag),
    .data18_in_real(data36_in_real),
    .data18_in_imag(data36_in_imag),
    .data19_in_real(data38_in_real),
    .data19_in_imag(data38_in_imag),
    .data20_in_real(data40_in_real),
    .data20_in_imag(data40_in_imag),
    .data21_in_real(data42_in_real),
    .data21_in_imag(data42_in_imag),
    .data22_in_real(data44_in_real),
    .data22_in_imag(data44_in_imag),
    .data23_in_real(data46_in_real),
    .data23_in_imag(data46_in_imag),
    .data24_in_real(data48_in_real),
    .data24_in_imag(data48_in_imag),
    .data25_in_real(data50_in_real),
    .data25_in_imag(data50_in_imag),
    .data26_in_real(data52_in_real),
    .data26_in_imag(data52_in_imag),
    .data27_in_real(data54_in_real),
    .data27_in_imag(data54_in_imag),
    .data28_in_real(data56_in_real),
    .data28_in_imag(data56_in_imag),
    .data29_in_real(data58_in_real),
    .data29_in_imag(data58_in_imag),
    .data30_in_real(data60_in_real),
    .data30_in_imag(data60_in_imag),
    .data31_in_real(data62_in_real),
    .data31_in_imag(data62_in_imag),
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
    .data7_out_imag(e7_out_imag_wire),
    .data8_out_real(e8_out_real_wire),
    .data8_out_imag(e8_out_imag_wire),
    .data9_out_real(e9_out_real_wire),
    .data9_out_imag(e9_out_imag_wire),
    .data10_out_real(e10_out_real_wire),
    .data10_out_imag(e10_out_imag_wire),
    .data11_out_real(e11_out_real_wire),
    .data11_out_imag(e11_out_imag_wire),
    .data12_out_real(e12_out_real_wire),
    .data12_out_imag(e12_out_imag_wire),
    .data13_out_real(e13_out_real_wire),
    .data13_out_imag(e13_out_imag_wire),
    .data14_out_real(e14_out_real_wire),
    .data14_out_imag(e14_out_imag_wire),
    .data15_out_real(e15_out_real_wire),
    .data15_out_imag(e15_out_imag_wire),
    .data16_out_real(e16_out_real_wire),
    .data16_out_imag(e16_out_imag_wire),
    .data17_out_real(e17_out_real_wire),
    .data17_out_imag(e17_out_imag_wire),
    .data18_out_real(e18_out_real_wire),
    .data18_out_imag(e18_out_imag_wire),
    .data19_out_real(e19_out_real_wire),
    .data19_out_imag(e19_out_imag_wire),
    .data20_out_real(e20_out_real_wire),
    .data20_out_imag(e20_out_imag_wire),
    .data21_out_real(e21_out_real_wire),
    .data21_out_imag(e21_out_imag_wire),
    .data22_out_real(e22_out_real_wire),
    .data22_out_imag(e22_out_imag_wire),
    .data23_out_real(e23_out_real_wire),
    .data23_out_imag(e23_out_imag_wire),
    .data24_out_real(e24_out_real_wire),
    .data24_out_imag(e24_out_imag_wire),
    .data25_out_real(e25_out_real_wire),
    .data25_out_imag(e25_out_imag_wire),
    .data26_out_real(e26_out_real_wire),
    .data26_out_imag(e26_out_imag_wire),
    .data27_out_real(e27_out_real_wire),
    .data27_out_imag(e27_out_imag_wire),
    .data28_out_real(e28_out_real_wire),
    .data28_out_imag(e28_out_imag_wire),
    .data29_out_real(e29_out_real_wire),
    .data29_out_imag(e29_out_imag_wire),
    .data30_out_real(e30_out_real_wire),
    .data30_out_imag(e30_out_imag_wire),
    .data31_out_real(e31_out_real_wire),
    .data31_out_imag(e31_out_imag_wire)
);

fft32_dit2 fft32_dit2_inst2 (
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
    .data8_in_real(data17_in_real),
    .data8_in_imag(data17_in_imag),
    .data9_in_real(data19_in_real),
    .data9_in_imag(data19_in_imag),
    .data10_in_real(data21_in_real),
    .data10_in_imag(data21_in_imag),
    .data11_in_real(data23_in_real),
    .data11_in_imag(data23_in_imag),
    .data12_in_real(data25_in_real),
    .data12_in_imag(data25_in_imag),
    .data13_in_real(data27_in_real),
    .data13_in_imag(data27_in_imag),
    .data14_in_real(data29_in_real),
    .data14_in_imag(data29_in_imag),
    .data15_in_real(data31_in_real),
    .data15_in_imag(data31_in_imag),
    .data16_in_real(data33_in_real),
    .data16_in_imag(data33_in_imag),
    .data17_in_real(data35_in_real),
    .data17_in_imag(data35_in_imag),
    .data18_in_real(data37_in_real),
    .data18_in_imag(data37_in_imag),
    .data19_in_real(data39_in_real),
    .data19_in_imag(data39_in_imag),
    .data20_in_real(data41_in_real),
    .data20_in_imag(data41_in_imag),
    .data21_in_real(data43_in_real),
    .data21_in_imag(data43_in_imag),
    .data22_in_real(data45_in_real),
    .data22_in_imag(data45_in_imag),
    .data23_in_real(data47_in_real),
    .data23_in_imag(data47_in_imag),
    .data24_in_real(data49_in_real),
    .data24_in_imag(data49_in_imag),
    .data25_in_real(data51_in_real),
    .data25_in_imag(data51_in_imag),
    .data26_in_real(data53_in_real),
    .data26_in_imag(data53_in_imag),
    .data27_in_real(data55_in_real),
    .data27_in_imag(data55_in_imag),
    .data28_in_real(data57_in_real),
    .data28_in_imag(data57_in_imag),
    .data29_in_real(data59_in_real),
    .data29_in_imag(data59_in_imag),
    .data30_in_real(data61_in_real),
    .data30_in_imag(data61_in_imag),
    .data31_in_real(data63_in_real),
    .data31_in_imag(data63_in_imag),
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
    .data7_out_imag(o7_out_imag_wire),
    .data8_out_real(o8_out_real_wire),
    .data8_out_imag(o8_out_imag_wire),
    .data9_out_real(o9_out_real_wire),
    .data9_out_imag(o9_out_imag_wire),
    .data10_out_real(o10_out_real_wire),
    .data10_out_imag(o10_out_imag_wire),
    .data11_out_real(o11_out_real_wire),
    .data11_out_imag(o11_out_imag_wire),
    .data12_out_real(o12_out_real_wire),
    .data12_out_imag(o12_out_imag_wire),
    .data13_out_real(o13_out_real_wire),
    .data13_out_imag(o13_out_imag_wire),
    .data14_out_real(o14_out_real_wire),
    .data14_out_imag(o14_out_imag_wire),
    .data15_out_real(o15_out_real_wire),
    .data15_out_imag(o15_out_imag_wire),
    .data16_out_real(o16_out_real_wire),
    .data16_out_imag(o16_out_imag_wire),
    .data17_out_real(o17_out_real_wire),
    .data17_out_imag(o17_out_imag_wire),
    .data18_out_real(o18_out_real_wire),
    .data18_out_imag(o18_out_imag_wire),
    .data19_out_real(o19_out_real_wire),
    .data19_out_imag(o19_out_imag_wire),
    .data20_out_real(o20_out_real_wire),
    .data20_out_imag(o20_out_imag_wire),
    .data21_out_real(o21_out_real_wire),
    .data21_out_imag(o21_out_imag_wire),
    .data22_out_real(o22_out_real_wire),
    .data22_out_imag(o22_out_imag_wire),
    .data23_out_real(o23_out_real_wire),
    .data23_out_imag(o23_out_imag_wire),
    .data24_out_real(o24_out_real_wire),
    .data24_out_imag(o24_out_imag_wire),
    .data25_out_real(o25_out_real_wire),
    .data25_out_imag(o25_out_imag_wire),
    .data26_out_real(o26_out_real_wire),
    .data26_out_imag(o26_out_imag_wire),
    .data27_out_real(o27_out_real_wire),
    .data27_out_imag(o27_out_imag_wire),
    .data28_out_real(o28_out_real_wire),
    .data28_out_imag(o28_out_imag_wire),
    .data29_out_real(o29_out_real_wire),
    .data29_out_imag(o29_out_imag_wire),
    .data30_out_real(o30_out_real_wire),
    .data30_out_imag(o30_out_imag_wire),
    .data31_out_real(o31_out_real_wire),
    .data31_out_imag(o31_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst0 (
    .data1_in_real(e0_out_real_wire),
    .data1_in_imag(e0_out_imag_wire),
    .data2_in_real(o0_out_real_wire),
    .data2_in_imag(o0_out_imag_wire),
    .twiddle_factor_real(sin_15_pi_32),
    .twiddle_factor_imag(-sin_pi_32),
    .sel(2'b00),
    .y0_real(data0_out_real_wire),
    .y0_imag(data0_out_imag_wire),
    .y1_real(data32_out_real_wire),
    .y1_imag(data32_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst1 (
    .data1_in_real(e1_out_real_wire),
    .data1_in_imag(e1_out_imag_wire),
    .data2_in_real(o1_out_real_wire),
    .data2_in_imag(o1_out_imag_wire),
    .twiddle_factor_real(sin_15_pi_32),
    .twiddle_factor_imag(-sin_pi_32),
    .sel(2'b01),
    .y0_real(data1_out_real_wire),
    .y0_imag(data1_out_imag_wire),
    .y1_real(data33_out_real_wire),
    .y1_imag(data33_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst2 (
    .data1_in_real(e2_out_real_wire),
    .data1_in_imag(e2_out_imag_wire),
    .data2_in_real(o2_out_real_wire),
    .data2_in_imag(o2_out_imag_wire),
    .twiddle_factor_real(sin_7_pi_16),
    .twiddle_factor_imag(-sin_pi_16),
    .sel(2'b01),
    .y0_real(data2_out_real_wire),
    .y0_imag(data2_out_imag_wire),
    .y1_real(data34_out_real_wire),
    .y1_imag(data34_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst3 (
    .data1_in_real(e3_out_real_wire),
    .data1_in_imag(e3_out_imag_wire),
    .data2_in_real(o3_out_real_wire),
    .data2_in_imag(o3_out_imag_wire),
    .twiddle_factor_real(sin_13_pi_32),
    .twiddle_factor_imag(-sin_3_pi_32),
    .sel(2'b01),
    .y0_real(data3_out_real_wire),
    .y0_imag(data3_out_imag_wire),
    .y1_real(data35_out_real_wire),
    .y1_imag(data35_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst4 (
    .data1_in_real(e4_out_real_wire),
    .data1_in_imag(e4_out_imag_wire),
    .data2_in_real(o4_out_real_wire),
    .data2_in_imag(o4_out_imag_wire),
    .twiddle_factor_real(sin_3_pi_8),
    .twiddle_factor_imag(-sin_pi_8),
    .sel(2'b01),
    .y0_real(data4_out_real_wire),
    .y0_imag(data4_out_imag_wire),
    .y1_real(data36_out_real_wire),
    .y1_imag(data36_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst5 (
    .data1_in_real(e5_out_real_wire),
    .data1_in_imag(e5_out_imag_wire),
    .data2_in_real(o5_out_real_wire),
    .data2_in_imag(o5_out_imag_wire),
    .twiddle_factor_real(sin_11_pi_32),
    .twiddle_factor_imag(-sin_5_pi_32),
    .sel(2'b01),
    .y0_real(data5_out_real_wire),
    .y0_imag(data5_out_imag_wire),
    .y1_real(data37_out_real_wire),
    .y1_imag(data37_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst6 (
    .data1_in_real(e6_out_real_wire),
    .data1_in_imag(e6_out_imag_wire),
    .data2_in_real(o6_out_real_wire),
    .data2_in_imag(o6_out_imag_wire),
    .twiddle_factor_real(sin_5_pi_16),
    .twiddle_factor_imag(-sin_3_pi_16),
    .sel(2'b01),
    .y0_real(data6_out_real_wire),
    .y0_imag(data6_out_imag_wire),
    .y1_real(data38_out_real_wire),
    .y1_imag(data38_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst7 (
    .data1_in_real(e7_out_real_wire),
    .data1_in_imag(e7_out_imag_wire),
    .data2_in_real(o7_out_real_wire),
    .data2_in_imag(o7_out_imag_wire),
    .twiddle_factor_real(sin_9_pi_32),
    .twiddle_factor_imag(-sin_7_pi_32),
    .sel(2'b01),
    .y0_real(data7_out_real_wire),
    .y0_imag(data7_out_imag_wire),
    .y1_real(data39_out_real_wire),
    .y1_imag(data39_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst8 (
    .data1_in_real(e8_out_real_wire),
    .data1_in_imag(e8_out_imag_wire),
    .data2_in_real(o8_out_real_wire),
    .data2_in_imag(o8_out_imag_wire),
    .twiddle_factor_real(sin_pi_4),
    .twiddle_factor_imag(-sin_pi_4),
    .sel(2'b01),
    .y0_real(data8_out_real_wire),
    .y0_imag(data8_out_imag_wire),
    .y1_real(data40_out_real_wire),
    .y1_imag(data40_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst9 (
    .data1_in_real(e9_out_real_wire),
    .data1_in_imag(e9_out_imag_wire),
    .data2_in_real(o9_out_real_wire),
    .data2_in_imag(o9_out_imag_wire),
    .twiddle_factor_real(sin_7_pi_32),
    .twiddle_factor_imag(-sin_9_pi_32),
    .sel(2'b01),
    .y0_real(data9_out_real_wire),
    .y0_imag(data9_out_imag_wire),
    .y1_real(data41_out_real_wire),
    .y1_imag(data41_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst10 (
    .data1_in_real(e10_out_real_wire),
    .data1_in_imag(e10_out_imag_wire),
    .data2_in_real(o10_out_real_wire),
    .data2_in_imag(o10_out_imag_wire),
    .twiddle_factor_real(sin_3_pi_16),
    .twiddle_factor_imag(-sin_5_pi_16),
    .sel(2'b01),
    .y0_real(data10_out_real_wire),
    .y0_imag(data10_out_imag_wire),
    .y1_real(data42_out_real_wire),
    .y1_imag(data42_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst11 (
    .data1_in_real(e11_out_real_wire),
    .data1_in_imag(e11_out_imag_wire),
    .data2_in_real(o11_out_real_wire),
    .data2_in_imag(o11_out_imag_wire),
    .twiddle_factor_real(sin_5_pi_32),
    .twiddle_factor_imag(-sin_11_pi_32),
    .sel(2'b01),
    .y0_real(data11_out_real_wire),
    .y0_imag(data11_out_imag_wire),
    .y1_real(data43_out_real_wire),
    .y1_imag(data43_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst12 (
    .data1_in_real(e12_out_real_wire),
    .data1_in_imag(e12_out_imag_wire),
    .data2_in_real(o12_out_real_wire),
    .data2_in_imag(o12_out_imag_wire),
    .twiddle_factor_real(sin_pi_8),
    .twiddle_factor_imag(-sin_3_pi_8),
    .sel(2'b01),
    .y0_real(data12_out_real_wire),
    .y0_imag(data12_out_imag_wire),
    .y1_real(data44_out_real_wire),
    .y1_imag(data44_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst13 (
    .data1_in_real(e13_out_real_wire),
    .data1_in_imag(e13_out_imag_wire),
    .data2_in_real(o13_out_real_wire),
    .data2_in_imag(o13_out_imag_wire),
    .twiddle_factor_real(sin_3_pi_32),
    .twiddle_factor_imag(-sin_13_pi_32),
    .sel(2'b01),
    .y0_real(data13_out_real_wire),
    .y0_imag(data13_out_imag_wire),
    .y1_real(data45_out_real_wire),
    .y1_imag(data45_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst14 (
    .data1_in_real(e14_out_real_wire),
    .data1_in_imag(e14_out_imag_wire),
    .data2_in_real(o14_out_real_wire),
    .data2_in_imag(o14_out_imag_wire),
    .twiddle_factor_real(sin_pi_16),
    .twiddle_factor_imag(-sin_7_pi_16),
    .sel(2'b01),
    .y0_real(data14_out_real_wire),
    .y0_imag(data14_out_imag_wire),
    .y1_real(data46_out_real_wire),
    .y1_imag(data46_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst15 (
    .data1_in_real(e15_out_real_wire),
    .data1_in_imag(e15_out_imag_wire),
    .data2_in_real(o15_out_real_wire),
    .data2_in_imag(o15_out_imag_wire),
    .twiddle_factor_real(sin_pi_32),
    .twiddle_factor_imag(-sin_15_pi_32),
    .sel(2'b01),
    .y0_real(data15_out_real_wire),
    .y0_imag(data15_out_imag_wire),
    .y1_real(data47_out_real_wire),
    .y1_imag(data47_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst16 (
    .data1_in_real(e16_out_real_wire),
    .data1_in_imag(e16_out_imag_wire),
    .data2_in_real(o16_out_real_wire),
    .data2_in_imag(o16_out_imag_wire),
    .twiddle_factor_real(-sin_pi_32),
    .twiddle_factor_imag(-sin_15_pi_32),
    .sel(2'b10),
    .y0_real(data16_out_real_wire),
    .y0_imag(data16_out_imag_wire),
    .y1_real(data48_out_real_wire),
    .y1_imag(data48_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst17 (
    .data1_in_real(e17_out_real_wire),
    .data1_in_imag(e17_out_imag_wire),
    .data2_in_real(o17_out_real_wire),
    .data2_in_imag(o17_out_imag_wire),
    .twiddle_factor_real(-sin_pi_32),
    .twiddle_factor_imag(-sin_15_pi_32),
    .sel(2'b01),
    .y0_real(data17_out_real_wire),
    .y0_imag(data17_out_imag_wire),
    .y1_real(data49_out_real_wire),
    .y1_imag(data49_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst18 (
    .data1_in_real(e18_out_real_wire),
    .data1_in_imag(e18_out_imag_wire),
    .data2_in_real(o18_out_real_wire),
    .data2_in_imag(o18_out_imag_wire),
    .twiddle_factor_real(-sin_pi_16),
    .twiddle_factor_imag(-sin_7_pi_16),
    .sel(2'b01),
    .y0_real(data18_out_real_wire),
    .y0_imag(data18_out_imag_wire),
    .y1_real(data50_out_real_wire),
    .y1_imag(data50_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst19 (
    .data1_in_real(e19_out_real_wire),
    .data1_in_imag(e19_out_imag_wire),
    .data2_in_real(o19_out_real_wire),
    .data2_in_imag(o19_out_imag_wire),
    .twiddle_factor_real(-sin_3_pi_32),
    .twiddle_factor_imag(-sin_13_pi_32),
    .sel(2'b01),
    .y0_real(data19_out_real_wire),
    .y0_imag(data19_out_imag_wire),
    .y1_real(data51_out_real_wire),
    .y1_imag(data51_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst20 (
    .data1_in_real(e20_out_real_wire),
    .data1_in_imag(e20_out_imag_wire),
    .data2_in_real(o20_out_real_wire),
    .data2_in_imag(o20_out_imag_wire),
    .twiddle_factor_real(-sin_pi_8),
    .twiddle_factor_imag(-sin_3_pi_8),
    .sel(2'b01),
    .y0_real(data20_out_real_wire),
    .y0_imag(data20_out_imag_wire),
    .y1_real(data52_out_real_wire),
    .y1_imag(data52_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst21 (
    .data1_in_real(e21_out_real_wire),
    .data1_in_imag(e21_out_imag_wire),
    .data2_in_real(o21_out_real_wire),
    .data2_in_imag(o21_out_imag_wire),
    .twiddle_factor_real(-sin_5_pi_32),
    .twiddle_factor_imag(-sin_11_pi_32),
    .sel(2'b01),
    .y0_real(data21_out_real_wire),
    .y0_imag(data21_out_imag_wire),
    .y1_real(data53_out_real_wire),
    .y1_imag(data53_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst22 (
    .data1_in_real(e22_out_real_wire),
    .data1_in_imag(e22_out_imag_wire),
    .data2_in_real(o22_out_real_wire),
    .data2_in_imag(o22_out_imag_wire),
    .twiddle_factor_real(-sin_3_pi_16),
    .twiddle_factor_imag(-sin_5_pi_16),
    .sel(2'b01),
    .y0_real(data22_out_real_wire),
    .y0_imag(data22_out_imag_wire),
    .y1_real(data54_out_real_wire),
    .y1_imag(data54_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst23 (
    .data1_in_real(e23_out_real_wire),
    .data1_in_imag(e23_out_imag_wire),
    .data2_in_real(o23_out_real_wire),
    .data2_in_imag(o23_out_imag_wire),
    .twiddle_factor_real(-sin_7_pi_32),
    .twiddle_factor_imag(-sin_9_pi_32),
    .sel(2'b01),
    .y0_real(data23_out_real_wire),
    .y0_imag(data23_out_imag_wire),
    .y1_real(data55_out_real_wire),
    .y1_imag(data55_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst24 (
    .data1_in_real(e24_out_real_wire),
    .data1_in_imag(e24_out_imag_wire),
    .data2_in_real(o24_out_real_wire),
    .data2_in_imag(o24_out_imag_wire),
    .twiddle_factor_real(-sin_pi_4),
    .twiddle_factor_imag(-sin_pi_4),
    .sel(2'b01),
    .y0_real(data24_out_real_wire),
    .y0_imag(data24_out_imag_wire),
    .y1_real(data56_out_real_wire),
    .y1_imag(data56_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst25 (
    .data1_in_real(e25_out_real_wire),
    .data1_in_imag(e25_out_imag_wire),
    .data2_in_real(o25_out_real_wire),
    .data2_in_imag(o25_out_imag_wire),
    .twiddle_factor_real(-sin_9_pi_32),
    .twiddle_factor_imag(-sin_7_pi_32),
    .sel(2'b01),
    .y0_real(data25_out_real_wire),
    .y0_imag(data25_out_imag_wire),
    .y1_real(data57_out_real_wire),
    .y1_imag(data57_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst26 (
    .data1_in_real(e26_out_real_wire),
    .data1_in_imag(e26_out_imag_wire),
    .data2_in_real(o26_out_real_wire),
    .data2_in_imag(o26_out_imag_wire),
    .twiddle_factor_real(-sin_5_pi_16),
    .twiddle_factor_imag(-sin_3_pi_16),
    .sel(2'b01),
    .y0_real(data26_out_real_wire),
    .y0_imag(data26_out_imag_wire),
    .y1_real(data58_out_real_wire),
    .y1_imag(data58_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst27 (
    .data1_in_real(e27_out_real_wire),
    .data1_in_imag(e27_out_imag_wire),
    .data2_in_real(o27_out_real_wire),
    .data2_in_imag(o27_out_imag_wire),
    .twiddle_factor_real(-sin_11_pi_32),
    .twiddle_factor_imag(-sin_5_pi_32),
    .sel(2'b01),
    .y0_real(data27_out_real_wire),
    .y0_imag(data27_out_imag_wire),
    .y1_real(data59_out_real_wire),
    .y1_imag(data59_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst28 (
    .data1_in_real(e28_out_real_wire),
    .data1_in_imag(e28_out_imag_wire),
    .data2_in_real(o28_out_real_wire),
    .data2_in_imag(o28_out_imag_wire),
    .twiddle_factor_real(-sin_3_pi_8),
    .twiddle_factor_imag(-sin_pi_8),
    .sel(2'b01),
    .y0_real(data28_out_real_wire),
    .y0_imag(data28_out_imag_wire),
    .y1_real(data60_out_real_wire),
    .y1_imag(data60_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst29 (
    .data1_in_real(e29_out_real_wire),
    .data1_in_imag(e29_out_imag_wire),
    .data2_in_real(o29_out_real_wire),
    .data2_in_imag(o29_out_imag_wire),
    .twiddle_factor_real(-sin_13_pi_32),
    .twiddle_factor_imag(-sin_3_pi_32),
    .sel(2'b01),
    .y0_real(data29_out_real_wire),
    .y0_imag(data29_out_imag_wire),
    .y1_real(data61_out_real_wire),
    .y1_imag(data61_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst30 (
    .data1_in_real(e30_out_real_wire),
    .data1_in_imag(e30_out_imag_wire),
    .data2_in_real(o30_out_real_wire),
    .data2_in_imag(o30_out_imag_wire),
    .twiddle_factor_real(-sin_7_pi_16),
    .twiddle_factor_imag(-sin_pi_16),
    .sel(2'b01),
    .y0_real(data30_out_real_wire),
    .y0_imag(data30_out_imag_wire),
    .y1_real(data62_out_real_wire),
    .y1_imag(data62_out_imag_wire)
);

butterfly_radix2_dit butterfly_inst31 (
    .data1_in_real(e31_out_real_wire),
    .data1_in_imag(e31_out_imag_wire),
    .data2_in_real(o31_out_real_wire),
    .data2_in_imag(o31_out_imag_wire),
    .twiddle_factor_real(-sin_15_pi_32),
    .twiddle_factor_imag(-sin_pi_32),
    .sel(2'b01),
    .y0_real(data31_out_real_wire),
    .y0_imag(data31_out_imag_wire),
    .y1_real(data63_out_real_wire),
    .y1_imag(data63_out_imag_wire)
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
        data16_out_real <= 16'd0;
        data16_out_imag <= 16'd0;
        data17_out_real <= 16'd0;
        data17_out_imag <= 16'd0;
        data18_out_real <= 16'd0;
        data18_out_imag <= 16'd0;
        data19_out_real <= 16'd0;
        data19_out_imag <= 16'd0;
        data20_out_real <= 16'd0;
        data20_out_imag <= 16'd0;
        data21_out_real <= 16'd0;
        data21_out_imag <= 16'd0;
        data22_out_real <= 16'd0;
        data22_out_imag <= 16'd0;
        data23_out_real <= 16'd0;
        data23_out_imag <= 16'd0;
        data24_out_real <= 16'd0;
        data24_out_imag <= 16'd0;
        data25_out_real <= 16'd0;
        data25_out_imag <= 16'd0;
        data26_out_real <= 16'd0;
        data26_out_imag <= 16'd0;
        data27_out_real <= 16'd0;
        data27_out_imag <= 16'd0;
        data28_out_real <= 16'd0;
        data28_out_imag <= 16'd0;
        data29_out_real <= 16'd0;
        data29_out_imag <= 16'd0;
        data30_out_real <= 16'd0;
        data30_out_imag <= 16'd0;
        data31_out_real <= 16'd0;
        data31_out_imag <= 16'd0;
        data32_out_real <= 16'd0;
        data32_out_imag <= 16'd0;
        data33_out_real <= 16'd0;
        data33_out_imag <= 16'd0;
        data34_out_real <= 16'd0;
        data34_out_imag <= 16'd0;
        data35_out_real <= 16'd0;
        data35_out_imag <= 16'd0;
        data36_out_real <= 16'd0;
        data36_out_imag <= 16'd0;
        data37_out_real <= 16'd0;
        data37_out_imag <= 16'd0;
        data38_out_real <= 16'd0;
        data38_out_imag <= 16'd0;
        data39_out_real <= 16'd0;
        data39_out_imag <= 16'd0;
        data40_out_real <= 16'd0;
        data40_out_imag <= 16'd0;
        data41_out_real <= 16'd0;
        data41_out_imag <= 16'd0;
        data42_out_real <= 16'd0;
        data42_out_imag <= 16'd0;
        data43_out_real <= 16'd0;
        data43_out_imag <= 16'd0;
        data44_out_real <= 16'd0;
        data44_out_imag <= 16'd0;
        data45_out_real <= 16'd0;
        data45_out_imag <= 16'd0;
        data46_out_real <= 16'd0;
        data46_out_imag <= 16'd0;
        data47_out_real <= 16'd0;
        data47_out_imag <= 16'd0;
        data48_out_real <= 16'd0;
        data48_out_imag <= 16'd0;
        data49_out_real <= 16'd0;
        data49_out_imag <= 16'd0;
        data50_out_real <= 16'd0;
        data50_out_imag <= 16'd0;
        data51_out_real <= 16'd0;
        data51_out_imag <= 16'd0;
        data52_out_real <= 16'd0;
        data52_out_imag <= 16'd0;
        data53_out_real <= 16'd0;
        data53_out_imag <= 16'd0;
        data54_out_real <= 16'd0;
        data54_out_imag <= 16'd0;
        data55_out_real <= 16'd0;
        data55_out_imag <= 16'd0;
        data56_out_real <= 16'd0;
        data56_out_imag <= 16'd0;
        data57_out_real <= 16'd0;
        data57_out_imag <= 16'd0;
        data58_out_real <= 16'd0;
        data58_out_imag <= 16'd0;
        data59_out_real <= 16'd0;
        data59_out_imag <= 16'd0;
        data60_out_real <= 16'd0;
        data60_out_imag <= 16'd0;
        data61_out_real <= 16'd0;
        data61_out_imag <= 16'd0;
        data62_out_real <= 16'd0;
        data62_out_imag <= 16'd0;
        data63_out_real <= 16'd0;
        data63_out_imag <= 16'd0;
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
        data16_out_real <= data16_out_real_wire;
        data16_out_imag <= data16_out_imag_wire;
        data17_out_real <= data17_out_real_wire;
        data17_out_imag <= data17_out_imag_wire;
        data18_out_real <= data18_out_real_wire;
        data18_out_imag <= data18_out_imag_wire;
        data19_out_real <= data19_out_real_wire;
        data19_out_imag <= data19_out_imag_wire;
        data20_out_real <= data20_out_real_wire;
        data20_out_imag <= data20_out_imag_wire;
        data21_out_real <= data21_out_real_wire;
        data21_out_imag <= data21_out_imag_wire;
        data22_out_real <= data22_out_real_wire;
        data22_out_imag <= data22_out_imag_wire;
        data23_out_real <= data23_out_real_wire;
        data23_out_imag <= data23_out_imag_wire;
        data24_out_real <= data24_out_real_wire;
        data24_out_imag <= data24_out_imag_wire;
        data25_out_real <= data25_out_real_wire;
        data25_out_imag <= data25_out_imag_wire;
        data26_out_real <= data26_out_real_wire;
        data26_out_imag <= data26_out_imag_wire;
        data27_out_real <= data27_out_real_wire;
        data27_out_imag <= data27_out_imag_wire;
        data28_out_real <= data28_out_real_wire;
        data28_out_imag <= data28_out_imag_wire;
        data29_out_real <= data29_out_real_wire;
        data29_out_imag <= data29_out_imag_wire;
        data30_out_real <= data30_out_real_wire;
        data30_out_imag <= data30_out_imag_wire;
        data31_out_real <= data31_out_real_wire;
        data31_out_imag <= data31_out_imag_wire;
        data32_out_real <= data32_out_real_wire;
        data32_out_imag <= data32_out_imag_wire;
        data33_out_real <= data33_out_real_wire;
        data33_out_imag <= data33_out_imag_wire;
        data34_out_real <= data34_out_real_wire;
        data34_out_imag <= data34_out_imag_wire;
        data35_out_real <= data35_out_real_wire;
        data35_out_imag <= data35_out_imag_wire;
        data36_out_real <= data36_out_real_wire;
        data36_out_imag <= data36_out_imag_wire;
        data37_out_real <= data37_out_real_wire;
        data37_out_imag <= data37_out_imag_wire;
        data38_out_real <= data38_out_real_wire;
        data38_out_imag <= data38_out_imag_wire;
        data39_out_real <= data39_out_real_wire;
        data39_out_imag <= data39_out_imag_wire;
        data40_out_real <= data40_out_real_wire;
        data40_out_imag <= data40_out_imag_wire;
        data41_out_real <= data41_out_real_wire;
        data41_out_imag <= data41_out_imag_wire;
        data42_out_real <= data42_out_real_wire;
        data42_out_imag <= data42_out_imag_wire;
        data43_out_real <= data43_out_real_wire;
        data43_out_imag <= data43_out_imag_wire;
        data44_out_real <= data44_out_real_wire;
        data44_out_imag <= data44_out_imag_wire;
        data45_out_real <= data45_out_real_wire;
        data45_out_imag <= data45_out_imag_wire;
        data46_out_real <= data46_out_real_wire;
        data46_out_imag <= data46_out_imag_wire;
        data47_out_real <= data47_out_real_wire;
        data47_out_imag <= data47_out_imag_wire;
        data48_out_real <= data48_out_real_wire;
        data48_out_imag <= data48_out_imag_wire;
        data49_out_real <= data49_out_real_wire;
        data49_out_imag <= data49_out_imag_wire;
        data50_out_real <= data50_out_real_wire;
        data50_out_imag <= data50_out_imag_wire;
        data51_out_real <= data51_out_real_wire;
        data51_out_imag <= data51_out_imag_wire;
        data52_out_real <= data52_out_real_wire;
        data52_out_imag <= data52_out_imag_wire;
        data53_out_real <= data53_out_real_wire;
        data53_out_imag <= data53_out_imag_wire;
        data54_out_real <= data54_out_real_wire;
        data54_out_imag <= data54_out_imag_wire;
        data55_out_real <= data55_out_real_wire;
        data55_out_imag <= data55_out_imag_wire;
        data56_out_real <= data56_out_real_wire;
        data56_out_imag <= data56_out_imag_wire;
        data57_out_real <= data57_out_real_wire;
        data57_out_imag <= data57_out_imag_wire;
        data58_out_real <= data58_out_real_wire;
        data58_out_imag <= data58_out_imag_wire;
        data59_out_real <= data59_out_real_wire;
        data59_out_imag <= data59_out_imag_wire;
        data60_out_real <= data60_out_real_wire;
        data60_out_imag <= data60_out_imag_wire;
        data61_out_real <= data61_out_real_wire;
        data61_out_imag <= data61_out_imag_wire;
        data62_out_real <= data62_out_real_wire;
        data62_out_imag <= data62_out_imag_wire;
        data63_out_real <= data63_out_real_wire;
        data63_out_imag <= data63_out_imag_wire;
    end

endmodule
