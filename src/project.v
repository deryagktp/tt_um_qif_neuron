/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_qif_neuron (
    input  wire [7:0] ui_in,    // Dedicated inputs : Synaptic input current 
    output wire [7:0] uo_out,   // Dedicated outputs : membrane voltage
    input  wire [7:0] uio_in,   // IOs:Bidirectional input not not used in this design 
    output wire [7:0] uio_out,  // IOs: Bidirectional outputs not not used in this design 
    output wire [7:0] uio_oe,   // IOs:  enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // unsued bidirectional pins
  assign uio_out = 8'd0;
  assign uio_oe  = 8'd0;

  // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in, 1'b0};

    // QIF Neuron module 
    QIFNeuron neuron (
        .clk(clk),
        .rst_n(rst_n),
        .I_syn(ui_in),     // external input goes to neuron input
        .V_mem(uo_out)    //Neuron outputs goes to chip output 
        
    );

endmodule
