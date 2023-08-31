# MIPS instructions

## Instruction categories

- *Load and store*: acess memory
- *Arithmetic*: perform mathematical operations
- *Logical*: perform operations on bits of data
- *Jump*: change the flow of program execution uncoditionally
- *Branch*: change the flow of program execution conditionally

## Instruction types

- *R-type*: register operands
- *I-type*: immediate operands
- *J-type*: for jumping

## Basic instruction terminology

- HLL: `a = b + c`
- MIPS: `add a, b, c`
    - `add` is the mnenonic for the operation to perform
    - `b` and `c` are the source operands
    - `a` is the destination operand
    - `a`, `b`, and `c` are registers

## Load and store instructions

- Used to acess memory
- Only such instructions
- Considered *I-type* instructions
- Can read/write words (4 bytes) or individual bytes
- Can provide an offset to read/write to an effective address
- Reads and writes must be aligned to a word or byte multiples

## Arithmetic instructions

- Perform mathematical instructions on register operands
- Considered *R-type* instructions
- For multiplication and division
    - Do not specify a destination
    - Result split in between two registers (`$hi` and `$lo`)

## Logical instructions

- Perform bitwise logical operations
- Considered *R-type* instructions and all require 3 operands
- `and`: useful for masking out bits
- `or`: useful for combining bit fields
- `nor`: usefule for inverting bits
- Shifts move bits over left or right and pad with zeros
- Rotations move bits over left or right and reappear on the other side

## Jump instructions

- Considered a *J-type* instruction
- Unconditional jump to specified address
- Provide support for conditionals, iterative blocks, and functions

## Branch instructions

- Conditional jump to specified address
- Considered *I-type* instructions
- Support for if-statment style blocks

## Tips

- Some instructions are psuedo instructions. They are just shorthands for common operations that require multiple instructions
- See the MARS help menu for a full list of available instructions