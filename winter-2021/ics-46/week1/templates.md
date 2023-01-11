# Templates

## Function templates

- Consider the following function that swaps two integers

```C++
void myswap(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}
```

- It will work *fabulously* with integers
- Not so much with doubles, or any other type because they do not match
- Could write a function for every type we want to swap (should make you cringe)
- Use a function template!
    - Templates are declared
    - Templates are instantiated when called

```C++
template <typename T>
void myswap (T& a, T& b) noexcept(noexcept(T{a}) && noexcept(a=b) {
    T temp = a;
    a = b;
    b = temp;
}
```

- What is `T` allowed to be?
    - Constraints determined by what the function does
    - Misued templates will point you to inside the template (not the instantiated function)
- What about `noexcept`?
    - Use the conditional `noexcept`
    - The `noexcept` operator checks whether the code is `noexcept`

## Class templates

```C++
template <typename CoordinateType>
class Point {
    ...
}
```

- Define public and private members
- Declare in header file, implement in same header file
- Each member function is a function template

## Templates and exception safety

- Constructors
    - Initialize pointers to `nullptr`
    - Try to dynamically allocate
    - Use the catch and rethrow
        - Delete pointers in reverse order
        - Rethrow the exception
- Destructors
    - Standard destructor
    - Mark as `noexcept`
- Copy assignment
    - Perform a self assignment check (`if (this != &t){...}`)
    - Make the copies first
    - Follow constructor pattern if copying fails
    - Delete old, point to new copy