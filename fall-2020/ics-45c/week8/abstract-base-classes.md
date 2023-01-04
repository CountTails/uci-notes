# Abstract base classes

## Python

- Utilizes ducktyping
    - Objects are treated based on what **they are**
    - Determined at runtime
    - The right thing happens based on type
- Creating interfaces
    - Multiple classes having the same method with the same signature

```Python
class Circle:  
    def __init__(self, radius):  
        self._radius = radius  
  
    def area(self):  
        return 3.1415927 * self._radius * self._radius  
  
  
class Rectangle:  
    def __init__(self, width, height):  
        self._width = width  
        self._height = height  
  
    def area(self):  
        return self._width * self._height
```

## C++

### Inlining

- Replacing calls to a function with its body
- Done by compilers (an optimization)
- Done if the act of calling the function is more expensive than running it (think one-liners)
- Function body needs to be defined in a header file to allow this feature
- Can make code more difficult to read

### Implicit type conversion

- Constructor with **exactly** one parameter
- Allows objects to be created from one argument
- Must mark the constructor as `explicit` to disallow this feature

### Pure virtual functions

- Set the signature equal to 0
- Not giving the function a body, so setting it to `null`

```C++
class Shape  
{  
public:  
    virtual double area() const = 0;  
};
```

### Abstract base classes

- Class that is a general version of those inheriting from it
- A class with *at least one* pure virtual function
- Inherited member functions are virtual and **must** be overridden
- Allows for ducktyping behavior of derived classes
- Illegal to have an instance of an abstract base class
- Pointer and references are legal if they point to an instance of a derived class
- Destructor should be virtual

```C++
class Shape  // Abstract base class
{  
public:  
    virtual double area() const = 0;  
};

class Circle : public Shape  
{  
public:  
    double area() const override;  
};  
  
class Rectangle : public Shape  
{  
public:  
    double area() const override;  
};
```