`timescale 1ns / 1ps

// Behavioral testbench for the EXISTING fft32_dit2 interface.
// Verilog-2001; add to Simulation Sources only.
// Vivado 2017.4 Simulation Settings -> Elaboration -> xelab.more_options:
// --timescale 1ns/1ps (the existing RTL modules have no timescale directive).
// Five register levels: a frame captured at edge 1 appears after edge 5.
// The reference uses iterative radix-2 DIT, not the DUT hierarchy/functions.
// Arithmetic contract: Q15, forward FFT, no normalization, per-stage
// saturation, and arithmetic truncation after each complex multiplication.

module tb_fft32_dit2;
    localparam integer N = 32;
    localparam integer LATENCY = 5;
    localparam integer NUM_FRAMES = 26;
    localparam real PI = 3.14159265358979323846;

    reg clk;
    reg rst_n;
    reg signed [15:0] x_real [0:N-1];
    reg signed [15:0] x_imag [0:N-1];
    wire signed [15:0] y_real [0:N-1];
    wire signed [15:0] y_imag [0:N-1];

    reg signed [15:0] expected_real [0:NUM_FRAMES*N-1];
    reg signed [15:0] expected_imag [0:NUM_FRAMES*N-1];
    integer ref_real [0:N-1];
    integer ref_imag [0:N-1];

    integer frame_pipe [0:LATENCY-1];
    integer drive_id;
    integer submitted;
    integer checked;
    integer errors;
    integer seed;
    integer frame;
    integer p;
    integer bin;
    integer result_id;
    integer errors_before;

    fft32_dit2 dut (
        .clk(clk),
        .rst_n(rst_n),
        .data0_in_real(x_real[0]),
        .data0_in_imag(x_imag[0]),
        .data1_in_real(x_real[1]),
        .data1_in_imag(x_imag[1]),
        .data2_in_real(x_real[2]),
        .data2_in_imag(x_imag[2]),
        .data3_in_real(x_real[3]),
        .data3_in_imag(x_imag[3]),
        .data4_in_real(x_real[4]),
        .data4_in_imag(x_imag[4]),
        .data5_in_real(x_real[5]),
        .data5_in_imag(x_imag[5]),
        .data6_in_real(x_real[6]),
        .data6_in_imag(x_imag[6]),
        .data7_in_real(x_real[7]),
        .data7_in_imag(x_imag[7]),
        .data8_in_real(x_real[8]),
        .data8_in_imag(x_imag[8]),
        .data9_in_real(x_real[9]),
        .data9_in_imag(x_imag[9]),
        .data10_in_real(x_real[10]),
        .data10_in_imag(x_imag[10]),
        .data11_in_real(x_real[11]),
        .data11_in_imag(x_imag[11]),
        .data12_in_real(x_real[12]),
        .data12_in_imag(x_imag[12]),
        .data13_in_real(x_real[13]),
        .data13_in_imag(x_imag[13]),
        .data14_in_real(x_real[14]),
        .data14_in_imag(x_imag[14]),
        .data15_in_real(x_real[15]),
        .data15_in_imag(x_imag[15]),
        .data16_in_real(x_real[16]),
        .data16_in_imag(x_imag[16]),
        .data17_in_real(x_real[17]),
        .data17_in_imag(x_imag[17]),
        .data18_in_real(x_real[18]),
        .data18_in_imag(x_imag[18]),
        .data19_in_real(x_real[19]),
        .data19_in_imag(x_imag[19]),
        .data20_in_real(x_real[20]),
        .data20_in_imag(x_imag[20]),
        .data21_in_real(x_real[21]),
        .data21_in_imag(x_imag[21]),
        .data22_in_real(x_real[22]),
        .data22_in_imag(x_imag[22]),
        .data23_in_real(x_real[23]),
        .data23_in_imag(x_imag[23]),
        .data24_in_real(x_real[24]),
        .data24_in_imag(x_imag[24]),
        .data25_in_real(x_real[25]),
        .data25_in_imag(x_imag[25]),
        .data26_in_real(x_real[26]),
        .data26_in_imag(x_imag[26]),
        .data27_in_real(x_real[27]),
        .data27_in_imag(x_imag[27]),
        .data28_in_real(x_real[28]),
        .data28_in_imag(x_imag[28]),
        .data29_in_real(x_real[29]),
        .data29_in_imag(x_imag[29]),
        .data30_in_real(x_real[30]),
        .data30_in_imag(x_imag[30]),
        .data31_in_real(x_real[31]),
        .data31_in_imag(x_imag[31]),
        .data0_out_real(y_real[0]),
        .data0_out_imag(y_imag[0]),
        .data1_out_real(y_real[1]),
        .data1_out_imag(y_imag[1]),
        .data2_out_real(y_real[2]),
        .data2_out_imag(y_imag[2]),
        .data3_out_real(y_real[3]),
        .data3_out_imag(y_imag[3]),
        .data4_out_real(y_real[4]),
        .data4_out_imag(y_imag[4]),
        .data5_out_real(y_real[5]),
        .data5_out_imag(y_imag[5]),
        .data6_out_real(y_real[6]),
        .data6_out_imag(y_imag[6]),
        .data7_out_real(y_real[7]),
        .data7_out_imag(y_imag[7]),
        .data8_out_real(y_real[8]),
        .data8_out_imag(y_imag[8]),
        .data9_out_real(y_real[9]),
        .data9_out_imag(y_imag[9]),
        .data10_out_real(y_real[10]),
        .data10_out_imag(y_imag[10]),
        .data11_out_real(y_real[11]),
        .data11_out_imag(y_imag[11]),
        .data12_out_real(y_real[12]),
        .data12_out_imag(y_imag[12]),
        .data13_out_real(y_real[13]),
        .data13_out_imag(y_imag[13]),
        .data14_out_real(y_real[14]),
        .data14_out_imag(y_imag[14]),
        .data15_out_real(y_real[15]),
        .data15_out_imag(y_imag[15]),
        .data16_out_real(y_real[16]),
        .data16_out_imag(y_imag[16]),
        .data17_out_real(y_real[17]),
        .data17_out_imag(y_imag[17]),
        .data18_out_real(y_real[18]),
        .data18_out_imag(y_imag[18]),
        .data19_out_real(y_real[19]),
        .data19_out_imag(y_imag[19]),
        .data20_out_real(y_real[20]),
        .data20_out_imag(y_imag[20]),
        .data21_out_real(y_real[21]),
        .data21_out_imag(y_imag[21]),
        .data22_out_real(y_real[22]),
        .data22_out_imag(y_imag[22]),
        .data23_out_real(y_real[23]),
        .data23_out_imag(y_imag[23]),
        .data24_out_real(y_real[24]),
        .data24_out_imag(y_imag[24]),
        .data25_out_real(y_real[25]),
        .data25_out_imag(y_imag[25]),
        .data26_out_real(y_real[26]),
        .data26_out_imag(y_imag[26]),
        .data27_out_real(y_real[27]),
        .data27_out_imag(y_imag[27]),
        .data28_out_real(y_real[28]),
        .data28_out_imag(y_imag[28]),
        .data29_out_real(y_real[29]),
        .data29_out_imag(y_imag[29]),
        .data30_out_real(y_real[30]),
        .data30_out_imag(y_imag[30]),
        .data31_out_real(y_real[31]),
        .data31_out_imag(y_imag[31])
    );

    // The XDC does NOT generate this simulation clock.
    always #5 clk = ~clk;

    function integer reverse5;
        input integer value;
        integer bit_index;
        begin
            reverse5 = 0;
            for (bit_index = 0; bit_index < 5; bit_index = bit_index + 1)
                reverse5 = (reverse5 << 1) | ((value >> bit_index) & 1);
        end
    endfunction

    // Explicit signed, wide arithmetic avoids overflow in the reference.
    function signed [15:0] saturate16;
        input signed [63:0] value;
        begin
            if (value > 64'sd32767)
                saturate16 = 16'sh7fff;
            else if (value < -64'sd32768)
                saturate16 = 16'sh8000;
            else
                saturate16 = value[15:0];
        end
    endfunction

    // Nearest-integer Q15 coefficient generation for nontrivial rotations.
    // W=1 and W=-j are handled exactly without coefficient multiplication.
    function integer coefficient_q15;
        input real value;
        real scaled;
        begin
            scaled = value * 32768.0;
            if (scaled >= 0.0)
                coefficient_q15 = $rtoi(scaled + 0.5);
            else
                coefficient_q15 = $rtoi(scaled - 0.5);
        end
    endfunction

    task calculate_reference;
        input integer id;
        integer n;
        integer span;
        integer half_span;
        integer base;
        integer j;
        integer even_index;
        integer odd_index;
        integer ar, ai, br, bi;
        integer wr, wi;
        integer tr, ti;
        reg signed [63:0] product_r;
        reg signed [63:0] product_i;
        real angle;
        begin
            for (n = 0; n < N; n = n + 1) begin
                ref_real[reverse5(n)] = $signed(x_real[n]);
                ref_imag[reverse5(n)] = $signed(x_imag[n]);
            end

            for (span = 2; span <= N; span = span * 2) begin
                half_span = span / 2;
                for (base = 0; base < N; base = base + span) begin
                    for (j = 0; j < half_span; j = j + 1) begin
                        even_index = base + j;
                        odd_index = even_index + half_span;
                        ar = ref_real[even_index];
                        ai = ref_imag[even_index];
                        br = ref_real[odd_index];
                        bi = ref_imag[odd_index];

                        if (j == 0) begin
                            tr = br;
                            ti = bi;
                        end else if (4*j == span) begin
                            // Keep +32768 here if br == -32768.
                            // The DUT saturates only AFTER A +/- (-j*B).
                            tr = bi;
                            ti = -br;
                        end else begin
                            angle = 2.0 * PI * j / span;
                            wr = coefficient_q15($cos(angle));
                            wi = coefficient_q15(-$sin(angle));
                            product_r = br * wr - bi * wi;
                            product_i = br * wi + bi * wr;
                            tr = saturate16(product_r >>> 15);
                            ti = saturate16(product_i >>> 15);
                        end

                        ref_real[even_index] = saturate16(ar + tr);
                        ref_imag[even_index] = saturate16(ai + ti);
                        ref_real[odd_index] = saturate16(ar - tr);
                        ref_imag[odd_index] = saturate16(ai - ti);
                    end
                end
            end

            for (n = 0; n < N; n = n + 1) begin
                expected_real[id*N+n] = ref_real[n];
                expected_imag[id*N+n] = ref_imag[n];
            end
        end
    endtask

    task clear_inputs;
        integer n;
        begin
            for (n = 0; n < N; n = n + 1) begin
                x_real[n] = 16'sd0;
                x_imag[n] = 16'sd0;
            end
        end
    endtask

    // Frames 0..9 are directed; 10..17 are small random complex inputs;
    // 18..25 are full-range random complex inputs exercising saturation.
    task prepare_frame;
        input integer id;
        integer n;
        begin
            clear_inputs;
            case (id)
                0: begin end
                1: begin
                    x_real[0] = 16'sd8192;
                    x_imag[0] = -16'sd4096;
                end
                2: begin
                    for (n = 0; n < N; n = n + 1) begin
                        x_real[n] = 16'sd128;
                        x_imag[n] = -16'sd64;
                    end
                end
                3: begin
                    for (n = 0; n < N; n = n + 1)
                        x_real[n] = (n % 2 == 0) ? 16'sd256 : -16'sd256;
                end
                4: begin
                    x_real[1] = 16'sd16384;
                    x_imag[1] = 16'sd8192;
                end
                5: begin
                    x_real[7] = 16'sd12288;
                    x_imag[7] = -16'sd6144;
                end
                6: begin
                    for (n = 0; n < N; n = n + 1)
                        x_real[n] = 16'sd2048;
                end
                7: begin
                    for (n = 0; n < N; n = n + 1)
                        x_real[n] = -16'sd2048;
                end
                8: begin
                    for (n = 0; n < N; n = n + 1) begin
                        x_real[n] = (n % 2 == 0) ? 16'sh7fff : 16'sh8000;
                        x_imag[n] = (n % 4 < 2) ? 16'sh8000 : 16'sh7fff;
                    end
                end
                9: begin
                    x_real[3] = 16'sh8000;
                    x_imag[3] = 16'sh8000;
                end
                default: begin
                    for (n = 0; n < N; n = n + 1) begin
                        if (id < 18) begin
                            x_real[n] = $random(seed) % 1024;
                            x_imag[n] = $random(seed) % 1024;
                        end else begin
                            x_real[n] = $random(seed);
                            x_imag[n] = $random(seed);
                        end
                    end
                end
            endcase
        end
    endtask

    // Shift tags at the same edges that capture DUT inputs.
    // Wait 1 ns before checking, so nonblocking output updates have settled.
    always @(posedge clk) begin
        if (!rst_n) begin
            for (p = 0; p < LATENCY; p = p + 1)
                frame_pipe[p] = -1;
        end else begin
            for (p = LATENCY-1; p > 0; p = p - 1)
                frame_pipe[p] = frame_pipe[p-1];
            frame_pipe[0] = drive_id;
        end

        #1;
        if (!rst_n) begin
            for (bin = 0; bin < N; bin = bin + 1) begin
                if ((y_real[bin] !== 16'sd0) ||
                    (y_imag[bin] !== 16'sd0)) begin
                    if (errors < 16)
                        $display("FAIL reset: bin=%0d at %0t", bin, $time);
                    errors = errors + 1;
                end
            end
        end else if (frame_pipe[LATENCY-1] >= 0) begin
            result_id = frame_pipe[LATENCY-1];
            errors_before = errors;
            for (bin = 0; bin < N; bin = bin + 1) begin
                if ((y_real[bin] !== expected_real[result_id*N+bin]) ||
                    (y_imag[bin] !== expected_imag[result_id*N+bin])) begin
                    if (errors < 16)
                        $display("FAIL frame=%0d bin=%0d got=(%0d,%0d) expected=(%0d,%0d)",
                            result_id, bin, $signed(y_real[bin]), $signed(y_imag[bin]),
                            $signed(expected_real[result_id*N+bin]),
                            $signed(expected_imag[result_id*N+bin]));
                    errors = errors + 1;
                end
            end
            checked = checked + 1;
            if (errors == errors_before)
                $display("PASS frame=%0d at %0t", result_id, $time);
        end
    end

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        drive_id = -1;
        submitted = 0;
        checked = 0;
        errors = 0;
        seed = 32'h13579bdf;
        clear_inputs;

        // Synchronous reset must span rising clock edges.
        repeat (3) @(negedge clk);
        rst_n = 1'b1;

        // Drive on falling edges to avoid racing the DUT's rising edges.
        // All 32 complex samples of one frame arrive together each cycle.
        for (frame = 0; frame < NUM_FRAMES; frame = frame + 1) begin
            @(negedge clk);
            prepare_frame(frame);
            calculate_reference(frame);
            drive_id = frame;
            submitted = submitted + 1;
        end

        @(negedge clk);
        drive_id = -1;
        clear_inputs;
        repeat (LATENCY+1) @(negedge clk);

        if (checked != submitted) begin
            $display("FAIL frame count: submitted=%0d checked=%0d", submitted, checked);
            errors = errors + 1;
        end

        if (errors == 0)
            $display("PASS: all %0d frames matched the Q15 reference; reset and 5-stage latency checked.", checked);
        else
            $display("FAIL: %0d mismatches/errors; checked %0d of %0d frames.", errors, checked, submitted);
        $finish;
    end

    initial begin
        #5000;
        $display("FAIL: simulation timeout");
        $finish;
    end
endmodule
