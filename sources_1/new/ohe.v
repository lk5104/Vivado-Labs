`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 04:23:56 PM
// Design Name: 
// Module Name: ohe
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


module ohe(
    input wire clk,
    input wire reset,
    input wire in,
    output wire out
    );

       localparam STATE_0 = 8'd0;
       localparam STATE_1 = 8'd1;
       localparam STATE_2 = 8'd2;
       localparam STATE_3 = 8'd3;
       localparam STATE_4 = 8'd4;
       localparam STATE_5 = 8'd5;
       localparam STATE_6 = 8'd6;
    
       reg [7:0] current_state;
    
       always @(posedge clk) begin
          if (reset == 1) begin
             current_state <= STATE_0;
             //out <= 0;
          end else begin
             case (current_state)
                STATE_0 : begin
                   if (in == 1) begin
                      current_state <= STATE_1;
                      //out <= 0;
                   end else begin
                      current_state <= STATE_3;
                      //out <= 0;
                   end
                end
                STATE_1 : begin
                   if (in == 1) begin
                      current_state <= STATE_2;
                      //out <= 0;
                   end else begin
                      current_state <= STATE_3;
                      //out <= 0;
                   end
                end
                STATE_2 : begin
                   if (in == 1) begin
                      current_state <= STATE_4;
                      //out <= ;
                   end else begin
                      current_state <= STATE_3;
                      //out <= ;
                   end
                end
                STATE_3 : begin
                   current_state = STATE_3;
                   //out <= 0;
                end
                STATE_4 : begin
                   if (in == 1) begin
                      current_state <= STATE_6;
                      //out <= 1;
                   end else begin
                      current_state <= STATE_5;
                      //out <= 0;
                   end
                end
                STATE_5 : begin
                   if (in == 1) begin
                      current_state <= STATE_4;
                      //out <= 0;
                   end else begin
                      current_state <= STATE_5;
                      //out <= 0;
                   end
                end
                STATE_6 : begin
                    current_state <= STATE_6;
                   //out <= 0;
                end
                default : begin  // Fault Recovery
                   current_state <= STATE_0;
                end
             endcase
          end
       end
       
       assign out = (current_state == STATE_6) ? 1 : 0;
endmodule
