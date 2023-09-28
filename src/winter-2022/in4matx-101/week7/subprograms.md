# Subprograms

## What is a subprogram

- A subprogram 
    - Is either a procedure (no return value) or function (with return value)
    - Suspends the calling unit and executes itself
    - Control returns to the calling unit when subprogram is done executed
- A subprograms definition describes the actions of the subprogram abstraction
- A subprogram call is an explicit activation of one subprogram by another subprogram

### Defining subprograms

- The *function prototype* or *subprogram header* declares the name, parameters and return type of a subprogram
- The *parameter profile* or *type signature* is the number, type, and order of the parameters and return type(s)

```C++
double plus(double x, double y); // Function prototype for plus

typedef double (*arithmeticFn)(double, double); 
// Function signature for functions that take 2 floating point values as input
// and return a single floating point value
```

### Design issues for subprograms

- What is the scope of parameters and variables?
- What parameter passing method is used?
- Is type checking performed on parameters?
- Where are local variables allocated? Stack? Heap?
- Can a subprogram be an argument to another subprogram?
- Is overloading of subprograms supported?
- Are generic subprograms supported?
- Do subprogram enable modularization for separate compilation?

## Referencing environments

- Local variables are those defined in a subprogram
- May be allocated statically (before runtime) or on the stack
- Static allocation
    - No runtime allocation/deallocation overhead
    - May retain values across calls
    - Access is direct (and may be faster)
- Stack allocation
    - Allows recursion
    - Allows efficient reuse of stack memory
    - Access is indirect (and may be slower)
    - Some machines may allow locals in CPU registers (much faster)

```C++
int next() {
    static int i = 0; // Allocated before runtime
    return i++;
}

int main() {
    while (1) cout << next(); // i is persisted across calls
}
```

### Arguments vs parameters

- Parameters are also called **formal parameters**
    - Those are named in the subprogram header
    - `void p(int x, int y){}` has 2 formal parameters: `x` and `y`
- Arguments are also called **actual parameters**
    - Those are given in a subprogram call
    - `p(1, 2)` has 2 actual parameters: `1` and `2`

### Binding methods

Consider the following subprogram definition

```C++
void p(int x, int y, int z = 0) {
    ...
}
```

- Parameters can be bound positionally
    - The order they are presented in a call is how they get mapped in the active subprogram
    - Requires exact number of parameters and correct types (if supported)

```C++
p(1, 2); 
// 1 is automatically bounded to x
// 2 is automatically bounded to y
// The number of parameters and their types are correct, execution proceeds
```

- Parameters can be bound as key-value pairs
    - The order they are presented no longer matters, they get mapped as specified in the call
    - For required parameters, exact number and type is required
    - For additional parameters, the number (and type) may be arbitrary
    - Can be mixed with positional, but **must come after** all positional

```C++
p(y=2 x=1);
// 2 is bound to y as specified in the call
// 1 is bound to x as specified in the call
// The number of required parameters is correct, execution proceeds
```

- Parameters can be given default values
    - Specified in the subprogram header
    - Does not need to be specified in call unless overriding the value
    - Can be mixed with positional, but **must come after** all positional

```C++
p(1, 2, 4);
// 1 is bounded to x automatically
// 2 is bounded to y automatically
// 4 is bounded to z, overriding its default value of 0
```