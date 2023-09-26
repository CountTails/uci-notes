# Names, bindings, and scopes

## The concept of binding

- Central to understanding the semantics of programming languages
- Program "entities" are types, variables, subprograms, or statements
- Properties of these entities are called attributes
- Assigning meaning to an attribute is called **binding**
- Bindings for an entity are stored in a repository called a **descriptor**

### Binding time

- Binding time is when the process of binding takes place
    - Static binding occurs before runtime
    - Dynamic binding occurs at runtime *and* may change at runtime
- Languages with dynamic binding tend to be interpreted
- Languages with static binding tend to be compiled

### Variables

- Variables are an abstraction of memory
- In the von Neumann architecture have memory of the form: `address: value`
- Variables have the several attributes
    - Name
    - Scope
    - Lifetime
    - Value
    - Type

### Names

- Often called **identifiers**
- Used to identify most programming language entities
- May be restricted by a few rules
    - May be case sensitive or insensitive
    - May allow underscores or other special characters
    - May or may not have a maximum length
- Keywords are special names that have a special meaning in the language
- Reserved keywords may not be used as identifiers

### Variable initialization

- Initialization is binding a value at storage biding time
- Typically done dynamically, but can be done statically for static variables
- Some languages have default initializations and others do not

## The concept of scopes

- The range of instructions over which a variable is accessible
- May be global, local or non-local
- Scope may be dynamic or static

### Stack frame

- Also known as an **activation record**
- Provides a local environment for a subprogram to run
- Variables outside of the subprograms stack frame are part of the non-local or global environment
- When to (or more) names denote the same data object, they are called aliases
- Side effects are modifications of a non-local data object (or more strictly any variable)
- Activation
    - Subprogram units actives themselves directly or indirectly
    - Each activation has its own stack frame
    - Binding of stack frame to code is dynamic
- The return point is a pointer to the caller's code segment upon return
- The dynamic link is a pointer to the caller's stack frame
- The static link is a pointer to the stack frame of the lexically enclosing subprogram unit
    - Non-local variables are access by traversing these links

### Dynamic scoping

- Scope is defined in terms or program execution and may change during execution
- A variable's scope is in effect until a new declaration of the same name is encountered
- Easy to implement in interpreted languages

```Lisp
(setq x 10)
(defun f() (print x)) 
(defun a (x) (f))
(defun b (x) (f))
(a 20) ; prints 20
(b 30) ; prints 30
(f).   ; prints 10
```

### Static scoping

- Scope is defined in terms of layout of a program
- Also known as lexical scoping
- Usually more efficient
- Each variable reference is known before runtime
    - Names not required in compiled languages
    - Can use the offsets from the stack frame pointer
    - Names required in interpreted languages

```C++
int x = 20; // Always in scope if not defined locally
int f() {std::cout << x;}
int g() {int x = 10; std::cout << x; f();}
g(); 
/*
10
20
*/
```

### Lifetimes

- The time storage area (for value) is bound to a variable
- This area of storage is called a **data object**
- Acquiring storage area is called **allocation**
    - Can be done statically before runtime
    - Can be done semi-statically at runtime on the stack frame
    - Can be done semi-dynamically at runtime on top of the stack frame
    - Can be done dynamically on the heap

## The concept of types

- Specifies a class of values and operations to create, access and modify
- Languages usually include some predefined types
    - Primitive types like `int`, `char`, and `float`
    - Often machine oriented for efficiency
- Most allow programmers to define new types

```C++
class Stack {
    int top;
    int values[100];
public:
    ...
}
```

### Type binding

- Static type binding: bound at declaration before runtime
    - Binding occurs during translation time (compiler to machine or byte code)
    - More efficient as type checks are not needed at runtime
- Dynamic type binding
    - Descriptors bound at runtime
    - Requires dynamic type checking and operator resolution at runtime
    - Easier to implement in an interpreted language

### Type checking

- Used to check for consistent usage in statically typed languages
- Used to resolve operates
    - `2 + 3` uses `int.__add__`
    - `"2" + "3"` uses `str.__add__`
- Strong typing
    - Means that all type errors will be detected
    - May mean all type checking is done at compile time
    - Also includes consistent dynamic typing in object-oriented languages
- Type conversion may be done
    - Implicitly: automatically when needed
    - Explicitly: only when asked for by programmer (i.e casting)

### Type compatibility

- Name equivalence
    - Types are equivalent if they have the same name
    - Differs from aliases of the same type
    - This is the stricter ruleset for type equivalence
- Structural equivalence
    - Types are equivalent if they have the same name
    - **OR** if they have the same constructors for equivalent types (same size by parts)

```C++
typedef float celsius;
typedef float fahrenheit;
struct Stack {
    int top;
    int values[100];
};
struct Vector {
    int index;
    int values[100];
};
celsius a, b, c;
fahrenheit d, e, f;
Vector m, n, o;
Strack r, s, t;
```

- The following are name equivalent
    - `a`, `b`, `c`
    - `d`, `e`, `f`
    - `m`, `n`, `o`
    - `r`, `s`, `t`
- The following are structurally equivalent
    - `a`, `b`, `c`, `d`, `e`, `f`
    - `m`, `n`, `o`, `r`, `s`, `t`

### Values and named constants

- A binary value
- Interpreted according to a variable's type
- A dynamic value means that it can change at runtime
- A static value cannot change
- A literal constant such a numeric literal or a quoted string
- Symbolic constants are values determined at runtime
- Manifest constants are values known at compile time
- Proper use greatly enhances modifiability of a program