# Contracts and exceptions

## Contracts

- Write a function to calculate the square root of a number

```Python
def sqrt(n):
    '''
        Returns the square root of n
        n must be non-negative
    '''
    ...
```

```C++
// Returns the square root of a number n
// n must be non-negative
double sqrt(int n) {...}
```

### Function contracts

- Preconditions: things that must be true before call
- Post conditions: things that must be true after the call if the preconditions were met
- Side effects: things that happen other than computing and returning a value

### Class contracts

- All member functions have the contracts listed above
- Class invariants: things that must be true after each member function completes successfully

### Proposed syntax for contracts (ultimately rejected)

```C++
double sqrt(double n)
[[expects: n >= 0.0]]
[[ensures: sqrt(n) >= 0.0 && std::abs(sqrt(n) * sqrt(n) - n) < 0.00001]]

class Vector{
private:
    std::string* items;
    unsigned int sz;
    unsigned int cap;
[[ensures: items != nullptr && cap >= sz]]
}
```

## Exceptions

- Function can either succeed of fail
- Functions fail by throwing an exception

```C++
class DivideByZeroException {
    // Can be an empty class
    // Does not need  to inherit from a base exception class
}

double divide(double n, double m) {
    if (m == 0.0) {
        throw DivideByZeroException{};
    }
    return n / m;
}
```

- Exception will propagate up the runtime stack until caught and handled

```C++
void foo() {
    do {
        double n;
        double m;
        std::cin >> n >> m;
        try {
            std::cout << divide(n, m) << std::endl;
            break;
        }
        catch(DivideByZeroException&) {
            std::cout << "That's division by zero!" << std::endl;
        }
        catch (...) {
            std::cout << "Something else went wrong!" << std::endl;
            // Catches any type of exception
            // Useful for the catch and rethrow pattern
        }
    } while(true);
}
```

- Only one exception is allowed to exist
- Two exceptions will crash the program
- Destructors should never throw exceptions

## Exception safety

- Principles of ensuring that we have reasonable outcomes in the cases when exceptions are thrown
- No guarantee
    - All bets are off
    - May leak memory
    - Class invariants may not hold
    - Should exit the program
- Basic guarantee
    - Class invariants still valid
    - Doesn't leak memory
- Strong guarantee (rollback)
    - No change to object if exception is thrown
    - May be expensive to rollback
- No throw guarantee
    - Promise to not throw an exception

```C++
double booPerfectionLevel() noexcept {
    return std::numeric_limits<double>::infinity();
}
```

- Function is intended not to throw an exception
- Program terminates if it does
- Condition `noexcept`
    - `noexcept(bool)`
    - Useful for templates