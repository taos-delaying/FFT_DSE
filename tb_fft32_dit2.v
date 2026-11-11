`timescale 1ns / 1ps

// Functional and post-implementation timing testbench for fft32_dit2.
// Add to Simulation Sources only.
// Use xelab --timescale 1ns/1ps with Vivado 2017.4.
// A batch run must contain the final "PASS: all" line; xsim's exit code alone
// may be zero even when the testbench reports a fatal error.
// Four register levels: a frame sampled at edge 1 appears after edge 4.
// Iterative DIT reference: Q1.15 forward FFT/32, radix-4 base (/4), then
// three radix-2 stages (/2 each). Retain the whole complex product through
// the butterfly addition/subtraction, then truncate and saturate to Q1.15.

module tb_fft32_dit2;
    localparam integer N = 32;
    localparam integer LATENCY = 4;
    localparam integer PICO_FRAME = 28;       // IDs 0..27 are the regression.
    localparam integer NUM_FRAMES = PICO_FRAME + 1;
    localparam real CLK_PERIOD_NS = 10.0;
    localparam real INPUT_DELAY_NS = 1.0;    // E0 to input, XDC range 0.141..2 ns
    localparam real CHECK_DELAY_NS = CLK_PERIOD_NS - 0.001;
    localparam real GSR_WAIT_NS = 120.0;     // past the default 100 ns glbl.GSR
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

    // Bin 0 is the least significant word; each word is {imag, real}.
    wire [32*N-1:0] outputs;
    localparam [32*N-1:0] LEAD_IN_SPECTRUM = {N{32'hff80_0100}};
    localparam [32*N-1:0] PICO_SPECTRUM = 32'h0000_4000;
    reg pico_watch;
    realtime pico_e0_ns, pico_e4_ns, pico_e5_ns;
    realtime pico_last_change_ns, pico_latency_ns;
    genvar k_out;
    generate
        for (k_out = 0; k_out < N; k_out = k_out + 1) begin: pack_bin
            assign outputs[32*k_out +: 32] = {y_imag[k_out], y_real[k_out]};
        end
    endgenerate

    // Record every port transition (also X/Z and glitches). If the final bus
    // is correct, its last transition is the start of the verified stable span.
    always @(outputs) begin
        if (pico_watch) begin
            if ($realtime < pico_e0_ns + LATENCY*CLK_PERIOD_NS)
                $fatal(1, "FAIL: output changed before E4 at %0.3f ns", $realtime);
            pico_last_change_ns = $realtime;
        end
    end

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
    always #(CLK_PERIOD_NS / 2.0) clk = ~clk;

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

    // Numerators have 30 fractional bits. Shift 15 for Q1.15 and 1 for /2.
    function signed [15:0] scaled_radix2;
        input signed [63:0] numerator;
        begin
            scaled_radix2 = saturate16(numerator >>> 16);
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
        reg signed [63:0] even_r_q30, even_i_q30;
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

                        if (span == 2) begin
                            // First half of one radix-4 transform: keep the
                            // full sums/differences until the span=4 step.
                            ref_real[even_index] = ar + br;
                            ref_imag[even_index] = ai + bi;
                            ref_real[odd_index]  = ar - br;
                            ref_imag[odd_index]  = ai - bi;
                        end else if (span == 4) begin
                            // Complete the radix-4 stage, one truncation only.
                            if (j == 1) begin
                                // Exact -j rotation. Keep the signed guard bits.
                                product_r = bi;
                                product_i = -br;
                            end else begin
                                product_r = br;
                                product_i = bi;
                            end
                            ref_real[even_index] = (ar + product_r) >>> 2;
                            ref_imag[even_index] = (ai + product_i) >>> 2;
                            ref_real[odd_index]  = (ar - product_r) >>> 2;
                            ref_imag[odd_index]  = (ai - product_i) >>> 2;
                        end else begin
                            // Coefficients remain wide in the reference. This
                            // permits +1 (=32768) in the W=1 and -j shortcuts.
                            if (j == 0) begin
                                wr = 32768;
                                wi = 0;
                            end else if (4*j == span) begin
                                wr = 0;
                                wi = -32768;
                            end else begin
                                angle = 2.0 * PI * j / span;
                                wr = coefficient_q15($cos(angle));
                                wi = coefficient_q15(-$sin(angle));
                            end
                            even_r_q30 = ar * 64'sd32768;
                            even_i_q30 = ai * 64'sd32768;
                            product_r = br * wr - bi * wi;
                            product_i = br * wi + bi * wr;
                            ref_real[even_index] = scaled_radix2(even_r_q30 + product_r);
                            ref_imag[even_index] = scaled_radix2(even_i_q30 + product_i);
                            ref_real[odd_index]  = scaled_radix2(even_r_q30 - product_r);
                            ref_imag[odd_index]  = scaled_radix2(even_i_q30 - product_i);
                        end
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

    // Frames 0..9 are directed, 10..17 small random and 18..25 full-range
    // random. Frames 26/27 force opposite saturation directions in bin 4.
    task prepare_frame;
        input integer id;
        integer n;
        integer amplitude;
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
                PICO_FRAME: begin
                    // Match the PicoRV32 firmware: 32 copies of 0.5 + j0.
                    for (n = 0; n < N; n = n + 1)
                        x_real[n] = 16'sd16384;
                end
                26, 27: begin
                    // Both 16-point child FFTs produce A+jA in bin 4:
                    // each sees a quarter-turn tone (A+jA)*j**m. The top
                    // W=(23170-j23170)/32768 rotates the odd child's bin.
                    // Before limiting, the scaled real code is +39552/-39553.
                    amplitude = (id == 26) ? 32767 : -32767;
                    for (n = 0; n < N; n = n + 1) begin
                        case ((n / 2) % 4)
                            0: begin x_real[n] =  amplitude; x_imag[n] =  amplitude; end
                            1: begin x_real[n] = -amplitude; x_imag[n] =  amplitude; end
                            2: begin x_real[n] = -amplitude; x_imag[n] = -amplitude; end
                            3: begin x_real[n] =  amplitude; x_imag[n] = -amplitude; end
                        endcase
                    end
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

    // Closed-form outputs provide independent checks of normalization and
    // clipping, in addition to the bit-exact reference used for every bin.
    task check_analytic_bin;
        input integer k;
        input signed [15:0] want_real, want_imag;
        begin
            if ((y_real[k] !== want_real) || (y_imag[k] !== want_imag)) begin
                if (errors < 16)
                    $display("FAIL analytic frame=%0d bin=%0d got=(%0d,%0d) expected=(%0d,%0d)",
                        result_id, k, $signed(y_real[k]), $signed(y_imag[k]), want_real, want_imag);
                errors = errors + 1;
            end
        end
    endtask

    // Shift tags at the same edges that capture DUT inputs.
    // Check 1 ps before the next rising edge. This is a correctness check;
    // the independent output transition timestamp is used for latency.
    always @(posedge clk) begin
        if (!rst_n) begin
            for (p = 0; p < LATENCY; p = p + 1)
                frame_pipe[p] = -1;
        end else begin
            for (p = LATENCY-1; p > 0; p = p - 1)
                frame_pipe[p] = frame_pipe[p-1];
            frame_pipe[0] = drive_id;
        end

        #(CHECK_DELAY_NS);
        if (!rst_n && $realtime >= GSR_WAIT_NS) begin
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
            case (result_id)
                1: for (bin = 0; bin < N; bin = bin + 1)
                       check_analytic_bin(bin, 16'sd256, -16'sd128);
                2: begin
                    check_analytic_bin(0, 16'sd128, -16'sd64);
                    for (bin = 1; bin < N; bin = bin + 1)
                        check_analytic_bin(bin, 16'sd0, 16'sd0);
                end
                26: check_analytic_bin(4, 16'sh7fff, 16'sd16383);
                27: check_analytic_bin(4, 16'sh8000, -16'sd16384);
            endcase
            checked = checked + 1;
            if (errors == errors_before)
                $display("PASS frame=%0d at %0t", result_id, $time);
        end
    end

    task measure_pico_frame;
        begin
            // Hold the impulse from frame 1 until the pipeline is full. All
            // 32 bins are (256,-128); every component differs from the target.
            @(posedge clk);
            #(INPUT_DELAY_NS);
            drive_id = -1;
            prepare_frame(1);
            repeat (LATENCY + 1) @(posedge clk);
            if (outputs !== LEAD_IN_SPECTRUM)
                $fatal(1, "FAIL: incorrect lead-in spectrum at E0");

            // This rising edge is the upstream launch edge E0. Drive the DUT
            // after the modeled input delay; it first samples this frame at E1.
            pico_e0_ns = $realtime;
            pico_last_change_ns = -1.0;
            pico_watch = 1'b1;
            #(INPUT_DELAY_NS);
            prepare_frame(PICO_FRAME);
            calculate_reference(PICO_FRAME);
            drive_id = PICO_FRAME;
            submitted = submitted + 1;

            @(posedge clk);                       // E1
            #(INPUT_DELAY_NS);
            drive_id = -1;                        // hold target data on the ports
            repeat (LATENCY - 1) @(posedge clk);  // E4
            pico_e4_ns = $realtime;
            @(posedge clk);                       // E5: next consumer sampling edge
            pico_e5_ns = $realtime;
            @(posedge clk);                       // E6: one extra stability interval
            @(negedge clk);                       // past E6 netlist updates
            pico_watch = 1'b0;
            if (outputs !== PICO_SPECTRUM ||
                pico_last_change_ns < pico_e4_ns || pico_last_change_ns >= pico_e5_ns)
                $fatal(1, "FAIL: target must settle in [E4,E5) and stay correct through E6; E4=%0.3f E5=%0.3f last_change=%0.3f ns",
                       pico_e4_ns, pico_e5_ns, pico_last_change_ns);
            pico_latency_ns = pico_last_change_ns - pico_e0_ns;
        end
    endtask

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        drive_id = -1;
        submitted = 0;
        checked = 0;
        errors = 0;
        seed = 32'h13579bdf;
        pico_watch = 1'b0;
        clear_inputs;

        // Keep the DUT reset during FPGA global reset and clock it afterwards.
        #(GSR_WAIT_NS);
        repeat (3) @(posedge clk);
        #(INPUT_DELAY_NS);
        rst_n = 1'b1;

        // Launch complete frames on consecutive edges with modeled source delay.
        for (frame = 0; frame < PICO_FRAME; frame = frame + 1) begin
            @(posedge clk);
            #(INPUT_DELAY_NS);
            prepare_frame(frame);
            calculate_reference(frame);
            drive_id = frame;
            submitted = submitted + 1;
        end

        measure_pico_frame;

        if (checked != submitted) begin
            $display("FAIL frame count: submitted=%0d checked=%0d", submitted, checked);
            errors = errors + 1;
        end

        if (errors == 0) begin
            $display("FFT32_PICO_LATENCY E0_ns=%0.3f E4_ns=%0.3f stable_ns=%0.3f elapsed_ns=%0.3f",
                     pico_e0_ns, pico_e4_ns, pico_last_change_ns, pico_latency_ns);
            $display("PASS: all %0d frames matched FFT/32; reset, four-stage latency and saturation checked.", checked);
            $finish;
        end else begin
            $fatal(1, "FAIL: %0d errors; checked %0d of %0d frames.", errors, checked, submitted);
        end
    end

    initial begin
        #5000;
        $fatal(1, "FAIL: simulation timeout");
    end
endmodule
