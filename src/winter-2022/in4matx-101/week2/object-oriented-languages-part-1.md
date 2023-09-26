# Object oriented languages (part 1)

## Key languages features

1) Class definition mechanism
    - Interface: seen by clients (how to use it)
    - Implementation: how object stores its state
2) Class inheritance
    - Allow reuse of code and polymorphism
    - Single inheritance allows at most one parent class
    - Multiple inheritance allows multiple parent classes
3) Dynamic dispatch
    - Also called virtual functions or late binding
    - Allows for polymorphic programming
    - Design and construction of reusable software frameworks

## OO programming in SmallTalk

- A program is a collection of interacting objects
- Object communicate via messages
- Message response definitions are called methods
- Messages are bound to methods dynamically
- Collection of methods defined on an object is its method protocol
- Everything is an object (even primitive types)
- A class defines common characteristics of objects
- A subclass inherits data and functionality of its superclass
- May also override inherited functions to change their behavior
- Overloading is defining more than one function with the same name (context allows disambiguation)

## OO programming in C++

- Designed to allow incremental transition from C to OOP
- Also allows programmer options of efficiency and flexibility
    - Static binding is the default
    - Dynamic binding is used only for declared **virtual functions**
- Support for multiple inheritance
- Objects may be accessed directly, via references, or via pointers
- Allocation may be static, stack, or heap
- Also allows for just plain functions
- Primitive types of not objects (for improved efficiency)
- Programmer has control over construction, copying, assignment, and destruction
- Programmer can overload operators, functions, and member functions
- Programmers usually must manage storage
    - Can be difficult to do correctly
    - May use smart pointers (`std::shared_ptr` or `std::unique_ptr`)

## OO programming in Java

- Designed to allow safe, portable downloadable object code
- Java source is translated to byte code
    - May interpret byte code on the Java virtual machine
    - Or a Just-In-Time (JIT) compiler to translate to native code
- Every user definition is a class
- Primitive types of not objects
- All objects (and arrays) are allocated dynamically on the heap
- All objects are accessed via references (like pointers)
- `=` does pointer assignment and `==` does pointer equality
- Programmer can overload only methods, not operators
- Copying is done via a method called `clone`
- All primitives are passed by value
    - Objects are shared because references are passed by value
- Default binding is dynamic, but static is an option (final)
- Storage is reclaimed via garbage collector