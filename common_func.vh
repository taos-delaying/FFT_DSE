function automatic signed [15:0] sum17_to_w16_div2; // 这是Q2.15到Q2.14的截断，若视为Q1.15，实际上缩小了2倍
    input signed [16:0] value;

    begin //永远不会溢出
        sum17_to_w16_div2 = $signed(value[16:1]);
    end
endfunction

function automatic signed [15:0] sum18_to_w16_div4; // 4个16位有符号数相加减  Q3.15截断为Q3.13，若视为Q1.15，实际上缩小了4倍
    input signed [17:0] value;

    begin //保证不会溢出
       sum18_to_w16_div4 = $signed(value[17:2]);
    end
endfunction

function automatic signed [15:0] sum34_to_w16_div2; // 这是Q4.30到Q2.14的截断,若视为Q1.15，实际上缩小了2倍
    input signed [33:0] value;

    begin
        if (value[33:32] != {2{value[31]}}) begin
            if (value[33])
                sum34_to_w16_div2 = 16'sh8000;  // 负溢出：-32768
            else
                sum34_to_w16_div2 = 16'sh7FFF;  // 正溢出： 32767
        end
        else begin
            sum34_to_w16_div2 = $signed(value[31:16]);
        end
    end
endfunction