# Min and Max Values

## Definition

### Local Maximums

$z = f(x, y)$ has a local maximum at $(a, b)$ if $f(x, y) \le f(a, b)$ when $(x, y)$ is near $(a, b)$. $f(a, b)$ is called a local maximum.

### Local Minimums

$z = f(x, y)$ has a local miimum at $(a, b)$ if $f(x, y) \ge f(a, b)$ when $(x, y)$ is near $(a, b)$. $f(a, b)$ is called a local minimum.

### Critical Points

A point $(a, b)$ is called a critical point of $f$ if:

- $f_{x}(x, y) = 0$
- $f_{y}(x, y) = 0$

#### Thereom 1

> If $f(x, y)$ has a local max or a local min at $(a, b)$ and the first order partial derivatives exist at $(a, b)$, then $f_{x}(x, y) = 0$ and $f_{y}(x, y) = 0$


## Methods to find

### Local Min/Max

Suppose the second partial derivatives of $f$ are continuous on a disk with center $(a, b)$ and $f_{x}(x, y) = 0$ and $f_{y}(x, y) = 0$

Let $D = D(a, b) = f_{xx}(a, b) \cdot f_{yy}(a, b) - [f_{xy}(a, b)]^{2}$

$D = det\begin{bmatrix} f_{xx} f_{xy} \\ f_{yx} f_{yy} \end{bmatrix}$

- If $D > 0$ and $f_{xx}(a, b) > 0$, then $f(a, b)$ is a local min
- If $D > 0$ and $f_{xx}(a, b) < 0$, then $f(a, b)$ is a local max
- If $D < 0$, then $f(a, b)$ is *NOT* an extreme value

### Absolute Min/Max

A closed set in $\mathbb{R}^{2}$ is one that contains all its boundary points

A bounded set in $\mathbb{R}^{2}$ is one that is finite in extent

#### Thereom 2

> *Extreme value thereom for functions of two variables*
> 
> If $f(x, y)$ is continuous on a closed, bounded set $D$, in $\mathbb{R}^{2}$, then $f$ attains an absolute max $f(x_{1}, y_{1})$ at $(x_{1}, y_{1})$ and an absolute min $f(x_{2}, y_{2})$ at $(x_{2}, y_{2})$

To find: 

1. Find the values of $f$ at the critical points **in** $D$
2. Find the extreme values of values on the boundary of $D$
3. The largest value is the absolute max and the smallest value is the absolute min

## Examples

### Example 1

Let $f(x, y) = x^{2} + 2y^{2} - 2x + 8y - 1$

- $f_{x}(x, y) = 2x - 2$
	- $0 = 2x - 2 \to x = 1$
- $f_{y}(x, y) = 4y + 8$
	- $0 = 4y + 8 \to y = -2$

$(1, -2)$ is a critical point

At $(1, -2)$, $f$ attains a maximum

### Example 2

Let $f(x, y) = y^{2} -  x^{2}$

- $f_{x}(x, y) = -2x$
	- $0 = 2x \to x = 0$
- $f_{y}(x, y) = 2y$
	- $0 = 2y \to y = 0$

$(0, 0)$ is a critical point

$f(0, 0) = 0$ is *NOT* an extreme value

$f(x, 0) = -x^{2} < 0$ if $x \ne 0$ so $(0, 0)$ is a max

$f(0, y) = y^{2} > 0$ if $y \ne 0$ so $(0, 0)$ is a min

$\therefore \, f(0, 0) = 0$ is not an extreme value

### Example 3

Let $f(x, y) = x^{4} + y^{4} - 4xy$

- $f_{x}(x, y) = 4x^{3} - 4y = 0$
- $f_{y}(x, y) = 4y^{3} - 4x = 0$
	- Let $x^{3} = y \to x^{9} - x = 0$
	- $x^{9} - x = x(x^{8} - 1) = x(x^{4} + 1)(x^{2} + 1)(x + 1)(x - 1)$
	- $x = \{1, 0, -1\}$
	- $y = \{1, 0, -1\}$

$f_{xx}(x, y) = 12x^{2} \to f_{xx}(1, 1) = 12$

$f_{yy}(x, y) = 12y^{2} \to f_{yy}(-1, -1) = 12$

$f_{xy}(x, y) = -4$

- $D(x, y) = 144x^{2}y^{2} - 16$
	- $D(0, 0) = -16$ -- neither
	- $D(1, 1) = 128$ -- min
	- $D(-1, -1) = 128$ -- min

### Example 4

Let $f(x, y) = x^{2} - 2xy + 2y$ on $D = \{ (x, y) \vert \begin{cases} 0 \le x \le 3 \\ 0 \le y \le 2 \end{cases}\}$

Step 1: check for extrema **in** $D$

- $f_{x}(x, y) = 2x - 2y$
	- $0 = 2x - 2y$
	- $0 = 2(1) - 2y$
	- $y = 1$
- $f_{y}(x, y) = -2x + 2$
	- $0 = -2x + 2$
	- $x = 1$
- $f(1, 1) = 1 - 2 + 2 = 1$

Step 2: check boundaries of $D$

- $L_{1}: y = 0$
	- $f(x) = x^{2} \{ 0 \le x \le 3 \}$
	- min: 0; max: 9
- $L_{2}: x = 3$
	- $f(y) = 9 - 4y \{ 0 \le y \le 2 \}$
	- min: 1; max: 9
- $L_{3}: y = 2$
	- $f(x) = x^{2} - 4x - 4 \{ 0 \le x \le 3 \}$
	- min: 0; max: 4
- $L_{4}: x = 0$
	- $f(y) = 2y \{ 0 \le y \le 2 \}$
	- min: 0; max: 4

The absolute max: 9

The absolute min: 0