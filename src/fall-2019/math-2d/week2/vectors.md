# Vectors

## Definition

Vectors have:

- a magnitute
- a direction

Two vectors are considered equal if they have:

- same magnitude
- same direction

Vectors can be used to represent many things including:

- displacement
- velocity
- acceleration

The zero vector($\, \overrightarrow{0} \,$) has no unique direction.

## Notation

Magnitude is denoted by

- $\vert \, \overrightarrow{v} \, \vert$
- $\vert \vert \, \overrightarrow{v} \, \vert \vert$

2 dimensional vectors

- $v_{1}$ and $v_{2}$ are components of $\overrightarrow{v}$
- $\overrightarrow{v} = <v_{1}, v_{2}>$
- For any point $P(a, b)$, the vector $\overrightarrow{OP}$ is the position vector of $P$

3 dimensional vectors

- $v_{1}$, $v_{2}$, and $v_{3}$ are components of $\overrightarrow{v}$
- $\overrightarrow{v} = <v_{1}, v_{2}, v_{3}>$
- For any point $P(a, b, c)$, the vector $\overrightarrow{OP}$ is the position vector of $P$

## Arithmetic 

### Adding Vectors

Let $\overrightarrow{v}$ and $\overrightarrow{w}$ be vectors

- $\overrightarrow{v} = <v_{1}, v_{2}>$
- $\overrightarrow{w} = <w_{1}, w_{2}>$
- $\overrightarrow{v} + \overrightarrow{w} = <v_{1} + w_{1}, v_{2} + w_{2}>$

### Subtracting Vectors

Let $\overrightarrow{v}$ and $\overrightarrow{w}$ be vectors

- $\overrightarrow{v} = <v_{1}, v_{2}>$
- $\overrightarrow{w} = <w_{1}, w_{2}>$
- $\overrightarrow{w} - \overrightarrow{v} = \overrightarrow{w} + (-\overrightarrow{v})$

### Scalar Multiplication

Let $c$ be a real number nd $\overrightarrow{b}$ be a vector.

Then $c * \overrightarrow{b}$ is also a vector

- magnitude = $\vert c \vert * \vert \vert \overrightarrow{b} \vert \vert$
- direction
	- if $c > 0$, then same as $\overrightarrow{b}$
	- if $c < 0$, then opposite of $\overrightarrow{b}$
	- if $c = 0$ or $\overrightarrow{b} = 0$, then $c * \overrightarrow{b}$ is the zero vector.

### Magnitude

Let $\overrightarrow{v} = <a, b>$ be a vector.

Then, $\vert \vert \overrightarrow{v} \vert \vert = \sqrt{a^{2} + b^{2}}$

The concept can easily extended by adding additional vector components.

Example

- $\overrightarrow{A} = <1, 2, 3>$
- $\overrightarrow{B} = <-2, -3, 4>$
- $\overrightarrow{AB} = <-3, -5, 1>$
- $\vert \overrightarrow{AB} \vert = \sqrt{(-3)^{2} + (-5)^{2} +1^{2}} = \sqrt{35}$

### Standard Basis Vectors

- $\vert \overrightarrow{I} \vert = <1, 0, 0>$
- $\vert \overrightarrow{J} \vert = <0, 1, 0>$
- $\vert \overrightarrow{K} \vert = <0, 0, 1>$

Theses standard basis vectors can be used to represent any other vector

- $<2, -1, 3> = <2i, -j, 3k>$

### Unit Vectors

Unit vectors have a magnitude of 1.

Unit vectors have the same direction $\overrightarrow{a}$.

A unit vector is determined by dividing each component of the vector by the vectors magnitude.

Let $\overrightarrow{a} = <1, 2, 2>$

- $\vert \overrightarrow{a} \vert = \sqrt{1^{2} + 2^{2} + 2^{2}} = 3$
- $\dfrac{\overrightarrow{a}}{\vert \overrightarrow{a} \vert} = <\dfrac{1}{3}, \dfrac{2}{3}, \dfrac{2}{3}>$