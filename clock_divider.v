`timescale 1ns / 1ps

module clock_divider #(parameter div_value = 4999)(
    input wire clk,
    output reg out_clk = 0
    );
    
    integer counter_value = 0;
    
    always @(posedge clk)
    begin
        if (counter_value == div_value)
             counter_value <= 0;
        else
             counter_value <= counter_value + 1;	
    end
    
    always @(posedge clk)
    begin
        if (counter_value == div_value)
             out_clk <= ~out_clk;
        else
             out_clk <= out_clk;	
    end
endmodule
