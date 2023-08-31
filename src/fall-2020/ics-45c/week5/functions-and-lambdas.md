# Functions and lambdas

## Objects

### General objects

- Can be stored in variables
- Can pass them as arguments
- Return them from functions
- Store them in member variables

### Function objects

- Objects that can called like a function
- C++ functions are function objects

## The functional library

```C++
#include <functional>

int square(n) {
    return n * n;
}
std::function<int(int)> f = square;
// list the type information without the names
```

### Higher order functions

- Take functions are arguments
- Return a function as their result
- Can do both

### Lambda expressions

- Expression that builds a function

```C++
[ ](int i) {return i + i;};
```

- `[=]` copy (pass-by-value)
- `[&]` pass-by-reference
- Able to access enclosing scope