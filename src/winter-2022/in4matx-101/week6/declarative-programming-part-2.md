# Declarative programming (part 2)

## Unification

- Means "to make one" or equal
- Atoms unify to atoms that are spelled the same
- Number unify to numbers with the same value
- Two terms unify if
    - They are the same atom, or if one is a variable
    - It is a relation and they have the same functor (and their components unify)
- Example
    - `mother(marge X)` and `mother(marge, bart)`
    - Can merge if and only if `X = bart`

## Arithmetic

- Expressions are structure terms
- They are not normally evaluated
- The `is` keyword forces evaluation

### Sum to N

```prolog
sumToN(L,L,L).
sumToN(L,U,R) :- L<U, NewU is U-1, sumToN(L,NewU,NewR), R is U+NewR.
```

```prolog
?- sunToN(1,10,R).
R = 55
```

### Print range

```prolog
print(U,U) :- write(U), nl.
print(L,U) :- L < U, write(L), nl, M is L+1, print(M, U).
```

```prolog
?- print(1, 10)
1
;
2
;
3
;
4
;
5
;
6
;
7
;
8
;
9
;
10
;
no
```

## Lists

- Prolog also supports lists
- `[H|T]` may unify `H` with first element and `T` with rest of the list, which may be empty
- `[H|T]` may also construct a new list with `H` added on to the list `T`, the empty list is `[]`

### Append lists

```prolog
append([],L,L).
append([H|T],L,[H|NewT]) :- append(T,L,NewT).
```

```
?- append([a,b],[c,d],L) % What list is [a,b]+[c,d]?
?- append(X,[c,d],[a,b,c,d]) % What list appended to [c,d] is [a,b,c,d]?
```

### Length

```prolog
length([],0) % base case
length([H|T],R) :- length(T,Tlength), R is Tlength+1. % recursive case
```

## Running prolog

```prolog
$ swipl
?- consult(mydefs) % import facts and rules of inference from the file
...
?- ^D
[Prolog execution halted]
```