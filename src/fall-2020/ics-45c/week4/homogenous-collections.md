# Homogenous collections

## Single dimension arrays

### Statically allocated arrays

- Syntax: `int a[10];`
    - Allocates space for 10 integers
    - 4 bytes/int -> 40 bytes used
- Size **must** be known at compile time
- Stored contiguously in memory
- Cells are indexed starting at `0`
- Size of the array is fixed for its entire lifetime
- Arrays do not know their size
- Array operations
    - Index 
        - Returns a reference to read and assign (negative indices are illegal)
        - Cells can be accessed beyound boundaries (not checked automatically)

### Dynamically allocated arrays

- Might not know size until runtime
- Might need to live beyond the function that created it
- Limited space on the runtime stack
- Syntax: `int* a = new int[n];`
    - Returns a pointer to the first element
- Syntax: `delete[] a;`
    - Deallocates everything `a` points to
    - After deletion, `a` is a dangling pointer

## Pointer arithmetic

```C++
int a[10];
int b[10];
int* c = a
```

### `a + 1`

- Expression is allowed
- Gives an address 1 byte further down from `a`
- Could end up pointing to the middle of something
- Should add `sizeof(a)` to `a` instead to get a valid address
- Essentially an alternative way of array indexing

### `a - b`

- Expression is allowed
- Measures how far two things are in memory

### Prohibited

- No multiplying
- No division
- No adding **two** pointers

## Compiler optimizations

- Code generated must have the same visible effect of what was written