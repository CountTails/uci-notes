# Lecture 7

## Continuous random variables

### Definition

- Can be an uncountable, infinite possible values

### Example

- $X$ can be any number in the interval $\left[ 0,\ 1 \right]$

## Probability density function

### Definition

- $f(x)$ is now called the probability density function
- It does not represent $P(X = x)$ anymore
- $P(X = x) = 0$ for all $x$ in $\mathbb{S}_{x}$
- The probability that a continuous random variable is equal to a fixed number is $0$
- Thus, we can only get probabilities of intervals such as $P(a < x < b)$

### Formula

$$
    P(a < x < b) = \int \limits_{a}^{b} f(x) \ dx
$$

### Expectation

$$
    E(X) = \int \limits_{\mathbb{S}_{x}} x f(x) \ dx
$$

### Variance

$$
    \operatorname{var}(x) = \int \limits_{\mathbb{S}_{x}} (x - E(X))^{2} f(x) \ dx
$$

- Note that we can still use $\operatorname{var}(x) = E(X^{2}) - \left[ E(X) \right]^{2}$
- This may be easier to compute

## Cumulative density function

- The cumulative density function is written as

$$
    F(X) = P(X < x) = P(X \le x) = \int \limits_{I}^{x} f(u) \ du
$$

- $I$ is the lower bound of $\mathbb{S}_{x}$, which is typically $-\infty$
- The derivative of the cumulative density function is the probability density function
- Thus, we can also get probability intervals as $P(a < x < b) = F(b) - F(a)$

## Uniform distribution

### Definition

- Can take on any value in an interval $\left[a,\ b \right]$ with uniform density
- Similar to the discrete version, every value in $\mathbb{S}_{x}$ has equal probability
- 

### Probability density function

$$
    f(x) = \dfrac{1}{b - a}
$$

### Expectation and variance

- The expectation of $X$ is just the average of the two endpoints of the support

$$
    E(X) = \int \limits_{a}^{b} x\dfrac{1}{b - a} \ dx = \dfrac{b + a}{2}
$$

- Can find the variance with $\operatorname{var}(X) = E(X^{2}) - \left[ E(X) \right]^{2}$

$$
    E(X^{2}) = \int \limits_{a}^{b} x^{2} \dfrac{1}{b - a} \ dx = \dfrac{b^{3} - a^{3}}{3(b - a)}
$$

- Plugging in the known values

$$
    \operatorname{var}(X) = \dfrac{(b - a)^{2}}{12}
$$

### Cumulative density function

$$
    F(X) = P(X < x) = 
    \int \limits_{\tilde{x} < x} f(\tilde{x}) \ d\tilde{x} = 
    \int \limits_{a}^{x} \dfrac{1}{b - a} \ d\tilde{x} = 
    \dfrac{x - a}{b - a}
$$

## Exponential distribution

### Definition

- Models the time between events in a Poisson process
- Has a positive parameter $\theta$, which can be viewed as the expected time until the next event is observed
- $\mathbb{S}_{x} = \left[ 0,\ \infty \right]$
- This distribution has a *memoryless* property
    - It is similar to independence
    - States $P(X > x + t \vert X > x) = P(X > t)$

### Probability density function

$$
    f(x) = \dfrac{1}{\theta}e^{-x / \theta}
$$

### Expectation and variance

$$
    E(X) = \int \limits_{0}^{\infty} \dfrac{1}{\theta}xe^{-x / \theta} \ dx = \theta
$$

$$
    E(X^{2}) = \int \limits_{0}^{\infty} \dfrac{1}{\theta}x^{2}e^{-x / \theta} \ dx = 
    2\theta^{2} \implies \operatorname{var}(X) = \theta^{2}
$$

### Cumulative density function

$$
    F(x) = \int \limits_{0}^{x} \dfrac{1}{\theta}e^{-u / \theta} \ du
    = 1 - e^{-x / \theta}
$$

$$
    P(a < x < b) = e^{-a / \theta} - e^{-b / \theta}
$$

## Computation in R

- Uniform
    - $P(X \le x)$ can be computed with `punif(x, a, b)`
- Exponential
    - $P(X \le x)$ can be computed with `pexp(x, t)`
- Note that these function return density values, not probabilities