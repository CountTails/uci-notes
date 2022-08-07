# Double Integrals Over Rectangular Regions

## Definition

Let $z = f(x, y)$ be defined on $R = [a, b] \times [c, d]$. Assume that $f > 0$ for every input in $R$.

Let $S$ be the solid that lies above $R$ and under the graph of $f$.

The integral of $z$ is the volume of the solid $S$.

## Methods

### Estimation

- Step 1: Divide $R$ into subrectangles
	- divide $[a, b]$ into $m$ subintervals $[x_{i-1}, x_{i}]$ of equal width $\Delta x$
	- divide $[c, d]$ into $n$ subintervals $[y_{i-1}, y_{i}]$ of equal width $\Delta y$
		- $\Delta x = \dfrac{b - a}{m}$
		- $\Delta y = \dfrac{d - c}{n}$
		- $\Delta A = \Delta x * \Delta y$
- Step 2: In each $R_{ij}$ choose sample points $(x_{ij}^{*}, y_{ij}^{*})$
	- Each sample point will approximate the part of $S$ that lies above it
	- The base is $R_{ij}$ with height of $f(x_{ij}^{*}, y_{ij}^{*})$
	- The volume is $f(x_{ij}^{*}, y_{ij}^{*}) * \Delta A$
- Step 3: Add up of the volumes made to approximate $S$
	- $V \approx \sum \limits_{i=1}^{m} \sum \limits_{i=1}^{n} f((x_{ij}^{*}, y_{ij}^{*})) * \Delta A$
	- This is known as a double reimann sum

The approximation gets better as $m$ and $n$ get larger

$V = \lim_{m, n \to \infty} \sum \limits_{i=1}^{m} \sum \limits_{i=1}^{n} f((x_{ij}^{*}, y_{ij}^{*})) * \Delta A$ if the limit exists

### Double integral over the region $R$

$V = \iint \limits_{R} f(x, y) \, dA$

if $f \ge 0$ the volume $V$ of the solid that lies above $R$ and below $z = f(x, y$) is the double integral

$\iint \limits_{R} f(x, y) \, dA$ is difficult to evaluate with a reimann sum

Iterated integrals

- simply integrate twice
	- once with respect to y
	- once with respece to x
- $\iint \limits_{R} f(x, y) \, dA = \int \limits_{c}^{d} f(x, y_ \, dy = A(x) \to \int \limits_{a}^{b} A(x) \, dx$
- $\int \limits_{a}^{b} [\int \limits_{c}^{d} f(x, y) \, dy] \, dx$
- $\int \limits_{c}^{d} [\int \limits_{a}^{b} f(x, y) \, dx] \, dy$

> Fubini's Theorem
> If $f(x, y)$ is continuous on the rectangle $[a, b] \times [c, d]$, then $\iint \limits_{R} f(x, y) \, dA = \int \limits_{a}^{b} \int \limits_{c}^{d} f(x, y) \, dy\, dx = \int \limits_{c}^{d} \int \limits_{a}^{b} f(x, y) \, dx \, dy$
> If $f(x, y) = g(x) * h(y)$ then $\iint \limits_{R} f(x, y) \, dA = \int \limits_{a}^{b} \int \limits_{c}^{d} g(x) * h(y) \, dy \, dx = \int \limits_{a}^{b} g(x) \, dx * \int \limits_{c}^{d} h(y) \, dy$

### Average Value of a function

Consider a function $f(x, y)$ defined over a region $R$.

Then the average value of the function over the region $R$ is $f_{ave} = \dfrac{1}{A(R)} \iint \limits_{R} f(x, y) \, dA$ where $A(R)$ is the area of $R$

## Examples

### Example 1

Estimate the volume of the solid that lies above the square $R = [0, 2] \times [0, 2]$ and below the elliptic paraboloid $z = 12 - 2x^{2} - y^{2}$.

Divide $R$ into 4 squares and use the upper right corner as the sample points

$V \approx \sum \limits_{i=1}^{2} \sum \limits_{j = 1}^{2} f(x_{ij}^{*}, y_{ij}^{*}) * 1$

$V \approx f(1, 1) + f(2, 1) + f(1, 2) + f(2, 2)$

$V \approx 9 + 3 + 6 + 0 = 18$

### Example 2

Estimate the volume of the solid that lies above the square $R = [0, 2] \times [0, 2]$ and below the elliptic paraboloid $z = 12 - 2x^{2} - y^{2}$.

Divide $R$ into 4 squares and use the middle of the squares as the sample points.

- Where $\overline{x_{i}}$ is the midpoint of $[x_{i-1}, x_{i}] \to \dfrac{x_{i-1} + x_{i}}{2}$
- Where $\overline{x_{i}}$ is the midpoint of $[y_{i-1}, y_{i}] \to \dfrac{y_{i-1} + y_{i}}{2}$

$V \approx \sum \limits_{i=1}^{2} \sum \limits_{j = 1}^{2} f(x_{ij}^{*}, y_{ij}^{*}) * 1$

$V \approx f(\dfrac{1}{2}, \dfrac{1}{2}) + f(\dfrac{1}{2}, \dfrac{3}{2}) + f(\dfrac{3}{2}, \dfrac{1}{2}) + f(\dfrac{3}{2}, \dfrac{3}{2}) = 31$

The midpoint is a better approximation

### Example 3

Find the volume of the solid that lies above the region $R = [1, 2] \times [3, 4]$ and below the surface $f(x, y) = xe^{y}$

$\int \limits_{1}^{2} \int \limits_{3}^{4} xe^{y} \, dy \, dx$

$= \int \limits_{1}^{2} xe^{y} \vert_{3}^{4} \, dx = \int \limits_{1}^{2} xe^{4} - xe^{3} \, dx$

$= \int \limits_{1}^{2} xe^{4} - xe^{3} \, dx = \dfrac{x^{2}}{2}(e^{4} - e^{3}) \vert_{1}^{2} = \dfrac{3}{2}(e^{4} - e^{3})$


### Example 4

Find the volume of the solid that lies above the region $R = [1, 2] \times [0, \pi]$ and below the surface $z = xcos(xy)$

$\int \limits_{1}^{2} \int \limits_{0}^{\pi} xcos(xy) \, dx \, dy = \int \limits_{1}^{2} sin(xy) \vert_{0}^{\pi} \, dx = \int \limits_{1}^{2} sin(\pi x) \, dx$

$= \dfrac{-cos(\pi x)}{\pi} \vert_{1}^{2} = \dfrac{2}{\pi}$

Since $z$ is continuous over the region $R$, the problem could also be solved as $\int \limits_{0}^{\pi} \int \limits_{1}^{2} xcos(xy) \, dx \, dy$ but it is more complicated than the first option. It requires the integration by parts technique. 

### Example 5

Find the volume of the solid that lies above the square $R = [0, \dfrac{\pi}{2}] \times [0, \dfrac{\pi}{2}]$ and below the surface $z = sin(x) * cos(y)$.

$\iint \limits_{R} sin(x)cos(y) \, dA = \int \limits_{0}^{\pi / 2} sin(x) \, dx * \int \limits_{0}^{\pi / 2} cos(y) \, dy$

$= (-cos(x) \vert_{0}^{\pi / 2})(sin(y) \vert_{0}^{\pi / 2}) = (1)(1) = 1$

### Example 6

Find the average value of the function $f(x, y) = sin(x)cos(y)$ over the region $R = [0, \dfrac{\pi}{2}] \times [0, \dfrac{\pi}{2}]$

$f_{ave} = \dfrac{1}{A(R)} \iint \limits_{R} f(x, y) \, dA$

$A(R) = (\dfrac{\pi}{2})(\dfrac{\pi}{2}) = \dfrac{\pi^{2}}{4}$

From example 5, we know the value of the integral is $1$. Thus the average value of the function is $\dfrac{\pi^{2}}{4}$
