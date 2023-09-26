# Object oriented languages (part 2)

## Implementation of classes

- A class is a record structure
- Address of objects in passed to each method (the `this` pointer)
- Static methods have no `this` parameters
- Static methods are called directly (like a regular subprogram call)

### Implementing inheritance

- A derived class gets its parent data plus any it adds
- Derived class constructors
    - First calls all parent constructors
    - Then it does its own construction
- Derived destructor
    - First does its own destruction
    - Then calls parent destructor

### Implementing virtual functions

- Every object has a pointer to its method table
    - This pointer is called `vpointer`
    - The table is called a `vtable`
- Each concrete class containing one or more virtual functions has a unique `vtable`
    - `vtable` is an array of pointers to object's virtual functions
    - `vtable`s are built before runtime
- Each virtual function is assigned an index into the `vtable`
- `vpointer`s are assigned automatically in the constructor
- Virtual functions are called through the `vtable`

```C++
this->vpointer[vfunctionIndex](this, args);
```
## Homework tour

### The `Shape` class in Java

```Java
class Shape {
    private String name;
    
    Shape(String name) {
        this.name = name;
    }

    double area() {
        return 0;
    }
}
```

### The `Shape` class in C

```C 
struct Shape {
    char* name;
    (*void)()* vtable;
}

double shape_area() {
    return 0;
}

void kill_shape() {
    free(name);
}

Shape make_shape(char* name) {
    return Shape (
        name,
        {&kill_shape, &shape_area}
    );
}
```

### Continuing from here

- Define subclasses of the `Shape` class in Java
- Translate the subclasses into C, updating each classes `vtable` pointer as needed
- Test your solution by running the following `main` method in both languages

```Java
public class Picture {
    public static void main(String[] args) {
        double total = 0.0;
        Shape[] shapes = {
            /* Various subclasses of Shape */
        }
        for (Shape s: shapes) {
            total += s.area();
        }
        System.out.println("The total area is: " + total);
    }
}
```