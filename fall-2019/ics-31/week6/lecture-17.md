# Lecture 17

## Scope

Variables declared *outside* the body of a function are **global** variables

Variables declared *inside* the body of a function are **local** variables

When reading a variable, python does the following

- Check if a local variable with the name exists
- If no such local variable, check if a parameter with the name exists
- If no such parameter, check if a global variable with the name exists
- If no such global variable, raise `NameError` exception