# x86 Assembly

Assembly is a low-level programming language that is very close to the machine code that the CPU executes. x86 and x86-64 describe an instruction set architecture (ISA), which includes

- list of registers
- the instruction set
- memory model

The objective is to be able to read and optimize (not write) x86 assembly code.

We can think of a CPU as a state machine. The state is represented by a set of registers, which can be thought of as key -> value pairs (for a specific set of keys). Transitions between states are represented by an instruction in memory, as pointed to by the `RIP` (instruction pointer) register. These instructions broadly fall under the categories of

- arithmetic
- memory access
- control flow
- IO
- system

## Assumptions about Programs

## Registers

A modern 64-bit CPU has different types of registers for different purposes

- 16 64-bit general purpose
  - 8 program-focused
  - 8 general purpose (REALLY general)
- 6 16-bit segment
- RFLAGS
- RIP
- FPU
- SIMD

We'll review each of these in detail.

### General Purpose Registers

Of the 16 general purpose registers, 8 are truly "general", while the other 8 have conventional purposes.

| Register | Purpose           |
| -------- | ----------------- |
| RAX      | Accumulator       |
| RBX      | Base              |
| RCX      | Counter           |
| RDX      | Data              |
| RSI      | Source Index      |
| RDI      | Destination Index |
| RBP      | Base Pointer      |
| RSP      | Stack Pointer     |

## Basic Instructions

## Control Flow

## Floating Point Operations

## SIMD Operations

## IO

## Resources

- [Intel® 64 and IA-32 Architectures Software Developer’s Manual](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html) - only 5000 pages... but, at least, volumes 1 and 3 are helpful and simple to read/skim
