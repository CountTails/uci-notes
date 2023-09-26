# Functional programming (part 1)

## Functional programming basics

- Imperative languages are influenced by the von Neumann architecture
- Functional languages are based on mathematical functions
- LISP was the first (1958) but others have since followed
- AI and early programming environment research was done in LISP

### Mathematical functions

- A **function** is a mapping from the *domain set* to the *range set*
- A **function definition** is applied to an element of the domain
- It yields or returns a member of the range
- Evaluation is controlled by conditional and recursion
- Functions have **no side effects**

### Simple functions

- Define

```LISP
(defun square (x) (* x x))
```

- Apply

```LISP
(square 9.0) ; yields 81.0
```

- Lambda are literal functions

```LISP
(lambda (x) (* x x))
```

- Lambda can be applied directly to an argument

```LISP
((lambda (x) (* x x)) 9.0) ; yields 81
```

### Pure functional languages

- Have no variables or assignment operators
    - Only parameters and binding parameters to arguments
- No looping (only recursion)
- Functional languages typically have the following form
    - A set of primitive functions
    - A set of functional forms
    - A function application operation (`apply`)
    - A data structure that is usually recursive
- Functions are applied to arguments
    - Parameters are usually bound to **evaluated** arguments

## LISP

- Originally developed for doing symbolic differentiation
- Early LISP, called Pure LISP, is a simple, functional language
- Has dynamic scoping, dynamic typing, dynamic evaluation, dynamic allocation
- Programs and data use the same representation
- Memory is reclaimed by **garbage collection**
- Evolved to include imperative language features for efficiency

### Data types

- A **symbolic expression** is either an atom or a list
- `NIL` represents the empty list
    - Is also an atom and represent `FALSE`
- An **atom** can be any of the following
    - A number
    - A symbol
    - A string
- A list has two components: `car` and `cdr`
    - `car` and `cdr` are both **symbolic expressions**
- `'T'` evaluates to `'T'` and is used to represent `TRUE`
- `'` prevents evaluation (`'(A B)` evaluates to `(A B)`)

### Evaluation

- Some things evaluates to themselves
    - `'T'`
    - `NIL`
    - Numbers
    - Strings
- Symbols are treated as *parameters/variables*

```LISP
(setq a '(a b c)) ; A -> (A B C)
```

- Lists are treated as function calls
    - Parameters are evaluated (recursively)
    - Function is applied to the evaluated parameters
- `defun`, `'`, and `cond` are evaluated specially

### Primitive functions

- `cons` is like the new operator 
- `car` is like the data property of the linked list
- `cdr` is like the next property of the linked list

```LISP
(cons 'a 'b) ; (A . B)
(cons 'a (cons 'b nil)) ; (A B)
(car '(a b)) ; A
(cdr '(a b)) ; (B)
```

### Variables and quote

- `set` is like the assignment operator

```LISP
(set 'a '(1 2 3)) ; expands to (set (quote a) (quote (1 2 3)))
a ; (1 2 3)
```

- `setq` is like `set`, but its first argument is automatically quoted

```LISP
(setq a '(1 2 3)) ; notice how a does not need to be quoted
a ; (1 2 3)
```

### `EQ` and `EQUAL` functions

- `EQ` is simply a pointer comparison function
    - It states whether two pointer are the same
    - Used for comparing atoms are it does not perform a deep comparison
- `EQUAL` is a recursive comparison function
    - It compares all atoms in a list for equality
    - Can still be used on atoms alone

```LISP
(eq 'b 'b) ; T
(eq 'a 'b) ; NIL
(eq '(a b) '(a b)) ; NIL a deep comparison is NOT performed
(eq '((a) (b) (c)) '((a) (b) (c))) ; NIL, again no deep comparison
(equal '(a b) '(a b)) ; T, deep comparison is performed
(equal '((a) (b) (c)) '((a) (b) (x))) ; NIL
(equal '((a) (b) (c)) '((a) (b) (c))) ; T
```

### Predicates

- Answer a true/false questions for its given arguments

```LISP
(null x) ; check if x is NIL
(atom x) ; check if x is an atom
    (symbolp x) ; check if x is a symbol
    (numberp x) ; check if x is a number
    (stringp x) ; check if x is a string
(listp x) ; check if x is a list
```

### List construction

- `cons` to put together a new head and existing list together
- `list` can place a series of symbols into a list
- `append` can add elements to an existing list

```LISP
(cons 'a '(b)) ; (a b)
(cons 'a 'b) ; (a . b)
(list 'a 'b 'c 'd 'e 'f) ; (a b c d e f)
(append '(a b c) '(d e f)) ; (a b c d e f)
```

### Basic list functions

- `length` determines the number of atoms in a list
    - Only considers the top level list
    - Does not count elements in a sublist, simply counts the sublist as one atom
- `memq` determines if an atom is in a list (top-level only)
- `member` determines if an atom is in a list (any level)
- `reverse` reverses a list
- `copy` makes an identical deep copy of a list

```LISP
(length '(a b c)) ; 3
(memq 'c '(a b c)) ; (c)
(member '(a b) '(x (a b) (c))) ; ((a b) (c))
(reverse '(a b c)) ; (c b a)
(copy '(a b c)) ; (a b c)
(eq 'a (copy 'a)) ; T
(equal '(a b) (copy '(a b))) ; T
```

### Arithmetic

- Can use a descriptive word or an operator
- Can take an arbitrary number of arguments

```LISP
(plus 2 3 4) ; 9
(minus 10 5 3) ; 2
(times 2 3 4) ; 24
(divide 6 3 2) ; 1
```

### The conditional expression

- Similar to an imperative `if` statement
- Allows for distinguishing of cases for recursion

```LISP
(cond (cond1 exp-list1) ; called a cond clause
    (cond2 exp-list2) ; each clause takes a list of expression to execute if chosen
    ...
    (condN exp-listN)
)
```

```LISP
(defun flatten (l)
    (cond ((null l) nil)
        ((atom l) (cons l nil))
        ((listp l) (append (flatten (car l)) (flatten (cdr l))))
    )
)
```

### User defined functions

- Use `defun` to define a function

```LISP
(defun function_name (parameter-list) expression-list)
```

- Functions start a single expression and expression grows from the expression list parameter

```LISP
(defun fact (n)
    (cond ((eq n 0) 1)
        ((> n 0) (times n (fact (minus n 1))))
    )
)
```

- Functions are called as lists
    - The first element is the name
    - The remaining elements are the arguments to pass

```LISP
(fact 3) ; 6
```