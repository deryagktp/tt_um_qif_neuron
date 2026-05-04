`default_nettype none 

module QIFNeuron (
  input wire clk,                //clock input
  input wire rst_n,              //reset input (0=reset)
  input wire signed [7:0] I_syn,        // current entering the neuron
  output wire signed [7:0] V_mem        // membrane voltage oputput 
);

  reg signed [7:0] V;  //that stores the membrane voltage 
  assign V_mem = V;    // we send the voltage to the output pins 
  always @(posedge clk) begin
    
    if (!rst_n) begin   // when the reset is active start from 0 
      V <= 8'sd0;
    end else begin 
      if (V>=8'sd50) begin
        V<=-8'sd20;
      end else begin
        V <= V + (I_syn >>> 2) + ((V >>> 3)*(V >>> 3));
      end
    end
  end
endmodule 
