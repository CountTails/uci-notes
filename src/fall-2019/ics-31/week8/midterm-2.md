# Midterm 2

Covers contents from weeks 1 thru 3

## Objects

- Type: str, int, float, etc
- Value: data stored in object
- ID: # referring to memory address

## Mutability

- Immutable: updating value creates new object
- Mutable: updating value updates object 

## Modules

- `import modulename`  
- dot notation: `modulename.function`
- Any `.py` file can act as a module

## Indexing

- First position is 0
- Last position is -1 or len(str) - 1
- Refer to index with [a]

## String formatting

- conversion operator: %
- specifiers
	- s -> string
	- d -> int
	- f -> float
	- e -> sci note

## Alignment & Precision

- min field width
	- (%#s); # is spaces before
- precision
	- (%a.bf)
	- a is min length
	- b is digits after decimal point
    
## Lists

- `My_list = [1, 2, 3, ... ]`
- Mutable
- Allow for multiple date types
- Access with indexing
- Modify
	- `list[a] = x`
- Add
	- `list.append('x')`
- Remove
	- `list.pop(a)`
	- `list.remove('x')`
    
## Sets

- `my_set = {1, 2, 3, ... }`
- Mutable
- Elements are unique
- Allow for multiple date types
- Add
	- `set.add('x')`
- Remove
	- `set.pop()` (random)
	- `set.remove('x')` (specific)
    
## Dictionaries(parallel lists)

- dict = {key : value}
- Keys are immutable & must be unique
- Values can be im/mutable and don't have to be unique
- Access 
	- `dict[k]`: obtains value in dict associated with key 'k'
	- If 'k' DNE, error
    
## Tuples

- `my_tuple = (1, 2, 3,...)`
- Immutable
- Access with indexing
- Allow for multiple date types

## NamedTuples

- import from collections
- `var = namedtuple('var', 'a b c d e f g')`
- Access with dot note or indexing
- Immutable
- Allow for multiple date types

## Functions and scope

-   visibility precedence
	-   local, global
-   All functions return a value(default: 'none'')
-   change mutable in func is reflected in global

## For loops

-   Iterate a known number of times    
-   Value vs Index
	-   Value if not changing
	-   Index if modifying

## While loops

-   Iterate while condition is True    
-   Unknown number of time
-   Initialize LCV
-   Check LCV
-   Update LCV

## Asserts

-   `assert(condition), error`
-   stop code when tripped
-   `try:`
	-   assert to be tripped
-   `except:`
	-   assert handled, continue code
    



**