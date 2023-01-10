# Sequences

## Definition

- A special case of a function where the domain is a consecutive set of integers
- A finite sequence has a finite domain; an infiinite sequence has an infinite domain

## Specifying sequences

- List the values

$$
    h_{0} = 2 ,\, h_{1} = 3 ,\, h_{2} = 5 ,\, h_{3} = 7 ,\, h_{4} = 11 ,\, h_{5} = 13
$$

- Give an explicit formula

$$
    f_{n} = 2^{n} + 2n
$$

## Increasing and decreasing

- **Strictly increasing**: Successive terms are *greater* than the previous terms
- **Strictly decreasing**: Successive terms are *less* than the previous terms
- **Non-increasing**: Successive terms are *less than or equal to* previous terms
- **Non-decreasing**: Successive terms are *greater than or equal to* previous terms

## Common sequences

### Geometric sequences

- $g_{0} = a$, where $a$ is some initial value
- $g_{n} = r * g_{n - 1}$, where $r$ is a **common ratio**
- $g_{n}$ is increasing when
    - $ar > a$
    - $a > 0$ 
    - $r > 1$
- $g_{n}$ is decreasing when
    - $ar < a$
    - $a > 0$
    - $0 < r < 1$

### Arithmetic sequences

- $h_{0} = a$, where $a$ is some initial value
- $h_{n} = d + h_{n - 1}$, where $d$ is a **common difference**
- Can be stated with the explict formula: $h_{n} = a + n * d$
- $h_{n}$ is increasing when
    - $d > 0$
- $h_{n}$ is decreasing when
    - $d < 0$
- $h_{n}$ is non-increasing *and* non-decreasing when
    - $d = 0$

### Recurrence relations

- State the recurrence relation with
    - **base case**: one or more initial values
    - **recursive rule**: rule for determining the next term of the sequence in terms of earlier appearing terms
- Need enough bases cases to specify the recurrence relation
- Useful in
    - Dynamic systems (population growth / market growth or interest accumulation)
    - Determining number of operations used in a recursive algorithm on a given input size

$$
    f_{n} = \begin{cases} 
            f_{0} = 1 \\
            f_{1} = 1 \\
            f_{n} = f_{n - 1} + f_{n - 2}
             \end{cases}
$$
