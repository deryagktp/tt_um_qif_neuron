# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start QIF Neuron test")

    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 2)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value.integer == 0

    dut.ui_in.value = 16

    await ClockCycles(dut.clk, 2)
    assert dut.uo_out.value.integer == 4
 
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value.integer == 8

    dut._log.info("QIF neuron basic integrate behavior passed")
