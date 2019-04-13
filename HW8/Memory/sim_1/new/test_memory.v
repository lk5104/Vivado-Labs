`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 02:05:04 PM
// Design Name: 
// Module Name: test_memory
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


module test_memory();
    reg clk, reset, enable, RDnWR;
    wire [7:0] data;
    wire [7:0] data_out;
    
    memory uut(.clk(clk),
               .reset(reset),
               .RDnWR(RDnWR),
               .enable(enable),
               .data(data),
               .data_out(data_out));
               
    reg direction;
    reg [7:0] send_data;
        
    initial begin
        clk = 0;
        forever clk = #1 ~clk;
    end    
    assign data = (direction == 1) ? send_data : 8'bz;
    initial begin
        reset = 1;
        enable = 0;
        #2
        reset = 0;
        direction = 1;
        enable = 1;
        send_data = 8'b00001010;
        #2
        send_data = 8'b10100011;
        #2
        direction = 0;
        enable = 0;
        #2
        direction = 1;
        enable = 1;
        send_data = 8'b00001011;
        #2
        send_data = 8'b10101010;
        #2
        enable = 0;
        
        
    
    
        $finish;
    end
    
endmodule
