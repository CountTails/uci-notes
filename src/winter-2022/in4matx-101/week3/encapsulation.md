# Encapsulation

## The concept of abstraction

- Abstraction helps humans deal with complexity
- Allows us to focus on essential attributes while ignoring others
- There are two types of abstraction
    - Process abstraction: `sort(list, list.size());` -- how? doesn't matter
    - Data abstraction: `List l; l.insert(1));` -- use list without understanding its implementation

### Use defined abstract data types (ADTs)

- An **abstract data type** (ADT) satisfies two conditions
    1) Interface
        - Defines a set of values and operations
        - Defined in one place *and* not dependent on any representation
    2) Representation
        - Is hidden from users of the type
- Programmers should be able to define ADTs

```C++
class Stack {
    Stack();
    ~Stack();
    bool isEmpty();
    bool isFull();
    void push(char e);
    char pop();
    char top();
};
```

- May be implemented as an array
- May be implemented as a singly linked list
- Stack users are unaffected by a representation change

### Design issues for ADTs

- Need a facility for defining ADTs, such as classes
- May need to overload built-in operators
- May requires iterators, accessors, constructors, or destructors
- Language may not support generic ADTs or parametrization of ADT instances

### C++ templates

```C++
template <typename T>
class PowerSet {
public:
    PowerSet();
    void addElement(T element);
    bool isElement(T element);
    PowerSet<T> union(PowerSet<T> right);
    PowerSet<T> intersect(PowerSet<T> right):
}

int main() {
    PowerSet<char> parens;
    parens.addElement(')')
    parens.addElement('(')
    char c;
    cin.get(c);
    if (parens.isElement(c)) {
        /*statements*/
    }
}
```

## Encapsulation constructs

- Two challenges as programs get large
    - You change one function in multi-million line program
    - My use many libraries that have same (duplicated) names
- Encapsulation mechanism can alleviate these problems
- Two motivations for encapsulation
    - Compilation encapsulation
    - Name encapsulation

### Compilation encapsulations

- C/C++
    - Use header files to specify abstractions `#include *.h`
    - Use source files to specify implementation `*.c`
    - Compiler translates source code into object code `*.o`
    - Object code can be used to create libraries or executables
- Java
    - Java source code is translated into byte code
    - Byte code modules can be zipped up into a downloadable unit known as a Java archive
 
### Naming encapsulations

- Important for building large systems and libraries
    - Prevents namespaces from getting too crowded or polluted
- Python uses a package and module system
    - Packages are installed into a searchable directory
    - Programmers use packages by importing names from them
- C++ uses namespaces
    - The very large `std` namespace encapsulates the standard library
    - Programmer code is placed in the default namespace if not specified

### Nested subprograms

- Allow for organizing naming
- Present in almost any modern programming language

```ADA
procedure main is
    x: integer := 10;
    procedure local is
    begin
        put(x); // local can reference vars/params in enclosing unit
    end local;
begin
    local; -- calls local procedure
end main;
```