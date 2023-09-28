# Primitive data types

## Primitives

- Typically built into the language
- Usually an abstractions of underlying hardware data types
- Typical types
    - `boolean`: a single bit, 0 for `False` and 1 for `True`
    - `char`
        - A single byte for ASCII characters
        - Two bytes for unicode characters
    - Numeric
        - Integrals: `short` (16 bits), `int` (32 bits) and `long` (64 bits)
        - Floating point: `float` (32 bits) and `double` (64 bits) based on [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)
        - Fixed point (rare)

### Character types

- Not a primitive type, but usually built in
- Classic design decision: should string length be static (efficient) or dynamic (flexible)?
- Typical string operations
    - Assign
    - Equality be checking contents
    - Concatenation of strings
    - Extraction or detection of of substrings
    - Relational operations usually based on lexicographical ordering
    - Input/Output
- Alternate implementations
    - Static strings (no modifying actions allowed)
    - Semi-dynamic strings (limited modifying actions allowed)
    - Dynamic strings (modifying actions fully allowed)

### Ordinal types

- Includes integers, character, boolean and enumerations
- Represented as a set of integral values and are fully compatible with machine-based primitives
- Proper use of enumerations enhances program
    - Readability through descriptive names
    - Reliability through better type checking
- Subranges of ordinal types allow for more compiler checks

## Arrays

- Homogenous aggregate type (AKA as "finite mapping")
- Design issues to consider when implementing
    - What notation will be used for indexing? `a[i]` or `a(i)`
    - Should subscripts be zero-based or one-based?
    - Should bound checking be included or optional?
    - When is memory allocated for the array?
    - How will multiple dimensions be supported?
    - Can you specify array literals?
    - Can you take subranges of an array?
    - Can you index from the end of the array? `a[-1]` in Python

### Array implementation

- Allocation can be
    - Static: done at compile time
    - Semi-static: allocated within the stack frame
    - Semi-dynamic: allocated on top of the stack frame
    - Dynamic: allocated on the heap (with option to grow)
- Implementation
    - Consider `array(lower...upper)` of element
    - Size (in bytes) of the array is `(upper - lower + 1) + sizeof(element)`
    - Index formula: `address(a[i]) = address(a) + (i - lower) * sizeof(element)`