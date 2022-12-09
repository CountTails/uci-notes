# Lecture 4

## Discrete random variables

### Definition

- A *variable* is a quantity that can take on different values
- A *random variable* assumes different values with certain probabilities
    - A function that assigns real numbers to each outcome in the sample space
- A *discrete random variable* is a variable that can only take on integers
    - Has countably many outcomes
    - Are typically bounded and do **not** have an infinite range
- The support of $X$ is
    - Denoted as $\mathbb{S}_{X}$
    - Represents the value that $X$ can take on
    - The space of values for which $X$ has a positive probability of occurring

### Examples

- Say a coin is flipped 3 times
    - Let $X$ be a random variable equal to the number of heads in the flips
    - $X$ can take on the values $0,\ 1,\ 2,\ 3$
- Say a coin is flipped once
    - Let $X$ be a radnom variable equal to the number of heads
    - $\mathbb{S}_{X} = \{1,\ 2 \}$

### Continuous random variables

- If $\mathbb{S}_{X}$ is continuous then $X$ is continuous
    - $X$ can be any number in a given range
    - There are uncountably many possible values for $X$

## Distributions for discrete variables

### Illustration

- Consider the example where a coin is flipped 3 times and $X$ is the number of heads in the flips
- $X = 0$ means the flips were all tails
    - $(\{ TTT \})$
    - $P(X = 0) = (\dfrac{1}{2})^{3} = \dfrac{1}{8}$
- $X = 1$ means one of the following occurred
    - $(\{ HTT,\ THT,\ TTH \})$ 
    - $P(X = 1) = 3(\dfrac{1}{2})^{3} = \dfrac{3}{8}$
- $X = 2$ means one of the following occurred
    - $(\{ HHT,\ HTH,\ THH \})$
    - $P(X = 2) = 3(\dfrac{1}{2})^{3} = \dfrac{3}{8}$
- $X = 3$ means the flips were all heads
    - $(\{ HHH \})$
    - $P(X = 3) = (\dfrac{1}{2})^{3} = \dfrac{1}{8}$

### Definition

- The *probability distribution of $X$* assigns a number to all values $x$ in $\mathbb{S}_{x}$ such that
    - $0 \le P(X = x \le 1$
    - $\sum \limits_{x \in \mathbb{S}_{x}} P(X = x) = 1$
- Notationally, we state $f(x) = P(X = x)$ where $f$ is called the *probability mass function*
- The functions of random variable $X$ are also random variables
    - If $\mathbb{S}_{X} = \{ 0,\ 1,\ 2,\ 3 \}$
    - Then $\mathbb{S}_{X^{2}} = \{ 0,\ 1,\ 4,\ 9 \}$
- A *cumulative distribution function* at the value $X$ is $P(X \le x)$
    - It is the sum of all probabilities which have $X \le x$
    - $F(X) = P(X \le x) = \sum \limits_{\tilde{x} \le x} P(X = \tilde{x})$
    - By rule of complement, $P(X > a) = 1 - P(X \le a)$
- To compute probabilities of intervals
    - $a$ and $b$ are the bounds of the interval
    - $P(a \le X \le b) = P(X \le b) - P(X \le a - 1)$
    - $P(a < X \le b) = P(X \le b) - P(X \le a)$

### Examples

- Say a dice is rolled once and $X$ is equal to the number that shows
    - $F(3) = P(X \le 3) = P(X = 1) + P(X = 2) + P(X = 3) = \dfrac{1}{2}$
    - $P(1 < X < 5) = P(2 \le X \le 4) = P(X = 2) + P(X = 3) + P(X = 4) = \dfrac{1}{2}$

## Expectation for discrete variables

### Definition

- The *expectation of $X$* can be viewed as the mean or average of $X$
- Denoted as $E(X) = \sum \limits_{x \in \mathbb{S}_{X}} xP(X = x) = \sum \limits_{x \in \mathbb{S}_{X}} xf(x)$

### Example

- Recall the flipping 3 coins example
    - $E(X) = 0*\left(\dfrac{1}{2}\right)^{3} + 1*3\left(\dfrac{1}{2}\right)^{3} + 2*3\left(\dfrac{1}{2}\right)^{3} + 3\left(\dfrac{1}{2}\right)^{3} = 1.5$

### Extending with functions

- Recall that functions of $X$ are also random variables
    - $h(X) = X^{2}$
    - $h(X) = \dfrac{1}{X}$
- We can find $E(h(x))$ without having to find the distribution of $h(X)$
    - $E(h(X)) = \sum \limits_{x \in \mathbb{S}_{X}} h(x)P(X = x) = \sum \limits_{x \in \mathbb{S}_{X}} h(x)f(x)$

### Properties

- If $a$ and $b$ are constants and $X$ is a random variable, then $E(a + bX) = a + bE(X)$
- If $X$ and $Y$ are random variables, then $E(X + Y) = E(X) + E(Y)$
    - As a result, $E(aX + bY) = aE(X) + bE(Y)$
    - As a further result, $E\left( \sum \limits_{i} a_{i}X_{i} \right) = \sum \limits_{i} a_{i} E(X_{i})$
