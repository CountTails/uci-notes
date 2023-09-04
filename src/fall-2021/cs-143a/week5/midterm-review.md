# Midterm review

## Calling conventions

### Parameter passing

Use assembly to create a proper call site for the following C function (i.e., invoke this function with the below arguments)

```C
ret = foo(1, 2, 3, 4);
```

where the `foo` function looks like this

```C
int foo (int x, int y, int z, int w) {
	int a = 5, b = 6;
	a += b + x + y + z + w;
	return a;
}
```

#### Solution

```asm
push 4
push 3
push 2
push 1
call foo
```

### Saving return values

Use assembly to save the result returned by the `foo` function above on the stack

#### Solution

```asm
...
call foo
; add your asm code here
push EAX ; or move [ESP + ...], EAX
```

### Stack snapshot

Assume that your program uses x86 32 bit machine instructions and maintains the stack frame. Draw the call stack (including the arguments passed to `foo`) at the instruction that starts computing this arithmetic expression inside `foo`: `b + x + y + z + w`

#### Solution

```
        +-----------+
        |     4     |
        +-----------+
        |     3     |
        +-----------+
        |     2     |
        +-----------+
        |     1     |
        +-----------+
        |  ret addr |
        +-----------+
        |  old EBP  |
EBP --->+-----------+
        |   a = 5   |
        +-----------+
        |   b = 6   |
ESP --->+-----------+
        |           |
```



## System call interfaces

Write a simple xv6 or linux program that starts `grep` redirecting its standard input to the `/foobar.txt` file and connecting its standard output to the pipe that connects to the standard input of `wc -l`. Your code does not have to be perfect C, but has to use all system calls correctly (explain the usage with comments). You can use either xv6 or Linux system calls

### Solution

```shell
$ grep < /foobar.txt | wc -l
```

```C
main () {
    int p[2];
    pipe(p); // Obtain a pipe
    int ret = fork()
    if (ret != 0) {
        // parent (grep)
        close(0); // Close the default stdin
        opne("/foobar.txt"); // Open file, should have file descriptor 0 (a.k.a stdin)
        close(1); // Close the default stdout
        dup(p[1]); // Copy pipe file descriptor, should have file descriptor 1 (a.k.a stdout)
        close(p[0]); // Not needed here
        close(p[1]); // Not needed here, copied earlier
        exec("/bin/grep");
    }
    if (ret < 0) {
        fprintf(2, "fork failed\n");
        exit(EXIT_FAILURE); // stop if fork fails
    }
    // child process continues here (wc -l)
    close(0); // Close default stdin
    dup(p[0]); // Connect pipe input to file descriptor 0 (a.k.a stdin)
    close(p[0]); // Not needed here, copied earlier
    clsoe(p[1]); // Not needed here
    exec("/bin/wc", ["/bin/wc", "-l"]);
}
```

## Segmentation and paging

### Address translation

Consider the following 32-bit x86 page table setup

- `CR3` holds `0x00000000`
- The page directory page at physical address `0x00000000`

The page directory table looks like

```
PDE 0: PPN=0x00001, PTE_P, PTE_U, PTE_W
PDE 1: PPN=0x00002, PTE_P, PTE_U, PTE_W
... all other PDEs are zero
```

The page table page at physical address `0x00001000`(which in PPN `0x1`) looks like

```
PTE 0: PPN=0x00003, PTE_P, PTE_U, PTE_W
PTE 1: PPN=0x0004, PTE_P, PTE_U, PTE_W
... all other PTEs are zero
```

The page table page at physical address `0x00002000` (which is PPN `0x2`) looks like

```
PTE 0: PPN=0x00006, PTE_P, PTE_U, PTE_W
PTE 1: PPN=0x00007, PTE_P, PTE_U, PTE_W
... all other PTEs are zero
```

> Which physical address corresponds to the virtual offset `0x0`. 
> Imagine the segment you're using is configured with the base of `0x1000`

#### Solution

- Segment offset is `0x1000 + 0x0 = 0x1000`
- Page directory index is `0x0`
- Page table index is `0x1`
- Dereference `PDE0` and then `PTE1` to get the physical page address `0x4000`
- Take the physical page number and add an offset of `0x0`: `0x4000 + 0x0 = 0x4000`
- The physical address is `0x4000`

### Page table building

Construct a page table that maps three pages at virtual address `0x80100000`, `0x80101000`, and `0x80102000` to physical addresses `0x0`, `0x101000` and `0x102000` respectively. To define the page tables, you can use the format similar to the one in the question above.

#### Solution

- The page directory table looks like

```
... All other PDE entries are 0
PDE 512: 0x1, Flags
... All other PDE entries are 0
```

- The page table at `0x1` looks like

```
... All other PTE entries are 0
PTE 256: 0x0, Flags
PTE 257: 0x101, Flags
PTE 258: 0x102, Flags
... All other PTE entries are 0

```

## Linking and loading

Use the following program to answer the questions that follow

```C
#include <stdio.h>

int y;

static int inc(int a) {
    return a + 1;
}

int dec(int b) {
    return inc(b) - 1;
}

void main() {
    int x;

    x = 5;
    y = dec(x);

    printf("result: %d\n", y);
}
```

### Variable placement

For each variable in the program, explain where and how it is allocated

#### Solution

| Variable | Allocation method |
| -------- | ----------------- |
| `int y`    | `.bss` section      |
| `int a`    | stack when called |
| `int b`    | stack when called |
| `int x`    | stack when run    |
| `"result:%d\n"` | `.data` or `.rodata` |

### Relocation

Imagine the program was compiled to be loaded at address `0x0`. Which symbols in the program need to be relocated if you load this program in memory at address `0x100000`?

#### Solution

- `dec(int b)`
- `printf()`
- `"result: %d\n"`
- Global `y`