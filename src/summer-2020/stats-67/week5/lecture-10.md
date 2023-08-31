# Lecture 10

## From probability to statistical inference

### Probability

- As a measure of uncertainty
- Random variables and distributions
- sampling as a way to study population

### Statistics

- Use a sample to learn about a population
- Observed samples are independent from population model
- Estimate parameters, check fit, and draw conclusions (if appropriate)

## Point estimation

- Need to sample a representative of the population
- Should involve randomness to avoid bias
- A simple random sample is the most basic approach, but other methods exists
- Estimand: the point(quantity) being estimated
    - Finite population summaries
    - Parameters in a mathematical model of a population

### Basics

- Suppose we are interested in the parameter $\theta$
- Assume we have sample of independent random variables, each with its own density function $f(x)$
    - $\hat{\theta}$ is a point estimator that estimates the true value of $\theta$
    - $f(x \vert \theta)$ is a description of the population

### Method of moments

- Recall $E(X^{j}) = \dfrac{1}{n} \sum \limits_{i} X_{i}^{j}$ is the $j$th moment
- We can equate a sample moment and population moment to identify an estimator
- Poisson case
    - recall $E(X_{i}) = \lambda$
    - first sample moment: $\overline{X} = \dfrac{1}{n} \sum \limits_{i} X_{i}$
    - first population moment: $\lambda$
    - estimator for parameter: $\hat{\lambda} = \overline{X}$
- Normal case
    - Recall $E(X_{i}) = \mu$ and $E(X_{i}^{2}) = \sigma^{2} + \mu^{2}$
    - To find moment estimators, solve
        - $\dfrac{1}{n} \sum \limits_{i = 1}^{n} X_{i} = \mu$
        - $\dfrac{1}{n} \sum \limits_{i = 1}^{n} X_{i}^{2} = \sigma^{2} + \mu^{2}$
    - Results
        - $\hat{\mu}_{mom} = \dfrac{1}{n} \sum \limits_{i = 1}^{n} X_{i} = \overline{X}$
        - $\hat{\sigma}_{mom}^{2} = \dfrac{1}{n} \sum \limits_{i = 1}^{n} (X_{i} - \overline{X})^{2}$
- Summary
    - Easy to use
    - Generally not the best estimators
    - Ambiguity about which moments to use

### Maximum likelihood estimation

- Density of a single observation is $f(x \vert \theta)$
- Joint density of the random sample is $f(X_{1},\ X_{2},\ \dots,\ X_{n} \vert \theta) = \prod_{i = 1}^{n} f(X_{i} \vert \theta)$
- Likelihood function: $L(\theta \vert x_{1},\ \dots,\ x_{n}) = f(x_{1},\ \dots,\ x_{n} \vert \theta)$
- Maximum likelihood estimator $\hat{\theta}_{mle}$ is the value of $\theta$ that maximizes the likelihood function
- To find MLE: 
    1) solve $\dfrac{dL}{d\theta} = 0$
    2) check that it is a maximum (can use 2nd derivative)
- Poissson case
    - Joint distribution: $f(X_{1},\ dots,\ X_{n} \vert \lambda) = \prod \limits_{i = 1}^{n} \dfrac{e^{-\lambda} \lambda^{X_{i}}}{X_{i}!}$
    - Likelihood function: $L = f(X_{1},\ \dots,\ X_{n} \vert \lambda) = e^{-n\lambda}\lambda^{\sum \limits_{i} X_{i}} / \left( \prod \limits_{i} X_{i}! \right)$
    - Then
        - $LogL = \sum \limits_{i} (X_{i}) \ln{\lambda} - n\lambda - \ln{\prod \limits_{i} X_{i}!}$
        - $dLogL/d\lambda = \sum \limits_{i} (X_{i} / \lambda) - n = 0$
    - This implies that $\hat{\lambda} = \overline{X}$ is the maximum likelihood estimator
- Normal case
    - $LogL = a - \dfrac{n}{2} \log{\sigma^{2}} - \dfrac{1}{2\sigma^{2}} \sum \limits_{i = 1}^{n} (X_{i} - \mu)^{2}$
    - Need to solve
        - $\dfrac{\partial LogL}{\partial \mu} = \dfrac{1}{\sigma^{2}} \sum \limits_{i = 1}^{n} (X_{i} - \mu) = 0$
        - $\dfrac{\partial LogL}{\partial \sigma^{2}} = -\dfrac{n}{2\sigma^{2}} + \dfrac{1}{2\sigma^{4}} \sum \limits_{i = 1}^{n} (X_{i} - \mu)^{2} = 0$
    - Results
        - $\hat{\mu}_{mle} = \dfrac{1}{n} \sum \limits_{i} X_{i} = \overline{X}$
        - $\hat{\sigma}^{2}_{mle} = \dfrac{1}{n} \sum \limits_{i} (X_{i} - X)^{2}$
- Summary
    - More complex than method of moments
    - Do well with lots of data

### Properties of point estimators

- Good estimators have
    - Lack of bias
    - Low variance
- Mean squared error
    - Asks how well an estimator estimates the real parameter
    - $MSE = E(T - \theta)^{2} + \operatorname{var}(T)$
- Large sample properites
    - Consistency: estimate correct value with large samples
    - Efficiency: Has smallest possible variance in large samples

## Interval estimation

- Create an interval where the true parameter value is likely to be
- True parameter value is still unknown
- Usually called the confidence interval (CI)
- Enables by the **Central Limit Theorem**

> Let $X_{1},\ \dots,\ X_{n}$ be a random sample of size $n$ from a distribution with $\mu$ and variance $\sigma^{2}$.
> Then for large $n$, $\overline{X} = \dfrac{1}{n} \sum \limits_{i} X_{i}$ is approximately normal with mean $\mu$ and variance $\dfrac{\sigma^{2}}{n}$
> This implies that $Z = \dfrac{\overline{X} - \mu}{\sigma / \sqrt{x}}$ is approximately normal

- General approach
    - Suppose we have a point estimator $\hat{\theta}$ for a parameter $\theta$
    - $\hat{\theta}$ is a random value with expected value aproxximately equal to $\theta$ with standard deviation $\operatorname{sd}(\hat{\theta})$
    - An approximate large-sample 95% confidence interval is $\hat{\theta} \pm 1.96 * \operatorname{sd}(\hat{\theta})$
- Interpretation
    - 95% of the confidence intervals contain the true value
    - A given instance either contains the true value or not
    - The guarantee is for the average behavior of repeated samples

## Tests / decisions

- An important component for statistical inference
- Sometimes a formal test is needed for the value of a particular parameter

### Significance tests
    
- assess evidence against $H_{0}$
- uses a $p$-value to measure how unusual observed data are
- $p$-values
    - probability of observing data as or more extreme than the data obtained if $H_{0}$ is true
    - Low values could mena
        1) $H_{0}$ is true and we saw an unusual event
        2) $H_{0}$ is not true
    - $p < 0.05$ is often used, but a strict cutoff is a BAD IDEA

### Hypothesis tests

- Establish a decision rule for deciding between $H_{0}$ and $H_{a}$
- Treats two hypothesis more evenly
- This procedure can give off two types of errors
    - Type I =  reject $H_{0}$ if it is true
    - Type II = accept $H_{0}$ if it is false
- A lower cutoff point may make Type II errors more frequent
- A higher cutoff point may make Type I errors more frequent

### General approach

- Obtain a suitable point estimate $\hat{\theta}$ and use it to test the hypothesis
- Calculate a $p$ value which is $P(\hat{\theta} > \text{observed value})$ assuming $H_{0}$ is true
    - This calculation requires a distribution of $\hat{\theta}$

## Simple linear regression

- Refers to a particular approach for studying relationships between two of more quantitative variables
- Useful for distinguishing between a function/mathematical model and a structural/statistical model

### Basic model

$$
    Y_{i} = \beta_{0} + \beta_{1}x_{i} + \epsilon_{i}
$$

- $Y_{i}$ is the response or dependent variable
- $x_{i}$ is the predictor or independent variable
    - $x_{i}$ is treated as a fixed quantity, not a random variable
- $\epsilon_{i}$ is the error term or individual variation
    - $\epsilon_{i}$ are independent $N(0, \ \sigma^{2})$  random variables
- Assumes a relation between $Y$ and $x$
- Errors are independent
- There are constant variance errors and normally distributed errors
- Mean of $Y$, given $x$ is $\beta_{0} + \beta_{1}x$

