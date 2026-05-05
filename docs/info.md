<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements an 8-bit Quadratic Integrate-and-Fire (QIF) Neuron in verilog. The input 'ui_in[7:0]' is used as the signed synaptic input current. The neuron stores its membrane voltage internally and outputs the membrane voltage on 'uo_out[7:0]'. At every clock cycle, the membrane voltage is updated using a scaled QIF-style equation: V_next = V + input/4 + (V/8)^2   IF the membrane voltages reach the threshold value, it is reset to a lover reset voltage. 

## How to test

The design can be tested using the Cocotbtestbench in the 'test' directory. The test should reset the design, apply an input current through `ui_in`, and check that `uo_out` changes over time according to the QIF neuron behavior. After reset, the membrane voltage starts from 0and with positive input, the membrane voltage increases. When the threshold is reached, the voltage resets. 

## External hardware

No external hardware used in this project.
