# C++ basics

## Basic data types

### Typing philosophies

- Dynamic: type checks performed while program is running
- Static: type checks performed before the program runs
- Languages fall on a spectrum betwen the two extremes listed above
    - Python is decidedly closer to the dynamic end
    - C++ is decidedly closer to the static end

### Built-in data types

#### Integral types

- Represent an integer value
- `int` (32 bits, (-2.1 billion, 2.1 billion))
- `long` (64 bits)
- `long long` (64 bits)
- `short` (16 bits, (-32768, 32767))
- `char` (8 bits, (-128, 127))

#### Unsigned integral types

- Always nonnegative
- `unsigned int` (0, 4.2 billion)
- `unsigned long`
- `unsigned long long`
- `unsigned short`
- `unsigned char`

#### Boolean type

- `bool` represents a boolean value
- Can be `true` or `false`
- Boolean and integers are interchangable
    - `0` is `false`
    - non-zero is `true`

#### Floating-point type

- Number with a fractional part
- `float` (32 bits)
- `double` (64 bits, offers more precision)

## Expressions and statements

### Expression vs statement

- The bodies of functions are made of statements
- Statements do jobs
- Statements can contain expressions
- Expression calculate a value and returns it and they have a type

### Expression types

- expression statement: `a + b`
- assignment is an expression: `a = 3`
- compound / block statement: `{ ... }`
- control structures
    - `if(condition) { ... } else { ... }`
    - `switch(a) { case 0: ... default: ... }`
    - `while(condition) { ... }`
    - `for(init; condition; increment) { ... }`


## Declarations and definitions

### Declarations

- Introduce a name
- Associate a name with a type
- You can declare
    - Variables (without a value)
    - Functions (without a body)
- Declaring states a name exists, although it may not have a meaning

### Definition

- Give name meaning by associating it with a value
    - Assign a value to a name
    - Give a body to a function
- L-values and R-values
    - L-values: an expression that would be legal on the left hand side of an assignment statement
    - R-values: an expression that would be legal on the right hand side of an assignment statement
    - `a = 3` legal if type of `a` is `int`
    - `a = 3 + 4` legal if type of `a` is `int`
    - `a = b` legal if type of `a` and `b` are the same
    - `3 = a` illegal, assignment only works if left hand side is a place
    - `b + c = a` illegal, assignment only works if left hand side is a place

### Functions

- Names must be declared before use
- Compiler needs to know a name exists
- If body is not given, linker asserts all names have definitions

## C++ strings

- Not built into the language, but exists in the standard library
- Must be `#include`d before use
- Declaration
    - `std::string [var] = "..."`
    - Double quotes are required

### String vs char

- Have different literals
    - char: `'a'`
    - string: `"Boo"` (not type `std::string`)

### What can you do with strings

- Add them together / concatenate
- Have multiple instances
- Compare using `==`
- Use member functions (methods)
    - `s.empty()`
    - `s.length()` or `s.size()`
    - `s[i]`
    - Full list [here](https://en.cppreference.com/w/cpp/string/basic_string)

### Differences from Python or Java

- Python or Java
    - Strings are immutable
    - Modification build new strings
    - Python `==` checks for equality
    - Java `==` checks for identity
    - Bounds are checked, Python supports negative indices from the end of the string
- C++
    - No bounds checking, improper access leads to undefined behavior
    - String *are* mutable
    - The `s.at()` member functions opts into bounds checking
        - Costs more than simply indexing the string

## Standard IO

### C++ output

- `cout` is the standard output
- Outputs to the shell by default
- Can redirect to a file `./run > output.txt`
- Printing is not limited to the command line
- Can use `|` to send output to another program

### `std::cout`

- Can put variables into stream with `<<`
- `std::endl` flushes in the background
- No buffer between objects printed
- Readability concerns with long `std::cout`

### `std::cin`

- Can get input from stream with `>>`
- Can directly assign to existing variables
- Can take input one line at a time -> buffer
- Read `int`
    - Consume whitespace
    - Consume `-` if any
    - Read digits
    - Read anything else? -> stop
- Read `std::string`
    - Consume whitespace
    - Read characters
    - Stop on whitespace
- Read `double`
    - Read like `int`
    - Except allow `.` to occur up to one time
- Insufficient input
    - Run out of input?
    - Read more input

### `std::getline`

- Pass input stream and string variable
- Read everything up to the next newline
- Newline is consumed, but not stored

### `std::ignore`

- Skip the characters passed in