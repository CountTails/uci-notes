# Const correctness

## "Constness"

- Coding your intention to stop change
- `const int x = 3;`
    - "`x` is an integer constant"
    - Compiler will disallow changes
- Can be read, but not written to
- Copying a constant into another variable removes the `const` protections
- If the possibility of change is present, report an error
    - Copying const variable into const variable is OK
    - Copying const variable into variable is OK
    - Copying variable into const variable is OK

## Const with references

- Cannot refer a const variable reference
- Cannot point a pointer to an address of a constant variable
- Can refer a const variable to a const reference

### Pass by reference

- Essentially const references
- Ensures passy-by-references parameters won't change values
- Avoids the cost to copying and preserves value semantics

### Pointers

- Address
- Value at an address
- Can be changed at any time
- Not const by default
- `const int *q` -> `q` is not constant, but `*q` is constant (west const)
- `int const* r` -> `r` is not constant, but `*r` is constant (east const)
- `int* const s` -> `s` is constant, but `*s` is not constant
- `const int* const t` -> `t` is constant and `*t` is constant

