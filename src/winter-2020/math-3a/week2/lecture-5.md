# Lecture 5

## Homogenous systems

A system of linear equation is **homogeneous** if is written in the form $A\overrightarrow{x} = \overrightarrow{0}$

The homogeneous system has a **nontrivial** solution if there is at least one free variable

To determine if a homogenous system has a nontrivial solution

1) Write the system in its augmented matrix form
2) Row reduce the the augmented matrix

### Example 1
$$
	\begin{bmatrix}
		1 & -3 7 & 0 \\
		-2 & 1 & -4 & 0 \\
		1 & 2 & 9 & 0
	\end{bmatrix} \to
	\begin{bmatrix}
		1 & -3 & 7 & 0 \\
		0 & -5 & 10 & 0 \\
		0 & 0 & 12 & 0
	\end{bmatrix}
$$

There is no free variables in the system, thus the homogenous system does not have a nontrivial solution

### Example 2

$$
	\begin{bmatrix}
		-3 & 5 & -7 & 0 \\
		-6 & 7 & 1 & 0
	\end{bmatrix} \to
	\begin{bmatrix}
		1 & 0 & -6 & 0 \\
		0 & 1 & -5 & 0
	\end{bmatrix}
$$

The system contains the free variable $x_{3}$, thus the homogenous system does have a nontrivial solution

## Parametric vector form

When a solution set is described as linear combination of vectors, it is in **parametric vector form**

The solution set of $A\overrightarrow{x} = \overrightarrow{b}$ can be written as $x = p + \overrightarrow{t}v$ with $t \in \mathbb{R}$ 

- Solutions to $A\overrightarrow{x} = \overrightarrow{0}$ are in the form $x = \overrightarrow{t}p$
- Solutions to $A\overrightarrow{x} = \overrightarrow{b}$ are obtained by adding the vector $\overrightarrow{p}$ to the solutions of $A\overrightarrow{x} = \overrightarrow{0}$

### Theorem 6

> Suppose the equation $A\overrightarrow{x} = \overrightarrow{b}$ is consistent for some given $\overrightarrow{b}$ and let **p** be the solution. Then the solution set of $A\overrightarrow{x} = \overrightarrow{b}$ is the set of all vectors of the form $w = p + v_{h}$ , where $v_{h}$ is any solution of the homogenous equation

### Example 3

$$
	\begin{bmatrix}
		-3 & 5 & -7 & 9 \\
		-6 & 7 & 1 & 27
	\end{bmatrix} \to 
	\begin{bmatrix}
		1 & 0 & -6 & -8 \\
		0 & 1 & -5 & -3
	\end{bmatrix}
$$

The solution set can be expressed as 

$$
	x = x_{3}\begin{bmatrix} 6 \\ 5 \\ 1 \end{bmatrix} + 
	\begin{bmatrix} -8 \\ -3 \\ 0 \end{bmatrix}
$$

## Writing a solution set in parametric vector form

1) Row reduce the augmented matrix to reduced echelon form
2) Express each basic variable in terms of any free variables appearing in the solution
3) Write a typical solution **x** as a vector whose entries depend on the free variables, if any
4) Decompose **x** into a linear combination of vectors (with numeric entries) using the free variable as parameters