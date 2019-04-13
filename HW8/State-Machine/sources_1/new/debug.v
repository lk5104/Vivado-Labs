`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 02:40:38 PM
// Design Name: 
// Module Name: debug
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


module debug(
    input wire clk,
    input wire reset,
    input wire in,
    output wire out,
    output wire [3:0] debug
    );
    
    assign debug = {clk, reset, in, out};
    
    ohe uut (.clk(clk), .reset(reset), .in(in), .out(out));
    
endmodule
