# Static members

## In front of member variables

- Member variable belongs to the class, not the object
- Exists for the lifetime of the program
- Functions sort of like a global variable
- Must be scoped by the class, not class instances

## In front of member function

- Called on class as a whole, not on objects of the class
- There is no `this` pointer
- No direct access to non-static member variables/functions