# Analyzing recursion

## Executing a recursive function

```C++
int factorial(int n) {
	if (n == 0) {
		return 1;
	}
	else {
		return n * factorial(n - 1);
	}
}
```

```
factorial(5) = 5 * factorial(4) = 120
						|
						+ - > 4 * factorial(3) = 24
										|
										+ - > 3 * factorial(2) = 6
														|			
														+ - > 2 * factorial(1) = 2
																	|
																	+ - > 1 * factorial(0) = 1	

```

- Looks like it runs in constant time
- `if n == 0`, return $1$ and done
- `if n != 0` return `n * factorial(n - 1)`

## Recurrences

- Let $T$ be the time to calculate factorial
- $T(0) = a$ 
- $T(n) = b + T(n - 1)$
- $a$ and $b$ are constant

## Recurrence form to closed form

- This is the repeated substitution method

$$
	T(n) = b + T(n - 1)
$$

$$
	T(n) = b + (b + T(n - 2)) = 2b + T(n - 2)
$$

$$
	T(n) = 2b + b + T(n - 3) = 3b + T(n - 3)
$$

$$
	T(n) = jb + T(n - j) \text{ for all } j \ge 1
$$

- If we let $j = n$

$$
	T(n) = nb + T(0) = nb + a
$$

- $a$ and $b$ are constants
- $n$ is a variable
- The result has the form $y = mx + b$, therefore $T(n)$ is $\theta(n)$