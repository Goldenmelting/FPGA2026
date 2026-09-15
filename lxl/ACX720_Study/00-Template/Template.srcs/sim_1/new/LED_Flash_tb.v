`timescale 1ns / 1ps

module LED_Flash_tb;

    // 1. 声明线序
    reg clk;
    reg rst_n;
    wire [7:0] LED;

    // 2. 实例化被测试模块
    LED_Flash uut (
        .clk     (clk),
        .rst_n (rst_n),
        .LED     (LED)
    );

    // 3. 写逻辑
    // 3.1 时钟配置: 50MHz -> 周期20ns
    always #10 clk = ~clk;

    // 3.2 业务仿真
    initial begin
        // 初始状态
        clk = 1'b0;
        rst_n = 1'b0;
        // 保持复位100ns
        #100;
        // 释放复位
        rst_n = 1'b1;
        // 仿真一段时间
        #1200000000;
        $stop;
    end

endmodule