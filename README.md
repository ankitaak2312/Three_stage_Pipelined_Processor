## Three Stage Pipelined Processor

A Verilog-based implementation of a 3-stage pipelined processor designed to demonstrate the fundamentals of pipelined CPU architecture, instruction execution, and hardware design concepts.
# Overview

This project simulates a simple pipelined processor using Verilog HDL.
The processor is divided into multiple stages to improve instruction throughput and demonstrate parallel instruction execution.

# The design includes:

Instruction Fetch

Instruction Decode / Execute

Memory Access / Write Back

# The project also includes:

ALU implementation

Register file

Control unit

Program counter

Instruction memory

Testbench for simulation

# Pipeline Stages

1. IF Stage (Instruction Fetch)
2. ID/EX Stage (Instruction Decode & Execute)
3. MEM/WB Stage (Memory Access & Write Back)

# Project Structure
Three_stage_Pipelined_Processor/
│
├── alu.v   
# Arithmetic Logic Unit
├── control.v   
# Control Unit
├── define.v  
# Macro/constant definitions
├── ID_EXstage.v  
# Decode and Execute stage
├── IF_IDstage.v 
# Fetch stage
├── imem_test0.mem 
# Instruction memory contents
├── memory.v    
# Memory module
├── PC.v      
# Program Counter
├── pipelined_3stage.v  
# Top-level processor module
├── regfile.v    
# Register File
├── test_bench_3_stage_pipeline.v 

# Testbench
└── README.md

