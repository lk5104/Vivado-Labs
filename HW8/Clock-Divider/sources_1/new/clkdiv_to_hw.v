`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 03:38:36 PM
// Design Name: 
// Module Name: clkdiv_to_hw
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


module clkdiv_to_hw(
    input wire clk,
    output wire div_clk,
    output wire [1:0] debug
    );
    
    assign debug = {clk, div_clk};
    
    clkdivider uut(.clk(clk), .div_clk(div_clk));
    
    
endmodule
