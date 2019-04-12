`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 11:34:50 AM
// Design Name: 
// Module Name: test_ohe
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


module test_ohe();
    reg clk, reset, in;
    wire out;
    
    ohe uut (.clk(clk), .reset(reset), .in(in), .out(out));
    
    initial begin
        clk = 0;
        forever clk = #1 ~clk;
    end
    
    initial begin
    
        reset = 1;
        #1
        reset = 0;
        // Fastest way through state machine
        #1
        in = 1;
        #9
        
        
        reset = 1;
        #2
        reset = 0;
        in = 1;
        #2
        in = 1;
        #2
        in = 1;
        #2
        in = 0;
        #2
        in = 1;
        #2
        in = 1;
        #2
        
        
        $finish;
    
    end


endmodule
