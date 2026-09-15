// 流水灯示例
`timescale 1ns / 1ps
module LED_Flash(
        input wire clk,
        input wire rst_n,
        output reg [7:0] LED
    );

    // 参数
    reg [25:0] cnt ;

    // 1. 50MHz定时器计时
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 26'd0 ;
        else if (cnt == 26'd6_250_000 - 1)  // 1/8s
            cnt <= 26'd0 ;
        else
            cnt <= cnt + 1 ;
    end

    // 2. LED流水灯
    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
            LED <= 8'b1000_0000;
        else if (cnt == 26'd6250000 - 1)
            LED <= {LED[0],LED[7:1]};
    end

endmodule
