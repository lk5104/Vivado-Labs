`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 02:57:16 PM
// Design Name: 
// Module Name: test_clkdivider
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


module test_clkdivider();
    reg clk;
    reg reset;
    wire div_clk;
    
    clkdivider uut(.clk(clk), .reset(reset), .div_clk(div_clk));
    
    initial begin
    
        clk = 0;
        forever clk = #1 ~clk;
    
    end
    
    initial begin
        reset = 1;
        #1
        reset = 0;
        #100
        $finish;
    end
endmodule
