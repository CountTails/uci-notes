# Generating functions

## An old fact

- Given $n$ distinguishable items, the number of possible combinations of $k$ of them where the order does not matter, can be obtain by using the function $1 + x$ to represent item
- Multiplying these functions, the coefficient of $x^{k}$ gives us the number of ways to choose $k$ items if the order of items doesn't matter
- Can we generalize this approach to the case where some items are obtainable in quantity $> 1$
- Yes, we can use generating functions other than $1 + x$

$$
	1 + x = \frac{1 - x^{2}}{1 - x}
$$

### Blue markers

#### 2 blue markers

$$
	1 + x + x^{2} = \frac{1 - x^{3}}{1 - x}
$$

#### k blue markers

$$
	1 + x + x^{2} + \dots + x^{k} = \frac{1 - x^{k + 1}}{1 - x}
$$

#### Unlimited supply

$$
	1 + x + x^{2} + \dots = \frac{1}{1 - x}
$$

### Blue and green markers

#### 2 blue & 3 green

$$
	B(x) = 1 + x + x^{2}
$$

$$
		G(x) = 1 + x + x^{2} + x^{3}
$$

$$
		B(x) \times G(x) = (1 + x + x^{2})(1 + x + x^{2} + x^{3})
$$

#### Unlimited for both

$$
	\left( \frac{1}{1 - x} \right) \left( \frac{1}{1 - x} \right) = \frac{1}{(1 - x)^{2}}
$$

$$
	= 1 + 2x + 3x^{2} + 4x^{3} + \dots = \sum \limits_{k = 0}^{\infty} (k + 1)x^{k} = \frac{1}{(1 - x)^{2}}
$$

## Upper and lower bounds

- If we must use at least 2 green markers, we start with $x^{2}$, so a formula for at least $2$ and at most $6$ green markers will be

$$
	x^{2} + x^{3} + x^{4} + x^{5} + x^{6}
$$

- This allows us to easily solve problems for multisets with upper and lower bounds for each type of the item by writing a polynomial for each type and multiplying them together
- The coefficient of $x^{k}$ in the product of these polynomials will give us a number of ways to choose $k$ items out of the given ones with specified limitations

### Socks sold in pairs

- 1 pair available: $1 + x^{2} = \frac{1 - x^{4}}{1 - x^{2}}$
- $k$ pairs available: $1 + x^{2} + x^{4} + \dots + x^{2k} = \frac{(1 - x)^{2(k + 1)}}{1 - x^{2}}$
- Unlimited supply: $1 + x^{2} + x^{4} + \dots = \frac{1}{1 - x^{2}}$

### Bundles (generalized)

- $k$ items in a bundle: $1 + x^{k} = \frac{1 - x^{2k}}{1 - x^{k}}$
- $n$ bundles: $1 + x^{k} + x^{2k} + \dots + x^{nk} = \frac{1 - y^{n + 1}}{1 0 y^{n}} = \frac{1 - x^{k(n + 1)}}{1 - (x^{k})^{n}}$
- Unlimited supply: $\frac{1}{1 - y} = \frac{1}{1 - x^{k}}$

### Socks and candy

$$
	S(x) = 1 + x^{2} + x^{4} + \dots = \frac{1}{1 - x^{2}}
$$

$$
	C(x) = 1 + x
$$

$$
	S(x) \times C(x) = \frac{1 + x}{1 - x^{2}} = \frac{1}{1 - x} = \sum \limits_{k = 0}^{\infty} x^{k}
$$

