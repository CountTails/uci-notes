# Lecture 21

## Inner product

If $\overrightarrow{u}$ and $\overrightarrow{v}$ are vectors in $\mathbb{R}^{n}$, then each vector can be viewed as $n \times 1$ matrices. Then, the matrix product $(\overrightarrow{u^{T}}) \overrightarrow{v}$ is a $1 \times 1$ matrix, also known as a "real number"

The number $(\overrightarrow{u^{T}})\overrightarrow{v}$ is called the **inner product** of $\overrightarrow{u}$ and $\overrightarrow{v}$, and is written as $\overrightarrow{u} \cdot \overrightarrow{v}$

The inner product is also referred to as the **dot product**

If 

$$
	\overrightarrow{u} = \begin{bmatrix}
		u_{1} \\ u_{2} \\ \vdots \\ u_{n}
	\end{bmatrix}
	\text{and}
	\overrightarrow{v} = \begin{bmatrix}
		v_{1} \\ v_{2} \\ \vdots \\ v_{n}
	\end{bmatrix}
$$

Then

$$
	\overrightarrow{u} 
	\cdot 
	\overrightarrow{v} = 
	u_{1}v_{1} +
	u_{2}v_{2} +
	\dots +
	u_{n}v_{n}
$$

### Example 1

Compute $\overrightarrow{u} \cdot \overrightarrow{v}$ and $\overrightarrow{v} \cdot \overrightarrow{u}$ for

$$
	\overrightarrow{u} = \begin{bmatrix}
		2 \\ -3 \\ 1
	\end{bmatrix}
	\text{ and }
	\overrightarrow{v} = \begin{bmatrix}
		4 \\ 2 \\ -1
	\end{bmatrix}
$$

$$
	\overrightarrow{u} 
	\cdot 
	\overrightarrow{v} = 
	2(4) + -3(2) + 1(-1) = 1
$$

$$
	\overrightarrow{v}
	\cdot
	\overrightarrow{u} =
	4(2) + 2(-3) + -1(1) = 1
$$

### Theorem 1

Let $\overrightarrow{u}$, $\overrightarrow{v}$, and $\overrightarrow{w}$ be vectors in $\mathbb{R}^{n}$, and lect $c$ be a scalar.

- $\overrightarrow{u} \cdot \overrightarrow{v} = \overrightarrow{v} \cdot \overrightarrow{u}$
- $(\overrightarrow{u} + \overrightarrow{v}) \cdot \overrightarrow{w} = \overrightarrow{u} \cdot \overrightarrow{w} + \overrightarrow{v} \cdot \overrightarrow{w}$
- $(c\overrightarrow{u}) \cdot \overrightarrow{v} = c (\overrightarrow{u} \cdot \overrightarrow{w}) = \overrightarrow{u} \cdot (c\overrightarrow{v})$
- $\overrightarrow{u} \cdot \overrightarrow{u} \ge 0$ and $\overrightarrow{u} \cdot \overrightarrow{u} = 0$ if and only if $\overrightarrow{u} = 0$

## Length

The **length** of $\overrightarrow{v}$ is a nonnegative scalar $|\overrightarrow{v}|$ defined by

$$
	|\overrightarrow{v}| = 
	\sqrt{\overrightarrow{v} \cdot \overrightarrow{v}} =
	\sqrt{v_{1}^{2} + v_{2}^{2} + \dots + v_{n}^{2}}
$$

where $|\overrightarrow{v}|^{2} = \overrightarrow{v} \cdot \overrightarrow{v}$

A vector with length $1$ is called an **unit vector**

If $\overrightarrow{v}$ is any vector, how do we define a unit vector in the direction of $\overrightarrow{v}$?

$$
	\overrightarrow{u} = \dfrac{1}{|\overrightarrow{v}|} * \overrightarrow{v}
$$

The process of creating $\overrightarrow{u}$ from $\overrightarrow{v}$ is called **normalizing**. The vectors $\overrightarrow{u}$ and $\overrightarrow{v}$ have the same direction

### Example 2

Let 

$$
	\overrightarrow{v} = \begin{bmatrix}
		4 \\ -4 \\ 2
	\end{bmatrix}
$$
and normalize the vector

$$
	|\overrightarrow{v}| = \sqrt{4^{2} + (-4)^{2} + 2^{2}} = \sqrt{36} = 6
$$

$$
	\overrightarrow{u} = \dfrac{1}{6} 
	\begin{bmatrix}
		4 \\ -4 \\ 2
	\end{bmatrix} = 
	\begin{bmatrix}
		2/3 \\ -2/3 \\ 1/3
	\end{bmatrix}
$$

## Distance 

For $\overrightarrow{u}$ and $\overrightarrow{v}$ in $\mathbb{R}^{n}$, the **distance between u and v**, written as $dist(\overrightarrow{u} \,, \overrightarrow{v})$ is the length of the vector $\overrightarrow{u} - \overrightarrow{v}$ 

### Example 3

Find the distance between each set of vectors

$$
	\overrightarrow{u} = \begin{bmatrix}
		2 \\ -4
	\end{bmatrix}
	\text{ and }
	\overrightarrow{v} = \begin{bmatrix}
		0 \\ 1
	\end{bmatrix}
$$

$$
	|\overrightarrow{u} - \overrightarrow{v}|
	= \left| \begin{bmatrix}
		2 \\ -5
	\end{bmatrix} \right|
	= \sqrt{4 + 25} = \sqrt{29}
$$

$$
	\overrightarrow{u} = \begin{bmatrix}
		-3 \\ 1 \\ 2
	\end{bmatrix}
	\text{ and }
	\overrightarrow{v} = \begin{bmatrix}
		-3 \\ 4 \\ 1
	\end{bmatrix}
$$

$$
	|\overrightarrow{u} - \overrightarrow{v}|
	= \left| \begin{bmatrix}
		0 \\ -3 \\ 1
	\end{bmatrix} \right|
	= \sqrt{0 + 9 + 1} = \sqrt{10}
$$

## Orthogonality

Two vectors $\overrightarrow{u}$ and $\overrightarrow{v}$ in $\mathbb{R}^{n}$ are **orthogonal** (to each other) if $\overrightarrow{u} \cdot \overrightarrow{v} = 0$

Orthogonality is the generalized notion of perpendicularity

The zero vector is orthogonal to every vector in $\mathbb{R}^{n}$

> Two vectors, $\overrightarrow{u}$ and $\overrightarrow{v}$ are orthogonal if and only if $|\overrightarrow{u} + \overrightarrow{v}|^{2} = |\overrightarrow{u}|^{2} + |\overrightarrow{v}|^{2}$

### Example 4

Determine whether each set of vectors is orthogonal

$$
	\overrightarrow{u} = \begin{bmatrix}
		-3 \\ 1
	\end{bmatrix}
	\text{ and }
	\overrightarrow{v} = \begin{bmatrix}
		2 \\ 3
	\end{bmatrix}
$$

$$
	\overrightarrow{u} \cdot \overrightarrow{v}
	= (-3)(2) + (1)(3) = -3 
$$
The set of vectors is not orthogonal

$$
	\overrightarrow{u} = \begin{bmatrix}
		4 \\ 3 \\ -1
	\end{bmatrix}
	\text{ and }
	\overrightarrow{v} = \begin{bmatrix}
		-2 \\ 1 \\ -5
	\end{bmatrix}
$$

$$
	\overrightarrow{u} \cdot \overrightarrow{v}
	= (4)(-2) + (3)(1) + (-1)(-5) = 0	
$$

The set of vectors is orthogonal

## Orthogonal complement

If a vector $\overrightarrow{z}$ is orthogonal to every vector in a subspace $W$ of $\mathbb{R}^{n}$, then $\overrightarrow{z}$ is said to be **orthogonal to** $W$

The set of all vectors $\overrightarrow{z}$ that are orthogonal to $W$ is called the **orthogonal complement** of $W$ and is denoted by $W^{\perp}$ 

The following are two facts about $W^{\perp}$

1) A vector $\overrightarrow{x}$ is in $W^{\perp}$ if and only if $\overrightarrow{x}$ is orthogonal to every vector in a set that spans $W$
2) $W^{\perp}$ is a subspace of $\mathbb{R}^{n}$

> Let $A$ be an $m \times n$ matrix. The orthogonal complement of the row space of $A$ is the null space of $A$, and the orthogonal complement of the column space of $A$ is the null space $A^{T}$

$$
	(Row \, A)^{\perp} = Nul \, A
$$

and

$$
	(Col \, A)^{\perp} = Nul \, A^{T}
$$

