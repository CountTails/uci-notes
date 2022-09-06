# Lecture 8

## Transformations

The difference between the matrix equation $A\overrightarrow{x} = \overrightarrow{b}$ and the vector equation $x_{1}a_{1} + ... + x_{n}a_{n} = \overrightarrow{b}$ is a matter of notation

We can think of $A$ "acting" on $\overrightarrow{x}$ to get $\overrightarrow{b}$. That is we want to consider the function $\overrightarrow{x} \to A\overrightarrow{b}$

A **transformation**, or **function**, or **mapping**, $T$ from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ is a rule that assigns to each vector $\overrightarrow{x}$ in $\mathbb{R}^{n}$ to a vector $T(\overrightarrow{x})$ in $\mathbb{R}^{m}$ 

The set $\mathbb{R}^{n}$ is the **domain** of $T$ and the set $\mathbb{R}^{m}$ is the **codomain** of $T$

The vector $T(\overrightarrow{x})$ is called the image of $\overrightarrow{x}$. The set of all images is called the **range** of $T$

## Matrix transformations

Matrix tranformations is denoted as $x \to Ax$, where $A$ is a $n \times m$ matrix

The domain of a matrix transformation is $\mathbb{R}^{n}$ (number of columns of $A$)

The codomain of a matrix transformation is $\mathbb{R}^{m}$ (number of rows in $A$)

The range of a matrix transformation is the set of all linear combinations of the columns of $A$

### Example 1

Let 

$$
	A = \begin{bmatrix}
		1 & 0 & -2 \\
		-2 & 1 & 6 \\
		3 & -2 & 10
	\end{bmatrix} \,

	u = \begin{bmatrix}
		-3 \\ 2 \\ -3
	\end{bmatrix} \,

	b = \begin{bmatrix}
		-4 \\ 12 \\ -20
	\end{bmatrix} \,

	c = \begin{bmatrix}
		-1 \\ 7 \\ -3
	\end{bmatrix}
$$

and define the transformation $T: \mathbb{R}^{3} \to \mathbb{R}^{3}$

> (a) Find $T(u)$, the image of $u$ under the transformation $T$

$$
	T(u) = Au = \begin{bmatrix}
		1 & 0 & -2 \\
		-2 & 1 & 6 \\
		3 & -2 & -10
	\end{bmatrix}
	\begin{bmatrix} -3 \\ 2 \\ -3 \end{bmatrix}
$$

$$
	=
	\begin{bmatrix}
		-3 + 0 + 6 \\
		6 + 2 - 18 \\
		-9 - 4 + 30
	\end{bmatrix} 
	=
	\begin{bmatrix}
		3 \\ -10 \\ 17
	\end{bmatrix}
 $$

> (b) Find an $x$ in $\mathbb{R}^{3}$ whose image is under $T$ is $b$

$$
	\begin{bmatrix}
		1 & 0 & -2 & -4 \\
		-2 & 1 & 6 & 12 \\
		3 & -2 & -10 & -20
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & -2 & -4 \\
		0 & 1 & 2 & 4 \\
		0 & 0 & 0 & 0
	\end{bmatrix}
$$

$$
	\begin{cases}
		x_{1} = 2x_{3} - 4 \\
		x_{2} = -2x_{3} + 4 \\
		x_{3} \text{ is free}
	\end{cases}
$$

Choosing $x_{3} = 1$, we get $x = \begin{bmatrix} -2 \\ 2 \\ 1 \end{bmatrix}$

> (c) Determine if $c$ is in the range of the transformation $T$

$$
	\begin{bmatrix}
		1 & 0 & -2 & -1 \\
		-2 & 1 & 6 & 7 \\
		3 & -2 & -10 & -3
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & -2 & 0 \\
		0 & 1 & 2 & 0 \\
		0 & 0 & 0 & 1
	\end{bmatrix}
$$

The final column in the echelon form is a pivot column, so this system is inconsistent, and so $c$ is not in the range of $T$

### Example 2

Let 

$$
	A = \begin{bmatrix}
		1 & 3 \\
		0 & 1
	\end{bmatrix}
$$

$T(x) = Ax$ is called a **shear transformation**. $T$ acts on each point in the $2 \times 2$ square by shifting it horizontally

## Linear transformations

A transformation is **linear** if 

- $T(u + v) = T(u) + T(v)$ for all $u$, $v$ in the domain of $T$
- $T(cu) = cT(u)$ for all scalars $c$ and all $u$ in the domain of $T$

Every matrix transformation is a linear transformation

The definition of a linear transformation gives the following facts

- $T(0) = 0$
- $T(cu + dv) = cT(u) + dT(v)$

for all vectors $u$, $v$ in the domain of $T$ and all scalars $c$ and $d$.

If a transformation satisfies the second fact, it must be linear

### Example 3

Define a transformation $T: \mathbb{R}^{2} \to \mathbb{R}^{2}$

$$
	T(u) = Au = 
	\begin{bmatrix}
		0 & 1 \\
		1 & 0
	\end{bmatrix}
	\begin{bmatrix}
		x_{1} \\ x_{2}
	\end{bmatrix}
	=
	\begin{bmatrix}
		x_{2} \\ x_{1}
	\end{bmatrix}
$$

> (a) Show that $T$ is a linear transformation

Let $u = \begin{bmatrix} u_{1} \\ u_{2} \end{bmatrix}$ and $v =\begin{bmatrix} v_{1} \\ v_{2} \end{bmatrix}$ be in $\mathbb{R}^{2}$ and let $c$ and $d$ be scalars

$$
	T(cu + dv) = 
	T(c\begin{bmatrix} 
		u_{1} \\ u_{2} 
		\end{bmatrix} 
	+ d\begin{bmatrix} 
	v_{1} \\ v_{2} 
	\end{bmatrix}) = 
	T(\begin{bmatrix}
		cu_{1} + dv_{1} \\ cu_{2} + dv_{2}
	\end{bmatrix})
$$

$$
	= \begin{bmatrix}
		cu_{1} + dv_{1} \\ cu_{2} + dv_{2}
	\end{bmatrix}
	=
	\begin{bmatrix} 
		cu_{1} \\ cu_{2} 
	\end{bmatrix}
	+
	\begin{bmatrix}
		dv_{1} \\ dv_{2}
	\end{bmatrix} 
	=
	c\begin{bmatrix}
		u_{1} \\ u_{2}
	\end{bmatrix}
	+ d\begin{bmatrix}
		v_{1} \\ v_{2}
	\end{bmatrix}
$$

> (b) Find the images of $u = \begin{bmatrix} 2 \\ 4 \end{bmatrix}$ and $v = \begin{bmatrix} -1 \\ 2 \end{bmatrix}$ under the transformation $T$

$T(u) = T(\begin{bmatrix} 2 \\ 4 \end{bmatrix}) = \begin{bmatrix} 4 \\ 2 \end{bmatrix}$

$T(v) = T(\begin{bmatrix} -1 \\ 2 \end{bmatrix}) = \begin{bmatrix} 2 \\ -1 \end{bmatrix}$

> (c) Describe geometrically what $T$ does to each vector in $\mathbb{R}^{2}$

$T$ reflects any vector about the line $y = x$