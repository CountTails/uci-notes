# Arc Length and Curvature

## Arc Length

### 2-Dimensions

Given $x = f(t)$ and $y = g(t)$ on the interval $a \le t \le b$

$L = \int_{a}^{b} \sqrt{(\dfrac{dx}{dt})^{2} + (\dfrac{dy}{dt}})^{2} \, dt$

### 3-Dimensions

Given $\overrightarrow{r}(t) = \begin{bmatrix} f(t) \\ g(t)  \\ h(t) \end{bmatrix}$ on the interval $a \le t \le b$

$L = \int_{a}^{b} \sqrt{(\dfrac{df}{dt})^{2} + (\dfrac{dg}{dt})^{2} +(\dfrac{dh}{dt})^{2}} \, dt$

#### Example 1

Let 

- $x = cos(t)$
- $y = sin(t)$
- $z = t$
- $1 \le t \le 2$

$L = \int_{1}^{2} \sqrt{(-sin(t))^{2} + (cos(t))^{2} + (1)^{2}} \, dt$

$L = \int_{1}^{2} \sqrt{2} \, dt = \sqrt{2}t \vert_{1}^{2}$

$L = \sqrt{2}(2) - \sqrt{2}(1) = \sqrt{2}(2 - 1) = \sqrt{2}$

#### Something to Consider

$\overrightarrow{r}(t) = \begin{bmatrix} f(t) \\ g(t) \\ h(t) \end{bmatrix}$ on the interval $a \le t \le b$

Fix the starting point at $a$

Then $s(t) = \int_{a}^{t} \sqrt{(\dfrac{df}{du})^{2} + (\dfrac{dg}{du})^{2} +(\dfrac{dh}{du})^{2}} \, du$

Thus, space curves may have different parametric equations to represent the same curve

#### Example 2

$\overrightarrow{r}(t) = \begin{bmatrix} t \\ t^{2} \\ t^{3} \end{bmatrix}$ on the interval $1 \le t \le 2$
$\overrightarrow{r}(u) = \begin{bmatrix} e^{u} \\ e^{2u} \\ e^{3u} \end{bmatrix}$ on the interval $0 \le t \le ln(2)$

are the same curve.

#### Example 3

$s(t) = \int_{0}^{t} \sqrt{sin^{2}(u) + cos^{2}(u) + 1} \, du = \int_{0}^{t} \sqrt{2} \, du$

$= \sqrt{2}u \vert_{0}^{t} = \sqrt{2}t$

Solve to t.

$s = \sqrt{2}t \to t = \dfrac{s}{\sqrt{2}}$

Plug in t for $\overrightarrow{r}(t)$

$R(s) = \overrightarrow{r}(t(s)) = \begin{bmatrix} cos(\dfrac{s}{\sqrt{2}} \\ sin(\dfrac{s}{\sqrt{2}}) \\ \dfrac{s}{\sqrt{2}}) \end{bmatrix}$ on the inverval $0 \le s \le \sqrt{2}$

The arclength of $R(s)$ for $0 \le s \le a$ is $a$.

$\int_{0}^{a} \sqrt{(cos(\dfrac{s}{\sqrt{2}}))^{2} + (sin(\dfrac{s}{\sqrt{2}}))^{2} + (\dfrac{s}{\sqrt{2}})^{2}} \, ds$

$\int_{0}^{a} \sqrt{(\dfrac{-sin(\dfrac{s}{\sqrt{2}})}{\sqrt{2}})^{2} + (\dfrac{cos(\dfrac{s}{\sqrt{2}})}{\sqrt{2}})^{2} + (\dfrac{1}{\sqrt{2}})^{2}} \, ds$

$\int_{0}^{a} \sqrt{\dfrac{1}{2} + \dfrac{1}{2}} \, ds = a$


## Curvature

Let $C$ be defined as $\overrightarrow{r}(t)$. 

The tangent of $C$ is $\overrightarrow{r'}(t)$.

The unit tangent of $C$ is $\dfrac{\overrightarrow{r'}(t)}{\vert \overrightarrow{r'}(t) \vert}$

- $\overrightarrow{T}(t)$ changes direction slowly when $C$ is straight.
- $\overrightarrow{T}(t)$ changes direction more quickly when $C$ bends sharply.
- The magnitude of the rate of change of the unit tangent vector with respect to arclength(independent of parametrization) is known of curvature and is denoted as $\kappa = \vert \dfrac{d\overrightarrow{T}}{dt} \vert$

 In general, parameter $t$

- $\dfrac{d\overrightarrow{T}}{dt} = \dfrac{d\overrightarrow{T}}{ds} * \dfrac{ds}{dt} \to \kappa = \dfrac{\vert d\overrightarrow / dt \vert }{\vert ds / dt \vert }$
- $\kappa = \dfrac{d\overrightarrow{T}}{\vert \overrightarrow{r'}(t) \vert}$ since $\dfrac{ds}{dt} = \vert \overrightarrow{r'}(t) \vert$

Expressed in terms of $\overrightarrow{r}(t)$

- $\kappa = \dfrac{\vert \overrightarrow{r'}(t) \times \overrightarrow{r''}(t) \vert}{\vert \overrightarrow{r'}(t) \vert^{3}}$

### Side Note

Curvature also exists in 2-Dimensions.

Given the graph $y = f(x)$.

- $\overrightarrow{r}(x) = x\overrightarrow{i} + f(x)\overrightarrow{j} + 0\overrightarrow{k}$
- $\overrightarrow{r'}(t) = \overrightarrow{i} + f'(x)\overrightarrow{j}$
- $\overrightarrow{r''}(t) = f''(x)\overrightarrow{j}$
- $\overrightarrow{r'} \times \overrightarrow{r''} = f''(x)\overrightarrow{k}$
- $\vert \overrightarrow{r'}(x) \vert = \sqrt{1 + (f'(x))^{2}}$
- So, $\kappa = \dfrac{\vert \overrightarrow{r'} \times \overrightarrow{r''} \vert}{\vert \overrightarrow{r'} \vert^{3}} = \dfrac{\vert f''(x) \vert}{\vert 1 + (f(x))^{2} \vert^{\dfrac{3}{2}}}$

#### Example 4

Let $f(x) = x^{2}$

- $f'(x) = 2x$
- $f''(x) = 2$

$\kappa(0) = \dfrac{2}{(1 + 0)^{\dfrac{3}{2}}} = 2$


