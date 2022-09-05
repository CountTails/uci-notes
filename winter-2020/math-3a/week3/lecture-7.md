# Lecture 7

## Linear independence

Consider the following vector equation

$$
	x_{1}\begin{bmatrix} 1 \\ -2 \\ 1 \end{bmatrix} +
	x_{2}\begin{bmatrix} -3 \\ 1 \\ 2 \end{bmatrix} +
	x_{3}\begin{bmatrix} 7 \\ -4 \\ 9 \end{bmatrix} =
	\begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix}
$$

The only solution to this equation is the trivial solution

An indexed set of vectors $\{ v_{1}, ... , v_{p} \}$ in $\mathbb{R}^{n}$ is said to be **linearly independent** if the equation $x_{1}v_{1} + ... + x_{p}v_{p} = 0$ has only the trivial solution

The set $\{ v_{1}, ... v_{p} \}$ is said to be **linearly independent** if there exists weights $c_{1}, ..., c_{p}$, not all zero, such that $c_{1}v_{1} + ... + c_{p}v_{p} = 0$

This equation is called **linear dependence relation** among $v_{1}, ..., v_{p}$

If there exists a nontrivial solution, the vectors are linearly independent

To find a dependence relation, just find one nontrivial solution

## Linear independence of matrix columns

The columns of a matrix are linearly independent if and only if the equation $Ax = 0$ has only the trivial solution

## Sets of one vector

A set of one vector is linearly independent if and only if the vector is not the zero vector

For any real number $c \ne 0$, $c\overrightarrow{v} = 0$ if and only if $\overrightarrow{v} = 0$

## Sets of two vectors

A set of two vector is linearly independent if and only if one vector cannot be rewritten as a constant multiple of the other

$v_{1} = cv_{2}$ for some $c$ in the real numbers

## Sets of more than two vectors

If $\{ \overrightarrow{u}, \overrightarrow{v}, \overrightarrow{w} \}$ is linearly dependent, then some vector in the set must be a linear combination of the preceding vectors. Since $\overrightarrow{u}$ and $\overrightarrow{v}$ are linearly independent, it must be that $\overrightarrow{w}$ is a linear combination of $\overrightarrow{u}$ and $\overrightarrow{v}$. Hence, $\overrightarrow{w}$ is in Span$\{ \overrightarrow{u}, \overrightarrow{v} \}$

## Characterization of linearly dependent sets

An indexed set $S = \{ v_{1}, ..., v_{p} \}$ of two or more vectors is linearly dependent if and only if at least one of the vectors in $S$ is a linear combination of the others. 

If fact, if $S$ is linearly dependent and $v_{1} \ne 0$, then some $v_{j}$ with $j > 1$ is a linear combination of the preceding vectors $v_{1}, ..., v_{j - 1}$ 

## Theorem 8

If a set contains more vectors than there are entries in each vector, then the set is linearly dependent. That is, any set $\{ v_{1}, ..., v_{p} \}$ in $\mathbb{R}^{n}$ is linearly dependent if $p > n$

In other words, if there are more vectors in a set than the number of entries in each set, the set in linearly dependent

## Theorem 9

If a set $S = \{ v_{1}, ..., v_{p} \}$ in $\mathbb{R}^{n}$ contains the zero vector, then the set is linearly dependent.