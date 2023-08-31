# Inheritance in C++

## Class

- Group methods and data
- Can have isolated instances

## Inheritance

- Building a new class from an existing class
- Includes the existing class

```C++
class Student: public Person {}
```

- `:` means "inherits from"
- `public` means the entire program is aware of the relationship
    - Most inheritances should be public
- Constructors and destructors are not inherited (must be redefined for each class)

### Inherited constructors

- Can reuse parent constructors in child class

```C++
class Student: public Person {
    Student() : Person{name, age}, id{id} {}
}
```

- First calls the inherited constructor, then the parent constructor
- Initializes *all* child members

### Inherited destructors

- Destroyed in opposite of construction
- Slicing
    - Inherited part not copied
    - Parent cannot be used to initialize child
- Pointers and references
    - Can point/refer to any object that is a parent class

## Polymorphism

- Overriding of inherited member functions
    - Call inherited method in overwritten method
- Must be *enabled* (disabled by default)
    - declare member function `virtual` in parent class

### Virtual functions

- Enabled on a function-by-function basis
- put where **needed**
- cascades throught the heirarchy

### Lookup

- The method to call is decided at run-time
- Based on the **object** type, not the variable type

### The `override` keyword

- Specifies intent to override something
- Compiler error if not done so

### Virtual destructors

- Use the correct destructor at runtime
- Can force the default with: `~ClassName() = default`