## Statement control (part 2)

## Counter controlled loops

- Useful when the number of iterations is known
- Particularly useful for processing arrays and files
- Scope of the loop control variable differs
    - C++/Java: variable is local to the for loop statement
    - Python: variable is local to current unit
- Programmer control over the loop control variable varies
    - Ada loop control variable are read-only
    - C++/Java/Python allow loop to reassign the loop control variable
- Loop parameters may be evaluated once, or per iteration

```C++
for (int i = 0; i < 10; i++) {
    /*statement*/
}
// i is not accessible beyond the loop boundary
```

```Python
for i in range(10):
    pass
print(i) # i can be used, will be set to the last value bounded to i
```

## Logic controlled loops

- Also known as condition driven loops
- Useful for doing something until a condition is met
- Test can be performed before iterations, guarding against unneeded execution
- Test can be performed after iterations, guaranteeing at least one execution

```C++
int a[10];
int i = 0;
while (i < 10) {
    std::cout << a[i] << std::endl;
    i++;
}
```

```C++
int a[10];
int i = 0;
do {
    std::cout << a[i] << std::endl;
    i++;
} while (i < 10)
```

## Ranged-based for loops

> A "fancy" for loop

```C++
std::string values[] = {"cat", "bear", "dog", "bird"};
for (auto e: values) // elements e in a list (by value)
    std::cout << e;
for (auto&& e: values) // elements e in a list (by reference)
    e = e + e;
```

```Java
String[] values = {"cat", "bear", "dog", "bird"};
for (String value: values) {
    System.out.println(value);
}
```

## Iterators

- Some languages allow users to define iterators
- Useful for abstracting the complexity of traversing complex data structures

```C++
std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
for (std::vector::iterator it = v.begin(); it != v.end(); ++it) {
    std::cout << *it;
}
```

```Java
LinkedList<String> l = new LinkedList<String>();
l.add("Apple");
for (Iterator it = l.iterator(); it.hasNext();) {
    System.out.println(it.next());
}
```

- Creating an iterator typically requires defining an iterator protocol

```Python
class Thing:
    def __iter__(self):
        ...

    def __next__(self):
        ...
```