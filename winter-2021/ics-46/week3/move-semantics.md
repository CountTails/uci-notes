# Move semantics

## "Well behaved" classes

- The statically allocated portion fits on the run-time stack
- Their objects clean up after themselves when hey die
- Their objects can be passed by value and preserve semantics (making a copy)
	- Disallow copying if it doesn't make sense
- Their objects can be assigned into other existing objects of the same type
	- Disallow if it doesn't make sense
- Their objects can be `const` and still be useful
- Their objects shouldn't do unnecessary work or use other resources unnecessarily

## Specialization of templates

- Instead of `typename T`, use `T` as a template argument
- Like passing arguments to call in function

## Copy elision

- Compiler removes unnecessary copies
- `std::vector<int> v = std::vector<int>{1, 2, 3, 4, 5};`
	- Construct temporary copy
	- Copy assign into `v`
	- Throw away the temporary copy
- The compiler will elide the copy

## A hypothetical move operator

- The left side of `=` should look the the right side
- It does not matter what the right side looks like

### L-values and R-values

- A l-value has storage allocated for it
- A r-value does not have storage allocated for it
- A l-value is a place to store something
- A r-value is a temporary value

### References (l-value references)

- Establish a synonym for an existing name
- Reading or writing to reference affects original
- Can only refer to a l-value

### R-values references

- Specify alternative names for r-values
- A type name followed by `&&`
- Cannot refer to a l-value
- Allow you to keep expiring values

### Move constructor

- `X(X&& x);`
- Argument is about to expire
- No need to preserve argument
- Basic move construction
	1) Make empty instance of class
	2) Swap contents
	3) Destroy the empty
- Asymptotically faster than copy constructor

### Move assignment

- `operator=(X&& x);`
- Argument is about to expire
- Basic move assignment
	1) swap contents
	2) return `*this`

### A smarter `swap`

- `std::move(x)` returns a r-value reference to `x`
- Move `a` into `temp`
- Move `b` into `a`
- Move `temp` into `b`