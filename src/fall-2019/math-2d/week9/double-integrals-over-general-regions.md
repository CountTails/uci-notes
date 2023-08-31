# Double Integrals Over General Regions

## Definition

Let $f(x, y)$ be defined on domain $D$, which may not be a rectangle.

Let $D$ be a bounded region such that a rectangular region $R$ that encloses $D$

Define $F(x, y) = \begin{cases} f(x,y) ,\, if \, (x, y) \in D \\ 0 ,\, if \, (x, y) \notin D \end{cases}$

$\iint \limits_{D} f(x,y) \, dA = \iint \limits{R} F(x,y) \, dA$

## Methods

A plane region $D$ is said to be of type I if

- $D = \{ (x, y) \vert a \le x \le b ,\, g_{1}(x) \le y \le g_{2}(x) \}$
- $g_{1}$ and $g_{2}$ are continuous

A plane region $D$ is said to be of type II if

- $D = \{ (x, y) \vert c \le y \le d ,\, h_{1}(y) \le x \le h_{2}(y) \}$
- $h_{1}$ and $h_{2}$ are continuous

## Properties

Sum rule: $\iint \limits_{D} f(x, y) + g(x, y) \, dA = \iint \limits_{D} f(x, y) \, dA + \iint \limits_{D} g(x, y) \, dA$

constant rule: $\iint \limits_{D} cf(x,y) \, dA = c \iint \limits_{D} f(x,y) \, dA$

relativity: $f(x, y) \ge g(x, y) \forall (x,y) \in D \to \iint \limits_{D} f(x, y) \, dA \ge \iint \limits_{D} g(x, y) \, dA$

disjoing regions: $D = D_{1} \cup D_{2} \to \iint \limits_{D} f(x, y) \, dA = \iint \limits_{D_{1}} f(x, y) \, dA + \iint \limits_{D_{2}} f(x, y) \, dA$

Area of $D$: $\iint \limits_{D} 1 \, dA$

bounds: $m \le f(x, y) \le n \forall (x, y) \in D \to mA(D) \le \iint \limits_{D} f(x, y) \, dA = nA(D)$

## Examples

### Example 1

Evaluate $\iint \limits_{D} (2x - y) \, dA$ where $D$ is bounded by $y = 3x^{2}$ and $y =2 + x^{2}$

Solve for the bounds of $D$

- $3x^{2} = 2 + x^{2}$
- $2x^{2} = 2$
- $x = \pm 1$

$D$ is bound by $(1, 3)$ and $(-1, 3)$

$\iint \limits_{D} (2x - y) \, dA = \int \limits_{-1}^{1} \int \limits_{3x^{2}}^{2 + x^{2}} (2x - y) \, dydx = \int \limits_{-1}^{1} (2xy - \dfrac{y^{2}}{2} \vert_{3x^{2}}^{2 + x^{2}}) \, dx$

$= \int \limits_{-1}^{1} [2x(2 + x^{2}) - \dfrac{(2 + x^{2})^{2}}{2} - (2x(3x^{2}) - \dfrac{(3x^{2})^{2}}{2})] \, dx$

$= \int \limits_{-1}^{1} 4x^{4} - 4x^{3} - 2x^{2} + 4x - 2 \, dx = \dfrac{4}{5}x^{5} - x^{4} - \dfrac{2}{3}x^{3} + 2x^{2} - 2x \vert_{-1}^{1}$
$= \dfrac{56}{15}$

### Example 2

Evaluate $\iint \limits_{D} xy \, dA$ where $D$ is bounded by $y = 1 - x$ and $y^{2} = x + 5$

Solve for the bounds of $D$

- $-y + 1 = y^{2} - 5$
- $0 = y^{2} + y - 6$
- $0 = (y + 3)(y - 2)$

$D$ is bounded by $(4, -3)$ and $(-1, 2)$

$\iint \limits_{D} xy \, dA = \int \limits_{-3}^{2} \int \limits_{y^{2} - 5}^{-y + 1} xy \, dxdy = \int \limits_{-3}^{2} \dfrac{1}{2}yx^{2} \vert_{y^{2} - 5}^{-y + 1} \, dy$

$= \int \limits_{-3}^{2} [\dfrac{1}{2}y((-y + 1)^{2} - (y^{2} - 5)^{2})] \, dy$

$= \int \limits_{-3}^{2} -\dfrac{1}{2}y^{5} + \dfrac{-11}{2}y^{3} -y^{2} -12y \, dy$

$= -\dfrac{1}{12}y^{6} + \dfrac{11}{8}y^{4} - \dfrac{1}{2}y^{2} - 6y^{2} \vert_{-3}^{2} = \dfrac{125}{8}$

### Example 3

$\int \limits_{0}^{1} \int \limits_{x}^{1} sin(y^{2}) \, dydx$

$= \int \limits_{0}^{1} \int \limits_{0}^{y} sin(y^{2}) \, dxdy = \int \limits_{0}^{1} ysin(y^{2}) \, dy$

$= \dfrac{-1}{2}cos(y^{2}) \vert_{0}^{1} = \dfrac{-1}{2}(cos(1) - 1)$

Order of integration can simplify the problem

### Example 4

$I = \iint \limits_{D} e^{sin(x)cos(y)} \, dA$

$D = \{ (x, y) \vert x^{2} + y^{2} = 1 \}$

since $-1 \le sin(x)cos(y) \le 1$

$e^{-1} \le e^{sin(x)cos(y)} \le e \to \dfrac{\pi}{2} \le I \le e\pi$
