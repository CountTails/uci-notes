# Lecture 3

## Vectors in $\mathbb{R}^{2}$

### Definitions

A matrix with only one column is called a **column vector**, or simply a **vector**

$$
	\overrightarrow{u} = \begin{bmatrix} 
		-3 \\ 1
	\end{bmatrix}
	\, 
	\overrightarrow{v} = \begin{bmatrix} 
		0.1 \\ -0.4
	\end{bmatrix}
	\,
	\overrightarrow{w} = \begin{bmatrix} 
		w_{1} \\ w_{2}
	\end{bmatrix}
$$

The set of all vectors with two entries is denoted by $\mathbb{R}^{2}$

Two vectors are **equal** if and only if their corresponding entries are equal

$$
	\begin{bmatrix} 
	2 \\ 3
	\end{bmatrix}
	\ne
	\begin{bmatrix}
	3 \\ 2
	\end{bmatrix}
$$

Given two vectors $\overrightarrow{u}$ and $\overrightarrow{v}$, their sum $\overrightarrow{u} + \overrightarrow{v}$ can be found by adding their corresponding entries

$$
	\begin{bmatrix} 
	-1 \\ 3
	\end{bmatrix}
	+
	\begin{bmatrix}
	2 \\ 1
	\end{bmatrix}
	=
	\begin{bmatrix}
	-1 + 2 \\ 3 + 1
	\end{bmatrix}
	=
	\begin{bmatrix}
	1 \\ 4
	\end{bmatrix}
$$

Given a vector $\overrightarrow{u}$ and a real number $c$, the **scalar multiple** of $\overrightarrow{u}$ by $c$ is the vector $c\overrightarrow{u}$ by multiplying each entry in $\overrightarrow{u}$ by $c$

$$
3 \begin{bmatrix} 2 \\ -1 \end{bmatrix}
=
\begin{bmatrix} 3 * 2 \\ 3 *(-1) \end{bmatrix}
=
\begin{bmatrix} 6 \\ -3 \end{bmatrix}
$$

Note: Sometimes a vector is written horizontally using angled brackets to distinguish it from a row matrix

## Vectors in $\mathbb{R}^{n}$

If $n$ is a positive integer, $\mathbb{R}^{n}$ denotes the set of ordered n-tuples of $n$ real numbers, usually written as $n \times 1$ column matrices

$$
	\overrightarrow{u} = \begin{bmatrix}
	u_{1} \\ u_{2} \\ ... \\ u_{n}
	\end{bmatrix}
$$

The vector whose entries are all zero is called the **zero vector** and is denoted as $\overrightarrow{0}$

## Algebraic properties of $\mathbb{R}^{n}$

For all $\overrightarrow{u} \,, \overrightarrow{v} \,, \overrightarrow{w}$ in $\mathbb{R}^{n}$ and all scalars $c$ and $d$:

- $\overrightarrow{u} + \overrightarrow{v} = \overrightarrow{v} + \overrightarrow{u}$
- $(\overrightarrow{u} + \overrightarrow{v}) + \overrightarrow{w} = \overrightarrow{u} + (\overrightarrow{v} + \overrightarrow{w})$
- $\overrightarrow{u} + 0 = \overrightarrow{u}$
- $\overrightarrow{u} + (-\overrightarrow{u}) = 0$
- $c(\overrightarrow{u} + \overrightarrow{v}) = c\overrightarrow{u} + c\overrightarrow{v}$
- $(c + d)\overrightarrow{u} = c\overrightarrow{u} + d\overrightarrow{u}$
- $c(d\overrightarrow{u}) = (cd)\overrightarrow{u}$
- $1\overrightarrow{u} = \overrightarrow{u}$

## Linear combinations

Given vectors $\overrightarrow{v_{1}} \,, \overrightarrow{v_{2}} \,, ... , \overrightarrow{v_{p}}$ in $\mathbb{R}^{n}$ and scalars $c_{1} \,, c_{2} \,, ... ,c_{p}$ the vector $\overrightarrow{y}$ is defined by

$$
	y = c_{1}\overrightarrow{v_{1}} + c_{2}\overrightarrow{v_{2}} + ... + c_{p}\overrightarrow{v_{p}}
$$
is called a **linear combination** of $\overrightarrow{v_{1}} \,, \overrightarrow{v_{2}} \,, \overrightarrow{v_{p}}$ with **weights** $c_{1} \,, c_{2} \,, ... ,c_{p}$

Determining if a vector $\overrightarrow{b}$ can be written as a linear combinations of $\overrightarrow{a_{1}} \,, \overrightarrow{a_{2}} \,, \overrightarrow{a_{3}}$ is identical so solving the linear system whose augmented matrix is $[\overrightarrow{a_{1}} \, \overrightarrow{a_{2}} \, \overrightarrow{a_{3}} \, \overrightarrow{b}]$

## Span

If $\overrightarrow{v_{1}} \,, ... ,\overrightarrow{v_{p}}$ are in $\mathbb{R}^{n}$, then the set of linear combinations of $\overrightarrow{v_{1}} \,, ... , \overrightarrow{v_{p}}$ is denoted by $Span\{\overrightarrow{v_{1}} \,, ... , \overrightarrow{v_{p}}\}$ and is called the **subset of $\mathbb{R}^{n}$ spanned by $\overrightarrow{v_{1}}\,, ... \, \overrightarrow{v_{p}}$** 

Span is the collection of all vectors that can be written in the form $c_{1}\overrightarrow{v_{1}} + c_{2}\overrightarrow{2} + ... + c_{p}\overrightarrow{v_{p}}$ with $c_{1} \,, ... , c_{p}$ scalars

If $v_{1} = \begin{bmatrix} 7 \\ 1 \\ -6 \end{bmatrix}$ and $v_{2} = \begin{bmatrix} -5 \\ 3 \\ 0 \end{bmatrix}$, list 3 vectors in $Span\{ \overrightarrow{v_{1}} \,, \overrightarrow{v_{2}} \}$

Each choice of $c_{1}\,, c_{2}$ gives a new vector

- Let $c_{1} = 0 \,, c_{2} = 0 \to \overrightarrow{0}$
- Let $c_{1} = 1 \,, c_{2} = 0 \to \overrightarrow{v_{1}}$
- Let $c_{1} = 0 \,, c_{2} = 1 \to \overrightarrow{v_{2}}$
