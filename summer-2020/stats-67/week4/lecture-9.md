# Lecture 9

## Normal distribution

### Definition

- A continuous random variable distribution with support $( -\infty,\ \infty)$
- The probability distribution function is determined by
    - its mean $\mu$ (determines the center of the curve)
    - its standard deviation $\sigma$ (determines how narrow the peak is)

$$
    f(x) = \dfrac{1}{\sqrt{2\pi \sigma^{2}}}e^{-\dfrac{(x - \mu)^{2}}{2\sigma^{2}}}
$$

### Properties

- $E(X) = \int \limits_{-\infty}^{\infty} xf(x) \ dx = \mu$
- $\operatorname{var}(x) = \int \limits_{-\infty}^{\infty} (x - \mu)^{2} f(x) \ dx = \sigma^{2}$
- There is no closed form solution for $F(x)$
    - It's integral form is $\int \limits_{-\infty}^{x} f(u) \ du$
- The density function is symmetric about $\mu$
    - That is $P(X > \mu + a) = P(X < \mu - a$

## Percentiles and quartiles

- Can be applied to any distribution, but particularly useful with the normal distribution
    - The p-th percentile is the value of $x$ such that $P(X \le x) = p$
    - The probability of being less than $x$ is $p$
    - We set the value of $p$ and solve for $x$
    - $p$ is the area below the value of $x$ using a normal distribution 
- Examples
    - 25th percentile: $P(X \le x) = F(x) = 0.25$
    - 50th percentile (also called the median): $P(X \le x) = F(x) = 0.5$
    - 75th percentile: $P(X \le x) = F(x) = 0.75$

## Standard normal distribution

- A normal distribution with the following properties
    - $\mu = 0$
    - $\sigma = 1$
- Given a normal random variable, transforming it to the standard normal distribution says
    - how many standard deviations it is from the true population mean/expectation
    - $Z = \dfrac{X - \mu}{\sigma}$
- Empirical rule
    - 68% of the probabilities are within 1 standard deviation of the mean
    - 95% of the probabilities are within 2 standard deviations of the mean
    - 99.7% of the probabilites are within 3 standard deviations of the mean

## Data and observation

### Histograms

- Univariate data can be visualized with a histogram
    - Consists of rectangles whose area is proportional to frequency
    - Widths of the rectange are set by the user
- Gives an idea of how the data is distributed
- 

### Skewness

- Asymmetry in a distribution
- Right skewed: Histogram leans more to the left (tail trails off to the right)
- Left skewed: Histogram leans more to the right (tail trails off to the left)
- 

### Population vs sample

- Goal: obtain inference on the true population parameters
- Sampling all elements of a population may be infeasible
- Sample the population and use that to estimate true parameters
- Quantities calculated from sample parameters are called *statistics*

## Central limit theorem

- States that $\overline{Z} = \dfrac{\overline{X} - \mu}{\sigma / \sqrt{n}}$ converges to a standard normal distribution as $n \to \infty$
- Implies that $\overline{X}$ has approximately a normal distribution
    - With mean $\mu$
    - and with variance $\dfrac{\sigma^{2}}{n}$
- Note that $\overline{X}$ itself is random
- Each sample has its own mean, and each time you take a sample, you compute its mean and variance