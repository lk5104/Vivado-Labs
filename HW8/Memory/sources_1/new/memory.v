`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 01:41:08 PM
// Design Name: 
// Module Name: memory
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


module memory(
    input wire clk,
    input wire reset,
    input wire RDnWR,
    input wire enable,
    inout wire [7:0] data_addr,
    output reg [7:0] data_led
    );

    always @(posedge clk) begin
    
        if (enable == 1) begin
        
            if (RDnWR == 1) begin
            
                data_out <= data;
            
            end
        
        end
    
    end
    assign data_addr = (RDnWR == 0) ? 1'bz : data;
    
endmodule
