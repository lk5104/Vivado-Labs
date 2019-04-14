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
    input wire reset,
    input wire switch,
    input wire change_but,
    output wire sequence
    );
    
    reg [31:0] count_clks; // keep track of clocks gone past
    reg [5:0] count_regs; // keep track of current reg to store in
    reg [31:0] sequence_reg[31:0]; // store sequence
    reg previous_state; // previous input state
    reg [31:0] sequence_count;
    reg send_sequence;
    reg sequence_holder;
    
    integer i;
    
    always @(posedge clk) begin
        if (reset == 1) begin
            previous_state <= 0;
            count_clks <= 0;
            count_regs <= 0;
            sequence_count <= 0;
            sequence_holder <= 0;
            for(i = 0; i < 32; i = i + 1) begin
                sequence_reg[i] <= 32'd0;
            end
        end
        else begin
            if (switch == 1) begin // Switch to start recording
                send_sequence <= 0;
                if (previous_state != change_but) begin // if there is a transition
                    previous_state <= change_but; // revious_state now changed
                    sequence_reg[count_regs] = count_clks; // store counts in sequence
                    count_regs = count_regs + 1;
                    count_clks = 1; // reset clock count        
                end else begin
                    count_clks <= count_clks + 1;
                end
             end else begin // Recording not happening or done
                if (sequence_count < count_regs) begin
                    if (sequence_reg[sequence_count] > 0 && sequence_count == 0) begin
                        sequence_reg[sequence_count] <= sequence_reg[sequence_count] - 1;
                    end
                    else if (sequence_reg[sequence_count] > 1 && sequence_count > 0) begin
                        sequence_reg[sequence_count] <= sequence_reg[sequence_count] - 1;
                    end
                    else begin
                        sequence_count <= sequence_count + 1;
                        sequence_holder <= ~sequence_holder;
                    end
                    if (sequence_reg[0] != 0) begin
                        send_sequence <= 1;
                    end
                end
                else begin
                    send_sequence <= 0;
                    count_regs <= 0;
                end
             end
        end
    
    end
    
    assign sequence = (send_sequence == 1) ? sequence_holder : 1'bz;
endmodule
