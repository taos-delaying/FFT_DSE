function automatic signed [15:0] sum17_to_w16; // 这是Q2.15到Q1.15的截断
    input signed [16:0] value;

    begin
        if (value[16] ^ value[15]) begin
            if (value[16])
                sum17_to_w16 = 16'sh8000;  // 负溢出：-32768
            else
                sum17_to_w16 = 16'sh7FFF;  // 正溢出： 32767
        end
        else begin
            sum17_to_w16 = $signed(value[15:0]);
        end
    end
endfunction

function automatic signed [15:0] sum18_to_w16; // 4个16位有符号数相加减  Q3.15截断为Q1.15
    input signed [17:0] value;

    begin
        if (value[17:16] != {2{value[15]}}) begin
            if (value[17])
                sum18_to_w16 = 16'sh8000;  // 负溢出：-32768
            else
                sum18_to_w16 = 16'sh7FFF;  // 正溢出： 32767
        end
        else begin
            sum18_to_w16 = $signed(value[15:0]);
        end
    end
endfunction

function automatic signed [31:0] sum33_to_w32;
    input signed [32:0] value;

    begin
        if (value[32] ^ value[31]) begin
            if (value[32])
                sum33_to_w32 = 32'sh80000000;  // 负溢出：-2147483648
            else
                sum33_to_w32 = 32'sh7FFFFFFF;  // 正溢出： 2147483647
        end
        else begin
            sum33_to_w32 = $signed(value[32:0]);
        end
    end
endfunction

function automatic signed [15:0] sum33_to_w16; // 这是Q3.30到Q1.15的截断
    input signed [32:0] value;

    begin
        if (value[32:31] != {2{value[30]}}) begin
            if (value[32])
                sum33_to_w16 = 16'sh8000;  // 负溢出：-32768
            else
                sum33_to_w16 = 16'sh7FFF;  // 正溢出： 32767
        end
        else begin
            sum33_to_w16 = $signed(value[30:15]);
        end
    end
endfunction