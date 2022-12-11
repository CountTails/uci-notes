# Lecture 8

## Discrete examples

### Example 1

- Say $f(x) = cx^{2}$ and $\mathbb{S}_{x} = \{ 1,\ 2,\ 3,\ 4,\ 5 \}$
- Find $c$ so that $f$ is a valid probability mass function
    - $c$ must be positive so that $f(x) > 0$ for all $x$ in the support
    - $\sum \limits_{x \in \mathbb{S}_{x}} f(x) = 1$

$$
    \sum \limits_{x \in \mathbb{S}_{x}} cx^{2} 
    = x(1^{2} + 2^{2} + 3^{2} + 4^{2} + 5^{2}) = 55c
$$

- Solve for $c$

$$
    55c = 1 \implies c = \dfrac{1}{55}
$$

### Example 2

- Say $f(x) = \dfrac{1}{55}x^{2}$ and $\mathbb{S}_{x} = \{ 1,\ 2,\ 3,\ 4,\ 5 \}$
- Find $P(X = 3)$, $E(X)$, and $E(X^{2})$

$$
    P(X = 3) = \dfrac{1}{55}(3)^{2} = \dfrac{9}{55}
$$

$$
    E(X) = \sum \limits_{x \in \mathbb{S}_{x}} \dfrac{1}{55}x^{3}
    = \dfrac{1}{55}(1 + 8 + 27 + 64 + 125)
    = 4.09
$$

$$
    E(X^{2}) = \sum \limits_{x \in \mathbb{S}_{x}} \dfrac{1}{55}x^{4}
    = \dfrac{1}{55} (1 + 16 + 81 + 256 + 625) = 17.8
$$

## Continuous examples

### Example 3

- Say $f(x) = cx^{2}$ and $\mathbb{S}_{x} = \left[1,\ 5 \right]$
- Find $c$ so that $f$ is a valid probability density function
    - $c$ must be positive so that $f(x) > 0$ for all $x$ in the support
    - $\int \limits_{\mathbb{S}_{x}} f(x) dx = 1$

$$
    \int \limits_{1}^{5} cx^{2} \ dx = c\dfrac{x^{3}}{3} \vert_{x = 1}^{x = 5}
    = c(\dfrac{125}{3} - \dfrac{1}{3}) = \dfrac{124}{3}
$$

- Solve for $c$

$$
    \dfrac{124}{3}c = 1 \implies c = \dfrac{3}{124}
$$

### Example 4

- Say $f(x) = \dfrac{3}{324}x^{2}$ and $\mathbb{S}_{x} = \left[1,\ 5 \right]$
- Find $E(X)$, and $E(X^{2})$

$$
    E(X) = \int \limits_{1}^{5} \dfrac{3}{124}x^{3} \ dx
    = \dfrac{3}{124} \dfrac{x^{4}}{4} \vert_{x = 1}^{x = 5}
    =\dfrac{3}{124} (\dfrac{625}{4} - \dfrac{1}{4}) = \dfrac{3}{124} \dfrac{624}{4}
$$

$$
    E(X^{2}) = \int \limits_{1}^{5} \dfrac{3}{124} x^{4} \ dx
    = \dfrac{3}{124} \dfrac{x^{5}}{5} \vert_{x = 1}^{x = 5}
    = \dfrac{3}{124} \dfrac{3124}{5}
$$
