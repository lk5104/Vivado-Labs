`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 06:23:26 PM
// Design Name: 
// Module Name: test_md
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


module test_md();
    reg clk;
    reg switch;
    reg change_but;
    wire sequence;
    
    mnemonic_device uut(.clk(clk),
                        .switch(switch),
                        .change_but(change_but),
                        .sequence(sequence));
    
    initial begin
        clk = 0;
        forever clk = #1 ~clk;
    end
    
    initial begin
    
        switch = 0;
        change_but = 0;
        #2
        switch = 1;
        #10
        change_but = 1;
        #6
        change_but = 0;
        #8
        change_but = 1;
        #4
        
        $finish;
    
    end
endmodule
