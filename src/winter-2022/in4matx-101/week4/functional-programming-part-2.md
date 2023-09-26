# Functional programming (part 2)

## Recursion

- **Recursion** is the primary method of control in LISP
- The general form of a recursive function is a *case analysis*
- The general form of a recursive function in LISP

```LISP
(defun f (x)
    (cond ((base case) (handle base case))
        ((recursive case) (calls f, but on a subproblem))
    )
)
```

### Types of recursion

- Tail recursion (AKA linear recursion)
    - Typically contains 1 recursive calls
    - Applies an action to every element of a list
    - Can be converted to a loop automatically
- Complete recursion
    - Break apart the list, apply the function to the `car` and `cdr` of the input list
    - Reassemble the results

### Tail recursion examples

```LISP
(defun length (l)
    (cond ((null l) 0)
        (T (plus 1 (length (cdr l))))
    )
)

(defun memq (a l)
    (cond ((eq a (car l) (cdr l)))
        (T (memq a (cdrl )))
    )
)
```

### Complete recursion examples

```LISP
(defun copy (l)
    (cond ((atom l) l)
        (T(cons((copy(car l)) (copy (cdr l)))))
    )
)

(defun append (l1 l2)
    (cond ((null l1) l2)
        ((cons(car l1) (append (cdr l1) l2)))
    )
)

(defun reverse (l)
    (cond ((null l) l)
        ((append (reverse (cdr l)) (cons (car l) NIL)))
    )
)
```

## Logicals

- Provide evaluates of boolean expressions
- Can accept an arbitrary number of arguments
- They are equivalent to using `cond`
    - `(and A B C)` is the same as `(cond (A (cond (B C))))`
    - `(or A B C)` is the same as `(cond (A) (B) (C))`
    - `(not A)` is the same as `(cond (A NIL) (T))`
- Logicals are evaluated with short-circuit evaluation
    - Evaluation is stopped when the answer is certain
    - May not evaluate the entire the expression (as it is not necessary)

```LISP
(setq i 10)
(and (> i 0) (< i 11) (!= i 100)) ; T
(and (< i 0) (< i 11) (!= i 100)) ; nil

(or (> i 0) (> i 11) (!= i 10))  ; T
(or (> i 0) (< i 11) (!= i 100)) ; nil
```

## Input/Output

- `read`: reads an expression from stdin and returns it
- `print`: write an expression to stdout and returns `NIL`
- `terpri`: prints a newline and returns `NIL` (short for "ter(minate) pri(nt)")
- LISP operates as a read-evaluate-print loop (REPL)

## Environment

- To run the list interpreter: `$ alisp`
- Include a file with `-> (load "foo.l")`
- Call functions as lists `-> (reverse '(a b c))`
- Exit the LISP interpreter with `(exit)` or CTRL+D
- Tracing
    - Shows what is going on in your LISP program
    - Can trace function and variables
    - Start tracing with `(trace x)` and stop tracing with `(untrace x)`
- Interrupts
    - Stop a running program to allow examining of the execution state
    - Insert `(break)` where you'd like to stop or use CTRL+C at runtime

## Functional forms

- A **functional form** operates on functions (AKA higher order functions)

```LISP
(defun f (x) (+ x 2))
(defun g (x) (* 3 x))
```

- Functions can be composed within each other

```LISP
(defun h1 (x) (f (g x)))
(defun h2 (x) (g (f x)))
```

- Functions can map values in a list

```LISP
(map 'g '(4 6 10)) ; yields (12 18 20)
```

## More on evaluation

- Always evaluate to themselves
    - `T` and `NIL`
    - Numbers and strings
- Symbols
    - Evaluate to their value
    - Values are assigned by parameter binding (or `set`/`setq`)
- Lists
    - Evaluated as function calls
- `eval` can be used explicitly to allow additional evaluation 