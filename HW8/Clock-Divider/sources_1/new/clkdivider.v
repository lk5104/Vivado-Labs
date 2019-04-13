`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 02:46:47 PM
// Design Name: 
// Module Name: clkdivider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module clkdivider(
    input wire clk,
    input wire reset,
    output reg div_clk
    );
    
    parameter DIVIDE = 2;
    reg [31:0] count;
    
    always @(posedge clk) begin
        if (reset == 0) begin
*//*            if (count == DIVIDE) begin
                div_clk <= ~div_clk;
                count <= 1;
            end
            else begin
                count <= count + 1;
            end*//*
            div_clk <= 1;
        end
    end
    
    always @(negedge clk) begin
    
        if (reset == 1) begin
            count <= 0;
            div_clk <= 0;
        end    
    end
endmodule*/
    
module clkdivider(
    input wire clk,
    output reg div_clk
    );
    
    parameter DIVIDER = 1;
    
    reg [31:0] count = 0;
    reg reset = 1;
    
    always @(posedge clk) begin
    
        if (reset == 1) begin
            reset <= 0;
            div_clk <= 0;
            count <= 0;
        end
        else begin
            if (count == DIVIDER - 1) begin
                div_clk = ~div_clk;
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end
    
endmodule
