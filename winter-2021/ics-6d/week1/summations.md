# Summations

## Expressions

### Sum

$$
    \sum \limits_{j = s}^{t} a_{j} = a_{s} + a_{s + 1} + \dots + a_{t}
$$

### Product

$$
    \prod \limits_{j = s}^{t} a_{j} = a_{s} * a_{s + 1} * \dots * a_{t}
$$

## Definition

- If a sequence has an explicit formula, the value of the sum can be computed

$$
    \sum \limits_{k = 2}^{4} = k^{2} + 1 = 30
$$

- If the upper limit is a variable, then the value of the sum is a function of that variable

$$
    \sum \limits_{i = 1}^{n} i = \dfrac{n(n + 1)}{2}
$$

## Linearity of summation

### Multiplication

- We can factor out constants from a sum

$$
    \sum \limits_{i = 1}^{50} 2i = 2 \sum \limits_{i = 1}^{50}i
$$

### Addition

- We can distribute a summation

$$
    \sum \limits_{j = 0}^{49} (2j + 1) = 
    \sum \limits_{j = 0}^{49} 2j + 
    \sum \limits_{j = 0}^{49} 1
$$

## Change in limits

### Constant

- We can pull out one or more terms from the summation to make it easier to work with

#### Beginning

$$
    \sum \limits_{i = -1}^{n} i = n + \sum \limits_{i = -1}^{n - 1} i
$$

#### End

$$
        \sum \limits_{i = -1}^{n} i = -1 + 0 + \sum \limits_{i = 1}^{n - 1} i
$$

### Variables

- Take $\prod \limits_{k = 5}^{1001} (k - 3)$
- If we define $j = k - 3$, then we can rewrite the product as $\prod \limits_{j = 2}^{998} j$

## Closed forms

- Express the value of the sum withou a summation

### Geometric sequences

- Given
    - Initial value $a$
    - Common ration $r$
    - Number of terms $n$

$$
    S = \dfrac{a(1 - r^{n + 1})}{1- r}
$$

### Arithmetic sequences

- Given
    - Initial value $a$
    - Common difference $d$
    - Number of terms $n + 1$

$$
    S = a(n + 1) + d\left(\dfrac{n(n + 1)}{2}\right)
$$