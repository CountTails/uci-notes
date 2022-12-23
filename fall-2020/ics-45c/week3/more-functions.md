# More on functions

## Functions

- Accepts parameters in definition
- Pass in arguments when called
- Argument match to parameters in the order specified
    - First argument -> first parameter
    - ...
    - Last argument -> last parameter
- Argument types must be compatible with parameter types

## Parameters

- By default, all parameters as pass-by-value
- Value is copied into parameter
- Seen on the activation record
- Values deleted when function ends
- r-values are legal to pass
    - constants
    - expressions
- Can assume whatever is passed is returned unchanged

## References

- Gives an alternate name for a value
    - `{type}& {altName} = {name}`
- The name must have been initialized when the refernce is defined
- Can only refer to one thing for its entire lifetime
- Reference are **NOT** variables
- Can only refer to an l-value

### References as parameters

- Alternative parameter passing: pass-by-reference
- Can still pass variables, but not r-values
- Allows functions to modify their parameters
- Avoids the cost of copying by passing their location in memory
- Gives up the security of caller returning unchanged parameters

## Compatibility

- Compatible when types match
- Implicit type conversion
    - `int` -> `double`
    - `double` -> `int` (Throws away the factional part, resulting in data loss)
    - `int` -> `long`
- Undefinde behavior
    - An unpredictable failure
    - Or you get lucky and nothing goes wrong

## Overloading functions

- More than one function with the same name can exist
- Differentiated by parameter counts and their types
- Overload resolution rules
    - Exact matches are first and better than any alternative
    - Matches involving types that conserve data when conversion takes place
    - Matches involving standard information

## Default arguments

- If an argument is not given, the function uses the default value
- Parameters with default values must appear at the end of the parameter list