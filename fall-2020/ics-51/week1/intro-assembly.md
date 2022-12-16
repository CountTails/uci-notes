# Intro to assembly

## MIPS

- Stands for **M**icroprocesor without **I**nterlocked **P**ipeline **S**tages
- It is an **Instruction set architecture**
    - Defines types of instructions implemented in hardware
    - Defines size and format of instructions understood by the hardware
- Primarly used in embedded systems and for educational purposes

## Sample program

### Hello world in C

```C
void main()
{
    //printf() displays the string inside quotation
    printf("Hello, World!");
    return 0;
}
```

### Hello world in MIPS

```mips
# text segment - program instructions
.text                      # tells assembler prgram code starts here
.global main               # define label for execution start

main:                      # label for where execution starts
    la $a0, str            # put address of string into argument register
    li $v0, 4              # set the syscall type
    syscall                # system call to print the string to terminal

    li $v0, 10             # load exit syscall value
    syscall                # exit

# data segment - global variables
.data:                     # tells assembler data segment begins here
    str: .asciiz "hello world\n" # declaration of a NULL terminated string
```

- This format is **assembly language** or **assembly code**
    - Uses *mnemonics* to represent instructions
    - Easier to read and write compared to binary
- The assembler coverts this code to a binary encoding called **machine code**

## Mips programming 101

### Labels

- Lines starting with `text_name:`
- Refer to a particular memory address where the next defined item, instruction, or data resides
- Typically refer to the start of a section of code, method/function, or global variables
- Can contain characters, digits, periods or underscores. Cannot begin with a number or period
- More than one label can refer to the same item, but most be declared on separate lines

### Assembler directives

- Used to inform the assembler of the modes and data types
- `.text`: everything that follows is source code
- `.globl [label]`: makes `[label]` externally available
- Other directives
    - `.ascii`: an ASCII string, **NOT** null terminated
    - `.word`: allocate space for one or more 32 bit words
    - `.byte` allocate space for one or more bytes

### Instruction names

- Each instruction has a mnemonic abbreviation

### Registers

- Local storage within the CPU
- Has a `$` before its name
- MIPS uses
    - 32 32-bit general purpose registers
    - 32 32-bit floating point registers
    - A few others for error handling and specialized hardware
- Registers are much faster than main memory, but have limited space
- Registers are assigned specific purposes for consistency
    - `$0` always holds `0`
    - **Saved registers** (`$s0-$s7`) hold variables
    - **Temporary registers** (`$t0-$t9`) hold intermediate values during larger computations
- You should follow these **register conventions** in order for your code to work properly in all scenarios

### Syscalls

- A request by the program to the OS to perform a service routine
    - Each syscall number has a purpose
    - The number is loaded into `$v0` register

## Program structure

- MIPS code stored in a plain text file as follows

```
.text
.globl main

main:
# put code here

.data
# put global variables here
```