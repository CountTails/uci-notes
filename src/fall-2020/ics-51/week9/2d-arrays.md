# 2D arrays

## Storage arrangement

- Stored in memory as contiguously allocated bytes
- Two choices: row-major order and column-major order
- Suppose we have this 3×5, 2D array, where char `a` is stored at index `[0][0]`

```
a b c d e
f g h i j
k l m n o
```

- Row major order will store the elements as `a b c d e f g h i j k l m n o`
- Column major order will store the elements as `a f k b g l c h m d i n e j o`

## Element access

- Assuming we use row-major order to store elements in a 2D array, the memory address of element `[i][j]` is

```
addr = base_addr +
                 i * size_of_a_row_in_bytes +
                 j * size_of_a_column_in_bytes
```

## Declaring

- Since 2D arrays are contiguous elements in memory, they can declared and initialized as such.

```Assembly
alpha_array: .byte  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o'

```

- They can also be declared using the total number of bytes for the array without initialization

```Assembly
alpha_array2: .space 15
```

- Declarations can be split into multiple statements. The assembler automatically places them contiguously in memory based on order declared.

```Assembly
alpha_array3: .byte 'a', 'b', 'c', 'd', 'e' 
              .byte 'f', 'g', 'h', 'i', 'j' 
              .byte 'k', 'l', 'm', 'n', 'o'
```