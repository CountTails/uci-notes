# Euler's, Fermat's and CRT

## Fermat's little theorem

> For every prime number $p > 2$ and positive integer $n > 1$, not divisible by $p$, $n^{p - 1} \equiv 1 \mod p$

- This theorem allows us to compute huge powers of $n \mod p$ as long as $p$ is a small prime and doesn't divide $n$

> Compute $2^{2021} \mod 7$

- Compute $2021 \mod 6$ first, which is $5$
- Therefore, $2^{2021} \mod 7 \equiv 2^{5} \mod 7 \equiv 32 \mod 7 \equiv 4$
- $2021 = 6*336 + 5$
- $2^{2021} = (2^{6})^{336}*2^{5} \equiv 1^{336} * 2^{5} \mod 7$

## Euler's theorem

- We can expand the result by Fermat for prime powers first

> For any prime let's define a function $\varphi(p) = p - 1$.
> $\varphi(p)^{k} = p^{k} - p^{k - 1}$ - a number of integers $> 1$ mutually prime with a parameter of $\varphi(p)$.
> In general, for $n = \prod \limits_{j = 1}^{m} p_{j}^{k_{j}}$

$$
	\varphi(n) = \prod \limits_{j = 1}^{m} = p_{j}^{k_{j} - 1}(p_{j} - 1)
$$

- It turns out that for two mutually exclusive prime integers $m > 1$ and $n > 1$, we have a theorem similar to Fermat's little theorem
- $m^{\varphi(n)} \equiv 1 \mod n$
- We use a special case of this theorem for RSA

## Chinese remainder theorem

- Now let's figure out how to compute a value $N$ given it's values mod $p_{j}$ for many small values $p_{j}$
- Ideally, we would like to put together pieces that will give us each modulus one at a time
- Piece number $j$ we would like to be equal to $a_{j} = N \mod p_{j}$
- We would also like this piece to contribute $0$ for each of the other moduli
- Piece number one then will be

$$
	a_{1} \times \prod \limits_{j = 2}^{k} p_{j} \times smth
$$

- What would $smth$ be?
	- Product of all $p_{j} - s$ from $2$ to $k$ will spoil this piece $\mod p_{1}$
	- Repeating this process for all $j$ we get a general formula for computing $N$ that has given remainders for our set of primes
- When $N$ is a product of only two primes $N = pq$, and $N = a \mod p$ and $N = b \mod q$

$$
	N = a \times q \times (q^{-1} \mod p) + b \times p \times (p^{-1} \mod q)
$$

- While this version where we add up all pieces to get the value of $N$ will give us a value that works, it may not be the smallest
- We many want to reduce our $N$ by the product of all primes which participated in defining it
- Hence our ultimate formula for two primes will be

$$
	N = [a \times q \times (q^{-1} \mod p ) + b \times p \times (p^{-1} \mod q)] \mod pq
$$