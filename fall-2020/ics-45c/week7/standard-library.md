# The C++ standard library

## The standard library

- Containers (data structures)
    - Arrays to error-prone
- Generic algorithms
    - Common tasks
    - Unnecessary noise
    - One efficient, flexible implementation
- Iterators
    - Loop through members of containers generically

## Vector

- An array-based list
- [ArrayList](../week6/well-behaved-classes.md) from week 6 (but better)
- Well behaved
- Declaration
    - `std::vector v;` (wrong)
    - `vector` is not a class, it is a class template
    - Templates are blueprints for making classes
    - Instantiation: `std::vector<int> v;`
    - Can use an initializer list to initialize with values

## Iterators

- Hide differences of data structures
- Utilize pointer arithmetic
    - Only one way to iterate through an array
- The `begin()` member function returns an iterator pointing to start of data structure
- The `end()` member function returns an iterator pointing just beyond the end of the data structure
- Iterators act like pointers
- Why use iterators?
    - Forward iterators (can deference and bump and compare them)
    - Bi-directional iterators (can additionally bump backwards)
    - Random access iterators (can additionally bump of various lengths)
- The `auto` keyword
    - **NOT** anything you want
    - **NOT** a type free variable
    - Compiler must put in the correct type

### Constant iterators or `const_iterator`

- Only *read* from the data structure
- Cannot write to the data structure

### The range-based `for` loop

- Container
- Begin at start
- Stop just beyond the end
- Step one-at-a-time

## Generic algorithms

- In header `<algorithm>`
- `for_each`
    - start
    - stop
    - function
    - Applies function from start to end
- `all_of`
    - start
    - stop
    - function that returns a boolean value
    - Checks all from start to stop are true
- `count_if`
    - start
    - stop
    - function that retunrs a boolean value
    - Count if `function(start -> stop)` are true
- `transform`
    - start
    - stop
    - place for results (`back_inserter`)
    - function