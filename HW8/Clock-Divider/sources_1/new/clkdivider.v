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


module clkdivider(
    input wire clk,
    input wire reset,
    output reg div_clk
    );
    
    parameter DIVIDE = 3;
    reg [31:0] count;
    
    always @(posedge clk) begin
    
            if (count == DIVIDE) begin
                div_clk <= ~div_clk;
                count <= 1;
            end
            else begin
                count <= count + 1;
            end
    
    end
    
    always @(negedge clk) begin
    
        if (reset == 1) begin
                count <= 0;
                div_clk <= 0;
        end
    
    end
endmodule
