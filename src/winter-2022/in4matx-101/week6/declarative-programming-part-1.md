# Declarative programming (part 1)

## Logic programming

### Big idea

- Code is declarative; programmer specifies "what to do" and not "how to do".
- A logic program declares
    1) Facts
    2) Rules of inference (to derive more facts)
- The language processor (typically an interpreter)
    1) Given a problem
    2) Infers a solution

### A logic programming language

- The most successful programming language is Prolog
- A Prolog program declares **true** relationships
- Relationships may be specific facts or rules of inference
- You ask questions and it comes back with answers
- Anything that cannot be inferred is assumed to be `False`
- Answers are derived from depth-first-search and unification to infer new facts

## Prolog

### Terms

A term is either ...

- A constant
    - An atom (identifier starting with a **lower case** letter)
    - An integer
- A variable 
    - An identifier starting with an **upper case** letter
    - A single underscore denoting an unknown
- A structure consisting of
    - A functor (similar to a function) that is **not** a function
    - A component list (similar to a arguments list) providing facts to a functor

```prolog
tvShow(theSimpsons, on(fox, date(sunday), time(8, 0)))
```

### Sentences

A sentence is one of the following

- A term, which is a statement of fact
- An implication $\text{term1} \implies \text{term}$
- An implication of conjunctive terms $\text{term1} \land \text{term2} \implies \text{term}$
- An implication of disjunctive terms $\text{term1} \lor \text{term2} \implies \text{term}$

A sentence *always* ends with a period

### Facts

- Specific relations believed to be true
- Prolog only knows
    - What you tell it to be true
    - What it can infer
- Prolog does not know
    - What it isn't told
    - What it cannot infer

### Rules of inference

- Allow for inferring of new facts
- Like writing a function

```prolog
siblings(X, Y) :- mother(P, X), mother(P, Y)
siblings(X, Y) :- father(P, X), father(P, Y)
```

### Query or goal

- Question can be predicates

```prolog
?- mother(marge, bart)
True
```

- Questions can be in the form of an incomplete sentence

```prolog
?- mother(marge, Y)
Y = bart
; % asking for another solution
Y = lias
; % asking for another solution
Y = maggie
; % asking for another solution
no % no more solutions found
```