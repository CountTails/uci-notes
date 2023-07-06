# Amortized analysis

## Vector

- Stored continuously in memory
- manages dynamically allocated arrays
- `push_back()`: add to end of list
	- Size tells where to place element
	- Constant time (most of the time)
- `push_back()`: when `size == capacity`
	- Allocate a new array
	- Size is multiplicative of old size
	- 10 cells -> 20 cells
	- Copy or move to new array
	- Reallocation new array in constant
	- Deallocation old array is constant
- Complexity of `push_back()`
	- $\theta(1)$ or $\theta(n)$
	- Definitively $O(n)$
	- Has a best case and worst case

## Amortized analysis

- "Amortization": spread large costs over time
- Amortized running time: $\frac{\text{time for a sequence of operations}}{\text{number of operations}}$

| Calls | Size | Capacity | Total writes | Avg. writes |
|:-----:|:----:|:--------:|:------------:|:-----------:|
| $0$ | $c$ | $c$ | $0$ | - |
| 1 | $c + 1$ | $2c$ | $c + 1$ | - |
| $c$ | $2c$ | $2c$ | $2c$ | $2c / c = 2$ |
| $c + 1$ | $2c + 1$ | $4c$ | $4c + 1$ | - |
| $3c$ | $4c$ | $4c$ | $6c$ | $6c / 3c = 2$ |

- The amortized running time of `push_back()` is $\theta(1)$
- Average writes is constant
- Benefits outweigh the costs
	- Useful for most software requirements
	- Sometimes not good enough for hard requirements