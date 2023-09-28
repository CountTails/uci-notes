# Parameter passing

## Semantics for parameter passing

- "In mode": actual transmits data in the formal parameter
- "Out mode": formal transmits data to the actual
- "In-Out mode": actual transmits to formal (on entry), then formal transmits to actual (on exit)

### Pass by copy

- Formal is given its own storage area
- Values are **copied** between formal and actual

#### Pass by value

- **Most common in practice**
- Formal is initialized to actual's value
- No information flows back to the actual (modifications in subprogram do not persist after return)
- May pass constant actual parameters

#### Pass by result

- The formal has no incoming value and is initially undefined
- Value is **copied** into the actual when subprogram returns
- Copy does not take place if the functions fails

#### Pass by value-result

- Formal is initialized to actual's value
- Change to formal is not immediately reflected in actual
- Value of formal is copied into actual when subprogram returns

```FORTRAN
PROCEDURE test IS
    a: ARRAY (0..2) OF integer := (OTHERS => 2); ![2, 2, 2]
    i: integer := 1;
    PROCEDURE swap(a : COPY_VR integer, b : COPY_VR integer) IS
        temp: integer; ! a = 1, b = 2
    BEGIN
        temp := a; ! temp = 1
        a := b;    ! a = 2
        b := temp; ! b = 1
    END;
BEGIN
    swap(i, a[i]); ! i = 1, a[1] = 2 -> i = 2, a[1] = 1
    put(a); ! [2 1 2]
END test;
```

### Pass by reference

- Formal is a pointer to the actual data object
- One implicit level of indirection at each reference to the formal
- Modification of formal causes immediate modification to the actual
- Must pass variables and not literal constants

```FORTRAN
PROCEDURE test IS
    a: ARRAY (0..2) OF integer := (OTHERS => 2); ![2, 2, 2]
    i: integer := 1;
    PROCEDURE swap(a : REF integer, b : REF integer) IS
        temp: integer; 
    BEGIN
        temp := a; ! temp = *i
        a := b;    ! a = *a[1]
        b := temp; ! b = *i
    END;
BEGIN
    swap(i, a[i]); ! *i , *a[1]  -> i = 2, a[1] = 1
    put(a); ! [2 1 2]
END test;
```

### Pass by name

- Similar to pass by reference, except actual is re-evaluated in the calling scope at each reference
- Requires an implicit function `thunk` to calculate the address of actual at each reference to the formal

```FORTRAN
PROCEDURE test IS
    a: ARRAY (0..2) OF integer := (OTHERS => 2); ![2, 2, 2]
    i: integer := 1;
    PROCEDURE swap(a : NAME integer, b : NAME integer) IS
        temp: integer; ! i, a[i]
    BEGIN
        temp := a; ! temp = 1
        a := b;    ! a = 2
        b := temp; ! b = 1
    END;
BEGIN
    swap(i, a[i]); ! i = 2, a[1] = 2 -> i = 2, a[2] = 1
    put(a); ! [2 2 1]
END test;
```

- Enables functions to do more than one thing

```C++
// i is the loop control variable
// v is the thing to add
// n is how many times to add
int sum(int NAME i, int NAME v, int NAME n) {
    int total = 0;
    for (i = 0; i < n; i++) {
        total += v;
    }
    return total;
}
```

- Depending how `sum` is called, it can do different things

```C++
sum(i, i, 10); // Sum the first 9 positive integers
sum(i, m[i][i], 10); // Sum the diagonal entries in a matrix
sum(i, m[0][i], 10); // Sum the first row of a matrix
sum(i, m[i][0], 10); // Sum the first column of a matrix
sum(i, fact(i), 7); // Sum the first 7 non-negative factorials
```

## Evaluating parameter passing modes

### Complex example

```C++
int x = 1;
int y = 2;
int a[4] = {0, 3, 2, 1};

int main() {
    do_something(a[a[x]], a[y-x+1]); // r = 1, t = 2
    put(a); // [0, 3, 2, 1]
}

void do_something(int r, int t) {
    x = x + 1; // x = 2
    y = r + 2; // y = 3
    r = y + t - 2 * r; // r = 3
    t = x + r; // t = 5
    a[r] = 1; // r[3] = 1
}
```

### Hints

- Copy
    - Value: initialize formals to actual's value
    - Result: Copy formal value to actual on return
    - Value-result: initialize, then copy on return
- Reference
    - Textually substitute evaluated actual for all occurrences of formal
    - Implemented as a pointer to the evaluated actual
- Name
    - Textually substitute literal actual for all occurrences of the formal
    - Referencing environment for actual is the calling environment

### Modes in languages

- FORTRAN: all by reference
- LISP, Python: all by value (but all variables/parameters are references)
- Algol: name by default with the option of value
- C++: value by default with the option of reference
- Java: primitives by value, objects by reference
- Ada: copy or reference, compiler's choice

## Accessing non-local environments

- Problem: we want to reference a non-local variable with offset $o$ and distance $d$
- Two common approaches
    - Static chain
        - A linked list of activation records
        - One pointer per activation record
        - Gives $O(d)$ access to non-local variables
    - Displays
        - An array of activation records
        - One array per activation record
        - Gives $O(1)$ access to non-local variables

### Stack frame

- Holds all information needed for subprogram activation
- Typically holds the following
    - Parameters
    - Local variables
    - Temporary variables
    - Saved registers (restored just before return)
    - Return address
    - Dynamic and static links for non-local environments
    - Return value (if it doesn't fit in a register)

### Local blocks

#### Static variables

- Reallocate storage blocks for each entry
- Preallocate all storage once at subroutine activation
- May overlay variables from disjoint blocks (like unions)

```C++
int main() {
    int n = 10;
    int m = 20;
    for (int i = 0; i < n; i++) {
        int local = 50;
        m += i * local
    }
    for (int i = 0; i < n; i++) {
        int diff = m - i;
        m *= n;
    }
}
```

- The activation record might look like

```
+------------+
|      n     |
+------------+
|      m     |
+------------+
|     i/i    | // Name reused, can share memory
+------------+
| local/diff | // Lifetimes are disjoint, can share memory
+------------+
```

#### Dynamic variables

- Dynamic variables lifetime must follow scoping rules

```C++
int main() {
    string h("hello");
    for (int i = 0; i < n; i++) {
        string t("there"); // Born and dies every iteration
        std::cout << h << ' ' << t << std::endl;
    }
}
```

