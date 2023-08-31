# Cross Product

## Derivation and Proof

Q: Find $\overrightarrow{c}$ such that $\overrightarrow{c}$ is perpendicular to $\overrightarrow{a}$ and $\overrightarrow{c}$ is perpendicular to $\overrightarrow{b}$

Recall: If $\overrightarrow{a} \cdot \overrightarrow{b} = 0$ means that $\overrightarrow{a}$ is perpendicular to $\overrightarrow{b}$

Suppose:

- $\overrightarrow{c} = <c_{1}, c_{2}, c_{3}>$
- $\overrightarrow{c} \cdot \overrightarrow{a} = 0$
- $\overrightarrow{c} \cdot \overrightarrow{b} = 0$

Proof:

$$
		(1): (c_{1})(a_{1}) + (c_{2})(a_{2}) + (c_{3})(a_{3}) = 0 
$$
$$
		(2): (c_{1})(b_{1}) + (c_{2})(b_{2}) + (c_{3})(b_{3}) = 0 
$$
$$
		(2) * a_{3} = c_{1}b_{1}a_{3} + c_{2}b_{2}a_{3} + c_{3}b_{3}a_{3} = 0
$$
$$
		(a_{1}b_{3} - a_{3}b_{1})c_{1} + (a_{2}b_{3} - a_{3}b_{2})c_{2} = 0
$$
$$
		c_{1} = a_{2}b_{3} - a_{3}b_{2}
$$
$$
		c_{2} = a_{3}b_{1} - a_{1}b_{3}
$$

Plug $c_{1}$ and $c_{2}$ into $(1)$

$$
		a_{1}(a_{2}b_{3} - a_{3}b_{2}) + a_{2}(a_{3}b_{1} - a_{1}b_{3}) + a_{3}b_{3} = 0
$$
$$
		c_{3} = a_{1}b_{2} - a_{2}b_{1}
$$
$$
		\overrightarrow{a} \times \overrightarrow{b} = <a_{2}b_{3} - a_{3}b_{2}, a_{3}b_{1} - a_{1}b_{3}, a_{1}b_{2} - a_{2}b_{1}> = (a_{2}b_{3} - a_{3}b_{2})\overrightarrow{i} + (a_{3}b_{1} - a_{1}b_{3})\overrightarrow{j} + (a_{1}b_{2} - a_{2}b_{1})\overrightarrow{k}
$$

By notion of determinants

note: $det(\begin{bmatrix} a & b \\ c & d \end{bmatrix}) = ad - bc$

$$
		\overrightarrow{a} \times \overrightarrow{b} =
			\begin{bmatrix}
				a_{2} & a_{3} \\
				b_{2} & b_{3}
			\end{bmatrix} \overrightarrow{i}
			-
			\begin{bmatrix}
				a_{1} & a_{3} \\
				b_{1} & b_{3}
			\end{bmatrix} \overrightarrow{j}
			+
			\begin{bmatrix}
				a_{2} & a_{2} \\
				b_{2} & b_{2}
			\end{bmatrix} \overrightarrow{k}
$$

## Direction and Magnitude of Cross Product

### Direction

Determined by the [Right-Hand Rule](../week2/3d-coordinates.md###3D-Space)

### Magnitude

- $\vert \overrightarrow{a} \times \overrightarrow{b} \vert = (a_{2}b_{3} - a_{3}b_{2})^{2} + (a_{3}b_{1} - a_{1}b_{3})^{2} + (a_{1}b_{2} - a_{2}b_{1})^{2}$
- $\vert \overrightarrow{a} \times \overrightarrow{b} \vert = a_{2}^{2}b_{3}^{2} - 2a_{2}a_{3}b_{2}b_{3} + a_{3}^{2}b_{2}^{2} + a_{3}^{2}b_{1}^{2} - 2a_{1}a_{3}b_{1}b_{3} +a_{1}^{2}b_{2}^{2} - 2a_{1}a_{2}b_{1}b_{2} + a_{2}^{2}b_{1}^{2}$
- $\vert \overrightarrow{a} \times \overrightarrow{b} \vert = (a_{1}^{2} + a_{2}^{2} + a_{3}^{2})^{2}(b_{1}^{2} + b_{2}^{2} + b_{3}^{2})^{2} - (a_{1}b_{1} + a_{2}b_{2} + a_{3}b_{3})^{2}$
- $\vert \overrightarrow{a} \times \overrightarrow{b} \vert = \vert \overrightarrow{a} \vert^{2} \vert \overrightarrow{b} \vert^{2}(1 - cos^{2}(\theta)) = \vert \overrightarrow{a} \vert^{2} \vert \overrightarrow{b} \vert^{2} sin^{2}(\theta)$

## Cross Product Properties

- $\overrightarrow{a} \times \overrightarrow{b} = -\overrightarrow{b} \times \overrightarrow{a}$
- $\overrightarrow{a} \times (\overrightarrow{b} + \overrightarrow{c}) = \overrightarrow{a} \times \overrightarrow{b} + \overrightarrow{a} \times \overrightarrow{c}$
- $(\overrightarrow{a} + \overrightarrow{b}) \times \overrightarrow{c} = \overrightarrow{a} \times \overrightarrow{b} + \overrightarrow{b} \times \overrightarrow{c}$
- $(c\overrightarrow{a}) \times \overrightarrow{b} = c(\overrightarrow{a} \times \overrightarrow{b}) = \overrightarrow{a} \times (c\overrightarrow{b})$
- $(\overrightarrow{a} \times \overrightarrow{b}) \cdot \overrightarrow{c} = \overrightarrow{a} \cdot (\overrightarrow{b} \times \overrightarrow{c})$
- $\overrightarrow{a} \times (\overrightarrow{b} \times \overrightarrow{c}) = \overrightarrow{b}(\overrightarrow{a} \cdot \overrightarrow{c}) - \overrightarrow{c}(\overrightarrow{a} \cdot \overrightarrow{b})$
- $\overrightarrow{a} \times \overrightarrow{a} = 0$
- If $\overrightarrow{a}$ is parallel to $\overrightarrow{b}$ then $\overrightarrow{a} \times \overrightarrow{b} = 0$
- Volume of a parallelogram
	- $\vert \overrightarrow{a} \cdot (\overrightarrow{b} \times \overrightarrow{c}) \vert = \vert \overrightarrow{a} \vert \vert \overrightarrow{b} \times \overrightarrow{c} \vert \vert cos(\theta) \vert$
- Basis Vector Identities
	- $\overrightarrow{i}, \, \overrightarrow{j}, \, \overrightarrow{k}$ are [basis vectors](../week2/vectors.md#Arithmetic)
	- $\overrightarrow{i} \times \overrightarrow{j} = \overrightarrow{k}$
	- $\overrightarrow{k} \times \overrightarrow{i} = \overrightarrow{j}$
	- $\overrightarrow{j} \times \overrightarrow{k} = \overrightarrow{i}$
	- $\overrightarrow{j} \times \overrightarrow{i} = -\overrightarrow{k}$
	- $\overrightarrow{i} \times \overrightarrow{k} = -\overrightarrow{j}$
	- $\overrightarrow{k} \times \overrightarrow{j} = -\overrightarrow{i}$