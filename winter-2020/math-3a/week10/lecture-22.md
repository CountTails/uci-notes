# Lecture 22

## Orthogonal sets

A set of vectors $\{\overrightarrow{u_{1}} \,, \dots \,, \overrightarrow{u_{p}}\}$ in $\mathbb{R}^{n}$ is said to be an **orthogonal set** if each pair of distinct vectors from the set is orthogonal, that is, $\overrightarrow{u_{i}} \cdot \overrightarrow{u_{j}} = 0$ whenever $i \ne j$

### Example 1

Show that $\{ \overrightarrow{u_{1}} \,, \overrightarrow{u_{2}} \,, \overrightarrow{u_{3}} \}$ is an orthogonal set

$$
	\overrightarrow{u_{1}} = \begin{bmatrix}
		1 \\ 0 \\ -1
	\end{bmatrix}
	\,,
	\overrightarrow{u_{1}} = \begin{bmatrix}
		1 \\ \sqrt{2} \\ 1
	\end{bmatrix}
	\,,
	\overrightarrow{u_{3}} = \begin{bmatrix}
		1 \\ -\sqrt{2} \\ 1
	\end{bmatrix}
$$

Calculate the dot product for each pair of vectors

- $\overrightarrow{u_{1}} \cdot \overrightarrow{u_{2}} = (1)(1) + (0)(\sqrt{2}) + (-1)(1) = 0$
- $\overrightarrow{u_{1}} \cdot \overrightarrow{u_{3}} = (1)(1) + (0)(-\sqrt{2}) + (-1)(1) = 0$
- $\overrightarrow{u_{2}} \cdot \overrightarrow{u_{3}} = (1)(1) + (\sqrt{2})(-\sqrt{2}) + (1)(1) = 0$

Each pair of distinct vectors is orthogonal, so $\{\overrightarrow{u_{1}} \,, \overrightarrow{u_{2}} \,, \overrightarrow{u_{3}} \}$ is an orthogonal set

> If $S = \{ \overrightarrow{u_{1}} \,, \dots \,, \overrightarrow{u_{p}} \}$ is an orthogonal set of nonzero vectors in $\mathbb{R}^{n}$, then $S$ is linearly independent and hence is a basis for the subspace spanned by $S$

## Orthogonal basis

An **orthogonal basis** for a subspace $W$ of $\mathbb{R}^{n}$ is a basis for $W$ that is also an orthogonal set

> Let $\{ \overrightarrow{u_{1}} \,, \dots \,, \overrightarrow{u_{p}} \}$ be an orthogonal basis for a subspace $W$ of $\mathbb{R}^{n}$. For each $\overrightarrow{y}$ in $W$, the weights in the linear combination $y = c_{1}\overrightarrow{u_{1}} + \dots + c_{p}\overrightarrow{u_{p}}$ are given by $c_{j} = \dfrac{\overrightarrow{y} \cdot \overrightarrow{u_{j}}}{\overrightarrow{u_{j}} \cdot \overrightarrow{u_{j}}}$ for $j$ in $1 \,, \dots \,, p$ 

### Example 2

The set $S = \{ \overrightarrow{u_{1}} \,, \overrightarrow{u_{2}} \,, \overrightarrow{u_{3}} \}$ where

$$
	\overrightarrow{u_{1}} = \begin{bmatrix}
		1 \\ 0 \\ -1
	\end{bmatrix}
	\,,
	\overrightarrow{u_{2}} = \begin{bmatrix}
		1 \\ \sqrt{2} \\ 1
	\end{bmatrix}
	\,,
	\overrightarrow{u_{3}} = \begin{bmatrix}
		1 \\ -\sqrt{2} \\ 1
	\end{bmatrix}
$$

is an orthogonal basis for $\mathbb{R}^{3}$. Express the vector $\overrightarrow{y} = \begin{bmatrix} 2 \\ 0 \\ -1 \end{bmatrix}$ as a linear combination of the vectors in $S$

- $\overrightarrow{y} \cdot \overrightarrow{u_{1}} = 3$
- $\overrightarrow{y} \cdot \overrightarrow{u_{2}} = 1$
- $\overrightarrow{y} \cdot \overrightarrow{u_{3}} = 1$
- $\overrightarrow{u_{1}} \cdot \overrightarrow{u_{1}} = \sqrt{2}$
- $\overrightarrow{u_{2}} \cdot \overrightarrow{u_{2}} = 2$
- $\overrightarrow{u_{3}} \cdot \overrightarrow{u_{3}} = 2$

By the theorem above, 

$$
	\overrightarrow{y} 
	= \dfrac{3}{2}\overrightarrow{u_{1}}
	+ \dfrac{1}{4}\overrightarrow{u_{2}}
	+ \dfrac{1}{4}\overrightarrow{u_{3}}
$$

## Orthogonal projection

Reacall the parallelogram rule for adding vectors $\overrightarrow{u}$ and $\overrightarrow{v}$

Let $\overrightarrow{z} = \overrightarrow{u} - c\overrightarrow{u}$, where $c$ is a scalar. Our goal is to find $c$ such that $\overrightarrow{z}$ is orthogonal to $\overrightarrow{u}$

Find $c$ by solving $\overrightarrow{z} \cdot \overrightarrow{u} = 0$

When $c = \dfrac{\overrightarrow{y} \cdot \overrightarrow{u}}{\overrightarrow{u} \cdot \overrightarrow{u}}$, $\overrightarrow{z}$ and $\overrightarrow{u}$ will be orthogonal

The vector $\dfrac{\overrightarrow{y} \cdot \overrightarrow{u}}{\overrightarrow{u} \cdot \overrightarrow{u}} \overrightarrow{u}$ is called the **orthogonal projection of y onto u**, and the vector $\overrightarrow{z}$ is called the **component of y orthogonal to u**

The orthogonal projection of $\overrightarrow{y}$ onto $\overrightarrow{u}$ is exactly the same for any multiple of $\overrightarrow{u}$ 

