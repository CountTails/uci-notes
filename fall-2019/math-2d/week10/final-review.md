# Final Review

## Before Mid-Term

- 1 - 2 problems
	- Ch. 10
	- Ch. 11
	- Ch. 12
- Focus on Ch. 12
	- 3D spaces
		- distances
		- lines
		- planes
	- vectors
		- dot product
		- cross product
	- Quadric surfaces

## After Mid-Term

- 6 - 7 problems
	- Ch. 14
	- Ch. 15
- details on canvas

## Total # of Problems

- Need to complete 8 problems (9 problems available)
- Total score is out of 80 points
	- Time: 12/11/2019 @ 1:30 - 3:30 pm
	- Location: ELH (in-class)
	- 8 + 1 problems
	- Closed book; No calculator
- Score distribution
	- A: 20%
	- B: 25%
	- C: 30%
	- D: 15%
	- F: 10%

## Chapter 10

A plane curve described by $x = f(t)$ and $y = g(t)$ is a parametric curve described by parametric equations

A parametric curve has first derivative $\dfrac{dy}{dx} = \dfrac{dy / dt}{dx / dt}$ and second derivative $\dfrac{d^{2}y}{dx^{2}} = \dfrac{\dfrac{d}{dt} \left(\dfrac{dy}{dx} \right)}{dx / dt}$

The area bounded by a parametric curve is $A = \int \limits_{\alpha}^{\beta} g(t) * f'(t) \, dt$ or $A = \int \limits_{\alpha}^{\beta} g'(t) * f(t) \, dt$

The length of a parametric curve is $L = \int \limits_{t_{1}}^{t_{2}} \sqrt{\left(\dfrac{dy}{dt}\right)^{2} + \left(\dfrac{dx}{dt}\right)^{2}} \, dt$

Polar coordinates and curves follow the equations above as well. Convert between cartesian and polar points with

- $x = rcos(\theta)$
- $y = rsin(\theta)$
- $x^{2} + y^{2} = r^{2}$
- $tan(\theta) = \dfrac{y}{x}$

## Chapter 12.1 - 12.2

Three coordinate axis perpendicular to each other. Divides space into eight octants.

Distance formula in 3 dimensions: $d = \sqrt{(x_{2} - x_{1})^{2} + (y_{2} - y_{1})^{2} + (z_{2} - z_{1})^{2}}$

Equation of a sphere with center $(h, k, l)$ with radius $r$: $(x - h)^{2} + (y - k)^{2} + (z - l)^{2} = r^{2}$

Vectors formulas

| Formula Name | Formula |
| --- | --- |
| Sum Rule | $\langle a, b, c \rangle + \langle d, e, f \rangle = \langle a + d, b + e, c + f \rangle$ |
| Difference Rule | $\langle a, b, c \rangle - \langle d, e, f \rangle = \langle a - d, b - e, c - f \rangle$ |
| Constant Multiplier Rule | $k * \langle a, b, c \rangle = \langle ka, kb, kc \rangle$ |
|  Magnitude | $\vert \langle a, b, c \rangle \vert = \sqrt{a^{2} + b^{2} + c^{2}}$ |
| Unit Vector | $\overrightarrow{u} = \dfrac{\langle a, b, c \rangle}{\vert \langle a, b, c \rangle \vert}= \dfrac{\overrightarrow{v}}{\vert \overrightarrow{v} \vert}$ |

## Chapter 12.3 - 12.4

Let $\overrightarrow{a} = \langle a_{1}, a_{2}, a_{3} \rangle$ and $\overrightarrow{b} = \langle b_{1}, b_{2}, b_{3} \rangle$

The dot product is: $a \cdot b = a_{1}b_{1} + a_{2}b_{2} + a_{3}b_{3}$

The angle between $\overrightarrow{a}$ and $\overrightarrow{b}$ is: $cos(\theta) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert}}$

$\overrightarrow{a}$ is perpendicular to $\overrightarrow{b}$ if and only if $\overrightarrow{a} \cdot \overrightarrow{b} = 0$

$\overrightarrow{a}$ is parallel to $\overrightarrow{b}$ if $cos(\theta) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert}} = 1$ or $cos(\theta) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert}} = -1$

Scalar projection of $\overrightarrow{b}$ onto $\overrightarrow{a}$: $comp_{a}(b) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert}}$

Vector projection of $\overrightarrow{b}$ onto $\overrightarrow{a}$: $proj_{a}(b) = (comp_{a}(b) = \left(\dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert}} \right)\dfrac{\overrightarrow{a}}{\overrightarrow{\vert a \vert}}$

The cross product of $\overrightarrow{a}$ and $\overrightarrow{b}$ is $\overrightarrow{a} \times \overrightarrow{b} = \begin{bmatrix} i & j & k \\ a_{1} & a_{2} & a_{3} \\ b_{1} & b_{2}  & b_{3} \end{bmatrix}$

$\overrightarrow{a} \times \overrightarrow{b}$ is perpendicular to $\overrightarrow{a}$ and $\overrightarrow{b}$

$\vert \overrightarrow{a} \times \overrightarrow{b} \vert = \overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert} sin(\theta)$  if $0 \le \theta \le \pi$

$\overrightarrow{a}$ is parallel to $\overrightarrow{b}$ if and only if $\overrightarrow{a} \times \overrightarrow{b} = 0$

$\vert \overrightarrow{a} \times \overrightarrow{b} \vert$ represents the area of the parallelogram defined by $\overrightarrow{a}$ and $\overrightarrow{b}$

$\dfrac{1}{2}\vert \overrightarrow{a} \times \overrightarrow{b} \vert$ represents the area of the triangle defined by $\overrightarrow{a}$ and $\overrightarrow{b}$

$\overrightarrow{a} \cdot \left( \overrightarrow{b} \times \overrightarrow{c} \right)$ represents the volume of the parallelopiped defined by $\overrightarrow{a}$, $\overrightarrow{b}$, and $\overrightarrow{c}$

## Chapter 12.5

Equations for lines in 3d space: $a$, $b$, and $c$ are the directional numbers of the vector that describes the line.

| Equation Type | Form |
| --- | --- |
| Vector | $\overrightarrow{r}(t) = \langle x_{0}, y_{0}, z_{0} \rangle + \langle a, b, c \rangle t$
| Parametric | $\begin{cases} x = x_{0} + at \\ y = y_{0} + bt \\ z = z_{0} + bt\end{cases}$ |
| Symmetric | $\dfrac{x - x_{0}}{a} = \dfrac{y - y_{0}}{b} = \dfrac{z - z_{0}}{c}$ |

Equation for a plane: a, b, and c are the directional numbers of the vector normal to the plane. They take the form of $a(x-x_{0})+b(y-y_{0})+c(z-z_{0})=0$

### Intersections

| Step | Between 2 lines | Between 2 planes | Between a line and a plane |
| --- | --- | --- | --- |
| 1 | Obtain parametric equations for both lines | Direction of line is $n_{1} \times n_{2}$ (cross product of the planes' normal vectors) | Obtain the parametric equations for the line |
| 2 | fix one variable | Obtain a point on the line by fixing one variable and solving for the remaining two using the plane equations | Substitute parametric equations into the plane equations |
| 3 | solve for the remaining two | | solve for $t$ and plug $t$ into parmetric equations to obtain a point |
| 4 | check that the resulting point satisfies both equations | | |

### Angles

$cos(\theta) = \dfrac{n_{1} \cdot n_{2}}{\vert n_{1} \vert \vert n_{2} \vert}$ is the angle between planes. Lines will use directional vectors instead

### Distances

$d = \dfrac{\vert a(x_{1} - x_{0}) + b(y_{1} - y_{0}) + c(z_{1} - z_{0}) \vert}{\sqrt{a^{b} + b^{2} + c^{2}}}$ is the distance from a point to a plane. Lines can be viewed as parallel planes and the normal vector is the cross product of the directional vectors

## Chapter 12.6

| Surface name | Form | Extra info |
| --- | --- | --- |
| Cylinders | $z = x^{2}$ or $x^{2} + y^{2} = 1$ | 3D equation that does not contain 3 variables. Not dependent on missing variable
| Ellipsoid | $\dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}} + \dfrac{z^{2}}{c^{2}} = 1$ | Becomes a sphere if $a = b = c$ |
| Elliptic Paraboloid | $\dfrac{z}{c} = \dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}}$ | |
| Hyperbolic Parabloloid | $\dfrac{z}{c} = \dfrac{x^{2}}{a^{2}} - \dfrac{y^{2}}{b^{2}}$ | | 
| Cone | $\dfrac{z^{2}}{c^{2}} = \dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}}$ | |
| Hyperboloid of one sheet | $\dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}} - \dfrac{z^{2}}{c^{2}} = 1$ | One term is negative, the rest positive |
| Hyperboloid of two sheets | $-\dfrac{x^{2}}{a^{2}}  \dfrac{y^{2}}{b^{2}} + \dfrac{z^{2}}{c^{2}} = 1$ | One term is positive, the rest negative |

## Chapter 13

### Limits

if $\overrightarrow{r}(t) = \langle f(t), g(t), h(t) \rangle$ then $\lim \limits_{t \to a} \overrightarrow{r}(t) = \langle \lim \limits_{t \to a} f(t), \lim \limits_{t \to a} g(t), \lim \limits_{t \to a} h(t) \rangle$

### Derivatives

$\overrightarrow{r'}(t) = \langle f'(t), g'(t), h'(t) \rangle$

### Integrals

$\int \limits_{a}^{b} \overrightarrow{r}(t) \, dt = \langle \int \limits_{a}^{b} f(t) \, dt, \int \limits_{a}^{b} g(t) \, dt, \int \limits_{a}^{b} h(t) \, dt \rangle$

The length of $\overrightarrow{r}(t)$ is $L = \int \limits_{a}^{b} \sqrt{\left( \dfrac{dx}{dt} \right)^{2} + \left( \dfrac{dy}{dt} \right)^{2} + \left( \dfrac{dz}{dt} \right)^{2}}$

Arc length function: Let $s$ be the length of the curve starting  from time $a$ to time $t$. Evaluate the arc length and solve for $t$ in terms of $s$. Then substitute $t(s)$ into $r(t)$

Curvature: $\kappa(t) = \dfrac{\vert r'(t) \times r''(t) \vert}{\vert r'(t) \vert^{3}}$

## Chapter 14

$\lim \limits_{(x, y) \to (a, b)} f(x, y)$ does not exist if two paths return different limits. Paths are determined by a line or function that passes through the limits.

If multiple paths return the same limit, use squeeze theroem. Always directly substitute first.

$f(x, y)$ is continuous at $(a, b)$ if $f(a, b) = \lim \limits_{(x, y) \to (a, b)} f(x, y)$

$f_{x}(x, y) = \lim \limits_{h \to 0} \dfrac{f(x + h, y) - f(x, y)}{h}$ is the partial derivative of $f$ with respect to $x$. Differentiate $x$ and treat $y$ as a constant. Similarly, for $f_{y}(x, y)$, differentiate $y$ and treat $x$ as a constant.

If $f(x, y)$ is continuous on its domain, then $f_{xy}(a, b) = f_{yx}(a, b)$

Tangent plane to $f(x, y)$ at $(x_{0}, y_{0}, z_{0})$: $z = z_{0} + f_{x}(x_{0}, y_{0})(x - x_{0}) + f_{y}(x_{0}, y_{0})(y - y_{0})$

The tangent plane can be the linearization of $f$ if $f$ is differentiable. $f$ is differentiable if its partial derivatives are continuous at $(x_{0}, y_{0}, z_{0})$

$\Delta z = f(x + \Delta x, y + \Delta y) - f(x, y)$ and $dz = f_{x}(x, y) \, dx + f_{y}(x, y) \, dy$

Suppose $f(x, y)$ is differentiable and $x = g(t)$ and $y = h(t)$ then $\dfrac{dz}{dt} = \dfrac{\partial f}{\partial x} * \dfrac{dx}{dt} + \dfrac{\partial f}{\partial y} * \dfrac{dy}{dt}$

Suppose $f(x, y)$ is differentiable and $x = g(s, t)$ and $y = h(s, t)$ then $\dfrac{\partial z}{\partial s} = \dfrac{\partial f}{\partial x} * \dfrac{\partial x}{\partial s} + \dfrac{\partial f}{\partial y} * \dfrac{\partial y}{\partial s}$ and $\dfrac{\partial z}{\partial t} = \dfrac{\partial f}{\partial x} * \dfrac{\partial x}{\partial t} + \dfrac{\partial f}{\partial y} * \dfrac{\partial y}{\partial t}$ 

If $F(x, y) = 0$ or $F(x, f(x)) = 0$ such that $y$ is a function of $x$ and $F$ is differentiable then $\dfrac{dy}{dx} = -\dfrac{F_{x}}{F_{y}}$

If $z = f(x, y)$ is given as $F(x, y, z) = 0$ or $F(x, y, f(x, y)) = 0$ then $\dfrac{\partial z}{\partial x} = -\dfrac{\partial F / \partial s}{\partial F / \partial z}$ and $\dfrac{\partial z}{\partial y} = - \dfrac{\partial F / \partial y}{\partial F / \partial z}$

$D_{u}f(x, y) = f_{x}(x, y)a + f_{y}(x, y)b$ where $u = \langle a, b \rangle$ is a unit vector

$D_{u}f(x, y) = f_{x}(x, y)cos(\theta) + f_{y}(x, y)sin(\theta)$ where $\theta$ is the indicated direction

$\triangledown f(x, y) = \langle f_{x}(x, y), f_{y}(x, y) \rangle$

$D_{u}f(x, y) =  \triangledown f(x, y) \cdot \overrightarrow{u}$

The max value of directional derivative is $\vert \triangledown f(x, y) \vert$ when $\overrightarrow{u}$ has the same direction as $\triangledown f$

Critical points are obtained when $f_{x}(x, y) = 0$ and $f_{y}(x, y) = 0$ 

Second derivatite test: $D(a, b) = f_{xx}(a, b)f_{yy}(a, b) - \left( f_{xy}(a, b) \right)^{2}$

- If $D > 0$ and $f_{xx} > 0$ then $(a, b)$ is a local min
- If $D > 0$ and $f_{xx} < 0$ then $(a, b)$ is a local max
- If $D < 0$ then $(a, b)$ is a saddle point
- If $D = 0$ then no information about $(a, b)$ can be determined

For absolute max and min values

1. Find the local extrema inside the region $D$
2. Find the extrema on the boundaries of the region $D$
3. The largest is absolute max; the smallest is the absolute min

For absolute max and min values given a restriction (or two)

- One restriction: $\triangledown f = \lambda \triangledown g$; expand the vector equation and solve
- Two restrictions: $\triangledown f = \lambda \triangledown g + \mu \triangledown h$; expand the vector equation and hope for the best

## Chapter 15

$\iint \limits_{R} f(x, y) \, dA = \sum \limits_{i = i}^{m} \sum \limits_{j = 1}^{n} f(x_{ij}^{*}, y_{ij}^{*}) \Delta A$ 
$= f(x_{0}, y_{0}) \Delta A + f(x_{1}, y_{0}) + \Delta A + f(x_{0}, y_{1}) \Delta A + f(x_{1}, y_{1}) \Delta A + ... + f(x_{m}, y_{n}) \Delta A$

$\iint \limits_{R} f(x, y) \, dA = \int \limits_{a}^{b} \int \limits_{c}^{d} f(x, y)\, dy \, dx$ where $R = [a, b] \times [c, d]$ and $dA = dy * dx$

Integrate with respect to the indicate variable, treat others a s constants

If $f$ is continuous on the rectangle $R = [a, b] \times [c, d]$ then  $\int \limits_{a}^{b} \int \limits_{c}^{d} f(x, y)\, dy \, dx = \int \limits_{c}^{d} \int \limits_{a}^{b} f(x, y)\, dx \, dy$

If $f$ is continuous on a region $D$ such that $D = \{ (x, y) \vert a \le x \le b \, and \, g_{1}(x) \le y \le g_{2}(x) \}$ then $\iint \limits_{D} f(x, y) \, dA = \int \limits_{a}^{b} \int \limits_{g_{1}(x)}^{g_{2}(x)} f(x, y) \, dy \, dx$

If $f$ is continuous on a region $D$ such that $D = \{ (x, y) \vert h_{1}(y) \le x \le h_{2}(y) \, and \, c \le y \le d \}$ then $\iint \limits_{D} f(x, y) \, dA = \int \limits_{c}^{d} \int \limits_{h_{1}(y)}^{h_{2}(y)} f(x, y) \, dx \, dy$

$\iint \limits_{D} 1 \, dA$ is the area of the region $D$

If $m \le f(x, y) \le M \forall (x, y) \in D$, then $m * A(D) \le \iint \limits_{D} f(x, y) \, dA \le M *A(D)$ where $A(D)$ is the area of the region $D$

Change to polar coordinates

$\iint \limits_{R} f(x, y) \, dA = \int \limits_{\alpha}^{\beta} \int \limits_{a}^{b} f(rcos(\theta), rsin(\theta) \, rdrd\theta$

If $f$ is continuous on a polar region of the form $D =\{ (r, \theta) \vert \alpha \le \theta \le \beta \, and \, h_{1}(\theta) \le r \le h_{2}(\theta) \}$, then $\iint \limits_{D} f(x, y) \, dA = \int \limits_{\alpha}^{\beta} \int \limits_{h_{1}(\theta)}^{h_{2}(\theta)} f(rcos(\theta), rsin(\theta)) \, rdrd\theta$

This can be used to find the area enclosed by a polar curve
