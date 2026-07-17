# RISC-V Assembly - Array Processing

Two RISC-V assembly programs written and run in RARS, both working with integer arrays using loops and branching.

## About
RISC-V is an open-source instruction set architecture (ISA), meaning anyone can build hardware or software around it without licensing fees. It's built on a small set of base instructions, with extensions added on top for things like multiplication/division or floating point.

RARS (RISC-V Assembler and Runtime Simulator) is a tool used to write, assemble, and run RISC-V assembly programs without needing actual RISC-V hardware. It simulates the registers, memory, and instruction execution, and lets you step through a program to see exactly how each instruction changes register/memory values.

## Problem A - Military Ration Distribution
An army records the ration packets distributed over 7 days, given as an array.
`Rations = {120, 150, 100, 180, 130, 170, 140}`  
`N = 7`  
The program calculates:
- Total ration packets distributed
- Average ration per day (integer division)
- Number of days where distribution is above average
- Maximum ration value

### How it works
- First loop goes through the array once, adding up the total and keeping track of the max value at the same time using `bge`
- Average is found by dividing total by N
- Second loop goes through the array again, comparing each value to the average and counting how many days were above it
- All four results are printed using `ecall`, one per line

## Problem B - Classroom Attendance Analyzer
Records the roll numbers of students present as an array, and finds some basic stats from it.

The program calculates:
- Total students present
- Sum and average of roll numbers
- Highest roll number

### How it works
- Same idea as Problem A — one loop to sum the roll numbers and track the highest one using `bge`
- Average is calculated after the loop using integer division
- Results printed one per line

## Constraints
- Only loops, arithmetic and conditional branching used for the core logic
- Programs tested and run in RARS
