# Lecture 18

## Function arguments

### Immutable arguments

If the object is immutable, the argument is also immutable

Modification is limited to inside the function

Any 'modification' results in a new object being created.

The original object is left unchanged

### Mutable arguments

If the object is mutable, the argument is also mutable

Modification inside a function can be observed from outside of the function

Modification is done **in-place**. The object is changed on the fly and no new object is created

The origial object is changed

## Keyword arguments

Keyword arguments allow arguments to be passed in as a specific parameter

Order of keyword arguments does not matter, they will be assigned to the correct parameters

Keyword arguments must be specified **after** all positional arguments. It is an error to do otherwise

## Defualt parameter values

Default parameters allow parameters to have a default value

The default value will be used in case no value is passed for the parameter

Specifying a mutable value as a default parameter is not an error, but can be a cause for bugs. It is a good practice to use immutable values for default parameter values