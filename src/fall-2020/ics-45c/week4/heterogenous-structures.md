# Heterogenous structures

## C++ structs

- A collection of data
- Has member variables

### Defining

```C++
struct Date {
    unsigned int year;
    unsigned int month;
    unsigned int day;
}; // this is pretty important or you'll get a nasty compile error
```

### Declaring

- Writing `Date d;` does **not** define its members
- Can access members by name with dot notation
    - `d.year`
    - `d.month`
    - `d.day`
- Uniform initialization syntax
    - `Date today{2020, 10, 19};`
    - Utilizes an initialization list
    - Order matters, and will assign each value sequentially

### Deallocation

- Static
    - Members dies when struct dies
    - Follows strict allocation rules
- Dynamic
    - using `new` operator returns a pointer to an uninitialized struct
    - Must use the arrow notation to access members
        - `d->year`
        - `d->month`
        - `d->day`
    - Can use uniform initialization syntax to initialize struct
    - `delete d` deallocates the struct and its members

## Passing structs as parameters

### By value

- Passes a copy of the struct
- All members are copied
- Does not affect original struct

### By reference

- Changes do affect the original

### By const reference

- Forbidden from changing the original
- Do not pay the cost to copy

## Layout

- Compiler decides
- Must use enough memory to store all members
- Members are laid out in memory as listed
- Can include padding to conform to architecture alignment constraints