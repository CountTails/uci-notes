# Lecture 6

## Unbounded discrete random variables

### Definition

- Has countably many possible outcomes
- Could be infinite, but still countable

### Examples

- The **number of cars** crossing a bridge in a given time period
- The **number of white blood cells** created in a patient while sick
- The **number of attempts** needed before a success is seen

## Geometric distribution

### Definition

- Probability distribution of the number $X$ of Bernoulli trials needed to get one success
- The Bernoulli trials are independent, with probability $p$ of sucess (of a $1$)

### Probability mass function

- $P(X = 1) = p$, you get a success of the *first try*
- $P(X = 2) = (1 - p)p$, you **fail on the first try** and get a success on the *second try*
- $P(X = 3) = (1 - p)^{2}p$, you **fail on the first two tries**, and get a success on the *third try*
- Thus, $P(X = x) = (1 - p)^{x - 1}p$
    - We have $x - 1$ fails
    - The $x$th trial is a success

### Review of some key feature of the geometric series

- Assuming $\vert r \vert < 1$
    - $g(r) = \sum \limits_{k = 0}^{\infty} ar^{k} = a(1 - r)^{-1} = \dfrac{a}{1 - r}$
    - $\dfrac{d}{dr}g(r) = \sum \limits_{k = 1}^{\infty} akr^{k - 1} = a(1 - r)^{-2} = \dfrac{a}{(1 - r)^{2}}$
    - $\dfrac{d^{2}}{dr^{2}} g(r) = \sum \limits_{k = 2}^{\infty} ak(k-1)r^{k - 2} = 2a(1 - r)^{-3} = \dfrac{2a}{(1 - r)^{3}}$

### Cumulative distribution function

- $P(X > x) = P(X \ge x + 1)$
    - $= \sum \limits_{k + 1}^{\infty}(1 - p)^{k - 1}p$
    - $= p(1 - p)^{x} \sum \limits_{k = 0}^{\infty} (1 - p)^{k}$
    - $= p(1 - p)^{x} \dfrac{1}{1 - (1 - p)} = (1 - p)^{x}$
- Therefore, $F(X) = P( \le x) = 1 - (1 - p)^{x}$
- This is the probability of having to do at most $X$ trials before a single success

### Expectation

- $E(X) = \sum \limits_{x = 0}^{\infty} x(1 - p)^{x - 1}p$
    - $= p \sum \limits_{x = 0}^{\infty} x(1 - p)^{x - 1}$
    - $= p\dfrac{1}{p^{2}} = \dfrac{1}{p}$

### Variance

- Can add and subtract a term of $E(X)$ to simplify
- $E(X(X - 1)) = \sum \limits_{x = 2}^{\infty} x(x - 1)(1 - p)^{x - 1}p = \dfrac{2(1 - p)}{p^{2}}$
- $\operatorname{var}(X) = \dfrac{2(1 - p)}{p^{2}} + \dfrac{1}{p} - \dfrac{1}{p^{2}} = \dfrac{1 - p}{p^{2}}$

## Poisson distribution

### Definition

- Can view the time interval being divided into smaller, evenly spaced intervals
- It is the number of events seen across these many time intervals
- Time subintervals are assumed to be independent
- The probability of success in each time interval is constant
    - Divide the interval into $n$ subintervals
    - The probability of an event in given subinterval is $\dfrac{\lambda}{n}$
    - This probability approaches $0$ as the number of intervals grows

### Probability mass function

- Take the binomial distribution and let $p = \dfrac{\lambda}{n}$
- $f(X) = \dfrac{n!}{x!(n - x)!} \left(\dfrac{\lambda}{n} \right)^{n} \left( 1 - \dfrac{\lambda}{n} \right)^{n - x}$
- Now take $n \to \infty$
    - $\left( 1 - \dfrac{\lambda}{n} \right)^{n - x} \to e^{-\lambda}$
    - $\dfrac{n!}{(n - x)!} \dfrac{1}{n^{x}} \to 1$
    - $f(x) = P(X = x) = \dfrac{e^{-\lambda} \lambda^{x}}{x!}$

### Expectation

- $E(X) = \sum \limits_{x = 0}^{\infty} x \dfrac{e^{-\lambda} \lambda^{x}}{x!}$
    - $= e^{-\lambda} \lambda \sum \limits_{x = 0}^{\infty} x \dfrac{\lambda^{x - 1}}{x!}$
    - $= e^{-\lambda} \lambda \sum \limits_{x = 1}^{\infty} \dfrac{\lambda^{x - 1}}{(x - 1)!}$
    - $= e^{-\lambda} e^{\lambda} \lambda = \lambda$

### Variance

- With some algebra, it can be seen that
    - $\operatorname{var}(X) = \lambda$

### Cumulative distribution function

$$
    F(X) = P(X \le x) = \sum \limits_{\tilde{x} \le x} f({\tilde{x}}) = \sum \limits_{\tilde{x} = 0}^{x} \dfrac{e^{-\lambda} \lambda^{\tilde{x}}}{\tilde{x}!}
$$

## Computation in R

- Need to input the desired $x$ value and all needed parameters
- Binomial distribution
    - pmf of the binomial is `dbinom(x, n, p)`
    - cdf of the binomial is `pbinom(x, n, p)`
- Geometric
    - NOTE: in R, use the value $x - 1$
    - pmf of the geometric is `dgeom(x, p)`
    - cdf of the geometric is `pgeom(x, p)`
- Poisson
    - pmf of the poisson is `dpois(x, lambda)`
    - cdf of the poisson is `ppois(x, lambda`