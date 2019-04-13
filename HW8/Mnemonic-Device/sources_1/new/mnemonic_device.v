`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 06:04:46 PM
// Design Name: 
// Module Name: mnemonic_device
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


module mnemonic_device(
    input wire clk,
    input wire switch,
    input wire change_but,
    output reg sequence
    );
    
    reg [31:0] count_clks; // keep track of clocks gone past
    reg [5:0] count_regs; // keep track of current reg to store in
    reg [31:0] sequence_reg[31:0]; // store sequence
    reg previous_state; // previous input state
    
    reg reset = 1;
    
    always @(posedge clk) begin
        if (reset == 1) begin
            reset <= 0;
            previous_state <= 0;
            count_clks <= 0;
            count_regs <= 0;
        end
        else begin
            if (switch == 1) begin // Switch to start recording
                if (previous_state != change_but) begin // if there is a transition
                    previous_state <= change_but; // revious_state now changed
                    sequence_reg[count_regs] = count_clks; // store counts in sequence
                    count_regs = count_regs + 1;
                    count_clks = 1; // reset clock count        
                end else begin
                    count_clks <= count_clks + 1;
                end
             end
            //end else begin // Recording not happening or done
            
            //end
        end
    
    end
endmodule
