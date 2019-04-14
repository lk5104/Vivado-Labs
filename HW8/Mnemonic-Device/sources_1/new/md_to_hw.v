`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2019 04:32:06 PM
// Design Name: 
// Module Name: md_to_hw
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


module md_to_hw(
    input wire clk,
    input wire reset,
    input wire switch,
    input wire change_but,
    output wire sequence,
    output wire [4:0]debug
    );
    
    assign debug = {clk, reset, switch, change_but, sequence};
    
    mnemonic_device uut(.clk(clk),
                        .reset(reset),
                        .switch(switch),
                        .change_but(change_but),
                        .sequence(sequence));
endmodule
