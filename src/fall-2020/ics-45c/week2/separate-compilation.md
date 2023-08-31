# Separate compilation

## keyword `const`

- Good for global constants, but not variables
- Attempting to change is a *compile time* error

## Source files (`*.cpp`)

- Compiled separately
    - Literally one at a time
    - After one is compiled, it is forgotten and the next files gets compiled
- Using functions from other files requires restating their signature (Not ideal)

## Header files (`*.hpp`)

- Communicate declarations without their definitions
    - `#include "header-file.hpp"`
- Include means go find the file and then copy and paste its contents
    - Use `<...>` for standard library or installed libraries
    - Use `"..."` for project headers
- Multiple inclusions guards
    - Header files are often include multiple times in many times
    - Breaks the one definition rule
    - Should surround all declarations in a header file

```C++
//some_header_file.cpp
#ifndef some_header // if not defined, include
#define some_header // state file has been defined, happens on first #include

// Declarations go here

#endif
```

## One definition rule

- Not allowed to define a function more than once
- Definitions in header files can lead to multiple definitions issues, so it is discouraged

## Module design

- Think a `*.cpp` files as "modules"
- Separation of concerns
    - Functions should be relatively short
    - Functions should have a single job
    - Functions whose purpose are strongly related belong in the same source file
    - Functions in one source file should depend on as few details as possible about functions in source files