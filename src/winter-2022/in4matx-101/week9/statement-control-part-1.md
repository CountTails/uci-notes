# Statement control (part 1)

## Control structures

- Control structures dictate how execution flows through a program
- Control at the unit level
    - Subroutines
    - Coroutines
    - Concurrent threads
- Control at the statement level
    - Sequencing
    - Selection (`if`/`switch` statement)
    - Repetition (loops)
- Early languages used `goto`
- Writability ad readability were primary concerns

## Sequencing

- Allows grouping of several statements into a single statement
- Statement are executed sequentially
- Some languages allow declarations inside

```C++
{
    int i = 0;
    std::cout << i << std::endl;
}
```

```Makefile
all:
    $(CC) -o main.o main.cpp -c
    $(LD) main.o -lc++ -o a.out
```

## Selection

- Allow a choice between statements
- Examples from C include `if` or `switch` statements

### 2-way selector

> Binary selection or conditional statement

```C
int i = 42;
if (i == 0)
    printf("i is zero\n");
else if (i > 0)
    printf("i is positive\n");
else
    printf("i is negative\n");
```

- Ambiguity arises in the indentation style, especially when nesting conditions
- Can match against unmatched conditionals or use a delimiting block

```C
int i = 42;
if (i == 0) {
    printf("i is zero\n");
}
else if (i > 0) {
    printf("i is positive\n");
}
else {
    printf("i is negative\n");
}
```

### N-way selector

> Match cases among many choices

```C
char c = getchar();
switch (c) {
    case 'a':
        ...
    case 'b':
        ...
    default:
        ...
}
```

- Typically implemented as a hash table, meaning cases are limited to allow for $O(1)$ selections
- Readability is dependent on language
    - C switches fall through each other, so `break` statement is needed to avoid it
    - Python match cases do not follow through, so no `break` statement is needed

### Unconditional branching

- `goto` statements can make programs difficult to follow
- Arise from machine level jump instructions
- May be restricted or not allowed at all
- A rich set of control structures eliminates the need for `goto` statements

## Guarded commands

- An alternative control structure proposed by Dijkstra
- Supports design methodology supporting correctness
- Potentially useful for concurrent systems

### Guarded `if`

```
if <boolean-expression-1> -> <statement-list-1>
    [] <boolean-expression-2> -> <statement-list-2>
    [] ...
    [] <boolean-expression-n> -> <statement-list-n>
fi
```

- All boolean expressions are evaluated
- One of the true ones is *selected non-deterministically* (at random)
- Associated statement list is executed

### Guarded `do`

```
do <boolean-expression-1> -> <statement-list-1>
    [] <boolean-expression-2> -> <statement-list-2>
    [] ...
    [] <boolean-expression-n> -> <statement-list-n>
od
```

- All boolean expressions are evaluated
- One of the rue ones is *selected non-deterministically*
- Associated statement list is executed
- Repeats until all expressions are false