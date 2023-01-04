# Contracts and exceptions

## Python

- `def sqrt(n): ...`
- Has the unstated assumptions
    - $n \ge 0$
- Have to be stated in natural language as comments
- **Cannot** be automatically checked

## C++

- `double sqrt(double n);`
- Has the unstated assumptions
    - $n \ge 0$
- Types can be checked automatically (parameter and return types)
- **Cannot** check value

## Contracts

- Functions in C++ have contracts associated with them
    - Preconditions: things that must be true before function runs
    - Post conditions: things  that must be true after function runs
    - Side effects: things that happen other than computing and returning a value (i.e. write to a file)
- Classes also have contracts associated with them
    - Every member function has the same contracts listed above
    - Class invariants: things that must be true after every member function succeeds

## Exceptions

- Are **thrown**, not *raised*
- *Any* object is throwable
- Represents one instance of failure
- Throwing is similar to returning
    - Control is given back to the previous call frame
    - Exception is handled when it is caught

```C++
try {
    // block of statements that might throw an exception
}
catch (MyException&) {
    // If any exception thrown deal with it here
    // Can catch a specific exception
    // Should catch by reference to
        // Avoid copying
        // Allow catching of more general exceptions that are part of an inheritance heirarchy
    // Can have as many cases as you want
    // Catch clauses are checked in the order listed; first match is used
}
catch (...) {
    // Catch anything (can relate to Python's finally clause)
    // Useful for
        // Catch and rethrow
        // Clean up and rethrow
}
```

## Exception safety

### Destructors

- Should never throw exceptions
- When an exception is thrown during exceptions propogation, program terminates
- Only **1** exception may be active at any given time

### Guarantees

- The principle of ensuring reasonable outcomes when exceptions are thrown
- Classes in C++ make one of the following guarantees about failure
    - No guarantee: All bets are off, good luck
    - Basic guarantee: Object will be left in a consistent (valid) state
    - Strong guarantee: Object returned to state before call (rollback)
    - No throw guarantee: Will *never* throw an exception