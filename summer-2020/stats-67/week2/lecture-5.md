# Lecture 5

## Variance for discrete variables

### Definition

- *Variance* is the average squared deviation from the mean or average
- Denoted as $\operatorname{var}(X) = E[(X - E(X))^{2}] = E[X -\mu)^{2}]$
    - $E(X) = \mu$
    - $\operatorname{var}(X) = \sigma^{2}$
- $\sigma = \sqrt{\operatorname{var}(X)}$ is known as the *standard deviation* of $X$

### Factoring for easy computation

$$
    \operatorname{var}(X) = E[(X - E(X))^{2}]
$$

$$
    = E[(X - \mu)^{2}]
$$

$$
    = E(X^{2}) - \mu^{2}
$$

$$
    = E(X^{2}) - [E(X)]^{2}
$$

- The last is typically the easiest to compute
- "second moment minus square of the first moment"
    - In general $E(X^{k})$ is noted as the $k$th moment of $X$

### Example

- Say $\mathbb{S}_{X} = \{ -1,\ 1 \}$ where $P(X = 1) = 0.5$ and $P(X = -1) = 0.5$
    - $E(X) = 0$ and $E(X^{2}) = 1$
    - $\operatorname{var}(X) = 1 - 0^{2} = 1$

### Properties

- If $c$ is constant
    - $\operatorname{var}(c) = 0$
    - $\operatorname{var}(cX) = c^{2}\operatorname{var}(X)$
- If $X$ and $Y$ are indepedent random variables
    - $\operatorname{var}(X + Y) = \operatorname{var}(X) + \operatorname{var}(Y)$
    - As a result, $\operatorname{var} \left( \sum \limits_{i} c_{i}X_{i} \right) = \sum \limits_{i} c_{i}^{2} \operatorname{var}(X_{i})$
- if $h$ is a function of $X$
    - $\operatorname{var}(h(X)) \ne h(\operatorname{var}(X))$

## Common distributions

- Enable us to functions instead of just using tables

### Bernoulli distribution

- Set $X = \{ 0,\ 1 \}$ with $P(X = 1) = p$ and $P(X = 0) = 1 - p$
- $f(x) = P(X = x) = p^{x}(1 - p)^{1 - x}$
    - $E(X) = p$
    - $\operatorname{var}(X) = p(1 - p)$
- Can define a probability mass function as
    - $f(x) = P(X = x) = {n \choose x} \left( \dfrac{1}{2} \right)^{n}$
    - 

### Example

- Say a coin is flipped 100 times
- Each value of $x$ is computed by selecting $x$ objects from a total of $n = 100$
- Take $x = 20$ (that would be 20 heads and 80 tails)
    - Each event is $\left( \dfrac{1}{2} \right)^{100}$
    - The total number of ways of having 20 heads show up is $\dfrac{100!}{20!80!}$
    - $P(X = 20) = \dfrac{100!}{20!80!} \left( \dfrac{1}{2} \right)^{100}$

### Binomial distribution

- $X$ follows a binomial distribution with paramenters $p$ and $n$
    - $X$ is the numer of sucesses
    - $n$ is the number of trials
    - $p$ is the probability of success, whereas $1 - p$ is the probability of failure
- The probability mass function is 
    - $f(x) = P(X = x) = {n \choose x} p^{x}(1 - p)^{n - x}$
        - $E(X) = \sum \limits_{x = 1}^{n} p = np$
        - $\operatorname{var}(X) = \sum \limits_{x = 1}^{n} p(1 - p) = np(1 - p)$