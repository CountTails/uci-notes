# Mathematical induction

## Principle of math induction

- Induction is a technique for proving facts/theorems that are parametrized by an infinite sequence of integers

> Let $P(n)$ be a statement parametrized by natural numbers. If the following are true
    1) $P(c)$ is true for some constant $c$
    2) For $k \ge c$, $P(k) \implies P(k + 1)$
  Then $P(n)$ is true for any $n \ge c$

## Inductive proofs

### Summation

> Theorem: For every integer $n \ge 1$,
> 

$$
\sum \limits_{j = 1}^{n} n = \dfrac{n(n + 1)}{2}
$$

#### Base case

$$
    n =1 \implies \sum \limits_{j = 1}^{1} j = 1 = \dfrac{1 * 2}{2} = 1    
$$

#### Inductive step

- Assume

$$
    \sum \limits_{j = 1}^{k} j = \dfrac{k(k + 1)}{2}
$$

- Then

$$
    \sum \limits_{j = 1}^{k + 1} j = \dfrac{(k + 1)(k + 2)}{2}
$$

$$
    (k + 1) + \sum \limits_{j = 1}^{k} j = \dfrac{(k + 1)(k + 2)}{2}
$$

- Substitute

$$
    (k + 1) + \dfrac{k(k + 1)}{2} = \dfrac{(k + 1)(k + 2)}{2}
$$

- Using some algebra, the statement is true.

### Inequality

> Theorem: For any $n \ge 3$, $n^{2} - 7n + 12 \ge 0$

#### Idea

- If $A \ge B$, then
    - $C > 0 \implies AC \ge BC$
    - $C < 0 \implies AC \le BC$
    - $A + D \ge B + D$

#### Base case

$$
    n = 3 \implies (3)^{2} - 7(3) + 12 = 9 - 21 + 12 = 0
$$

#### Inductive step

- Assume

$$
    \forall_{k \ge 3} \implies k^{2} - 7k + 12 \ge 0
$$

- Then

$$
    (k + 1)^{2} -7(k + 1) + 12 \ge 0
$$

$$
    (k^{2} - 7k +12) + 2k - 6 \ge 0
$$

$$
    2k - 6 \ge 0 \implies k \ge 3
$$

- Since the sum of two non-negative numbers is always non-negative, the statement is true

### Division

> Theorem:  For every integer $n \ge 1$, 12 evenly divides $5^{2n} - 1$

#### Idea

- $y$ *evenly divides* $y$ if $y = mx$ for some integer $m$

#### Base case

$$
    n = 1 \implies 5^{2(1)} - 1 = 24
$$

#### Inductive step

- Assume

$$
    \dfrac{5^{2k} - 1}{12} = m
$$

- Then

$$
    5^{2(k + 1)} - 1 \implies 5^{2k}*5^{2} - 1
$$



$$
    5^{2k} * (2 * 12 + 1) - 1 \implies (12j + 1)(2 * 12 + 1) - 1
$$

$$
    12m(2 * 12 + 1) - 1 \implies 12(m + 2) = 12i    
$$

- Since the value can be expressed as a multiple of 12, the statement is true

### Closed form of a recursive function

> Let $h_{n}$ be the sequence defined as followed
>     - $h_{0} = -2$
>     - $h_{n} = 5h_{n - 1} + 8n$
> For $n \ge 0$, $h_{n} = \dfrac{1}{2}*5^{n} - 2n - \dfrac{5}{2}$

#### Base case

$$
    n = 0 \implies h_{0} = \dfrac{1}{2}5^{0} - 2(0) - \dfrac{5}{2}
    = \dfrac{1}{2} - \dfrac{5}{2} = -\dfrac{4}{2} = -2
$$

#### Inductive step

- Assume

$$
    h_{k} = \dfrac{1}{2} * 5^{k} - 2k - \dfrac{5}{2}
$$

- Then 

$$
    h_{k + 1} = 5h_{k} + 8(k + 1)
$$

$$
    h_{k + 1} = 5 \left[ \dfrac{1}{2} * 5^{k} - 2k - \dfrac{5}{2} \right] + 8(k + 1)
$$

- Expanding and simplify yields

$$
    h_{k + 1} = \dfrac{1}{2} * 5^{k + 1} - 2(k + 1) - \dfrac{5}{2}
$$

- Since the closed form can yield $h_{k + 1}$, the statement is true



