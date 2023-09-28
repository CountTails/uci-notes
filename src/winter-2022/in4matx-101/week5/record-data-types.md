# Record data types

## Records

- Heterogenous aggregate types
- Also called cartesian products, tuples, classes, or structs
- Contains a set of fields accessible by name

```C
struct Person {
    char name[20]; // offset by 0 bytes
    long age;      // offset by 20 bytes
    char phoneNumber[20];  // offset by 24 bytes
    long income;   // offset by 44 bytes
}; // size of Person is 48 bytes
```

- Each field has an (integral) offset into the record
- Typically laid out continuously in memory as specified, but may use padding for optimization
- Classes (form object-oriented programming) can be implemented as records

## Union

- Presents a choice of alternative structures
    - The variants are each of the available alternative data members
    - The discriminant is a data member that indicates which variant is alive

```C
union MyUnion {
    char name[20]; // offset by 0 bytes
    long age;      // offset by 0 bytes
    char phoneNumber[20];  // offset by 0 bytes
    long income;   // offset by 0 bytes
}; // size of Person is 20 bytes    
```

- Can be used to circumvent type systems
- Class hierarchies replace unions in object-oriented languages

## Pointers

- Values are set of addresses for objects of a specified type `T`
- Type `T` is called the **domain type** of the pointer
- The value `NIL` or `null` indicates a pointer to nothing
- Allows recursive data structures like list and trees
- Often used to refer to anonymous heap variables
- De-referencing is the most common operations. May be automatic or must be specified explicitly

### Issues

- Scope and lifetime of pointer and anonymous object
- Are pointer type checked?
- How is heap memory managed?
- Challenges
    - Dangling pointer (or dangling reference)
    - Storage leaks (lost objects called "garbage")
    - Uninitialized (random value or `null`) pointers
    - Double free problems

### Memory management

- Explicit allocation and free
    - Programmers responsibility to keep track of allocated memory
    - `malloc` and `free` function in C
    - `new` and `delete` operators of object oriented language
- Stack based
    - Mark
    - Lots of allocations
    - Release
- Reference counting
    - Freed when `count = 0`
    - Garbage collection time is spent incrementally
    - Issues with circular lists
- Garbage collection
    - Mark and collect
        - Mark all reference-able memory
        - Collect all pieces not marked
    - Usually unsuitable for real-time systems: requires pause in process to collect garbage
    - Parallel garbage collection: low priority background thread collect garbage