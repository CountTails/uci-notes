# RAII

## What is it?

```
Resource
Acquisition
Is
Initialization
```

## Why?

> If every kind of resource is managed by its own class this way
> and if we otherwise endeavor to use statically-allocated objects
> of these objects when we can, then a lot of what would be error-prone
> cleanup becomes automatic

## Smart pointers

- Uniquely owns what it points to
- When pointer dies, objects pointed to is automatically deallocated
- Assigning delete to member functions prevents defaults from existing