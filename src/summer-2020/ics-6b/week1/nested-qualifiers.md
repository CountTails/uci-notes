# Nested qualifiers

## Some examples

- $\forall x \exists y \, (x + y =0) \to \{ (x, y) \vert y = -x \}$
- $\forall x \forall y \forall z \, ((x + y) + z) = (x + (y + z))$ by associative laws
- $\forall x \forall y ((x > 0) \land (y < 0)) \implies xy < 0)$

## A note of order

The order of quantifiers matters if they are **different**, but not when they are the same

- $\forall x \forall y \, Q(x,y) \equiv \forall y \forall x \, Q(x, y)$
- $\forall x \exists y \, P(x, y) \ne \exists y \forall x \, P(x, y)$
- *but* $\exists y \forall x \, P(x, y) \implies \forall x \exists \, P(x, y)$

## Negating nested qualifiers

Use De Morgan's laws

- $\neg [\forall x \, [\exists y \, (xy = 1)]]$
- $\exists x \in \mathbb{R} \,\, \neg [\exists y \in \mathbb{R} \,\, (xy = 1)]$ Move ($\neg$) inside one level, switch outer quantifier
- $\exists x \in \mathbb{R} \,\, [\forall y \in \mathbb{R} \,\, \neg (xy = 1)]$ Move ($\neg$) insider another level, switch inner quantifer
- This process would repeat until the expression is fully negated

## Some translation practice

Translate: the sum of two positive integers is always positive

1) Make explicit the domain and quantifier
2) "**For every** $x$ and $y$ that are positive integer, their *sum* is also positive"

$$
    \forall x \in \mathbb{Z} 
    \forall y \in \mathbb{Z} 
    (x > 0 \land y > 0) \implies (x + y > 0)
$$

Translate: $\forall x \, (C(x) \lor \exists y \, (C(y) \land F(x, y)))$

"Everyone either owns a computer or has a friend who does"

Translate: $\exists x \forall y \forall z \, (F(x, y) \land F(x, z) \land y \ne z \implies \neg F(y, z))$

"x is a person all of whose friends are mutual strangers"

Translate: There is a woman who has flown on every airline in the world

1) Make domain explicit: "There is a woman on *Earth* such that **for every** airline on Earth, there is a flight operated by that airline that she has taken"
2) Translate to nerd speak: "There is a woman such that for every airline on Earth there is a flight operated by said airline such that she has flown on a plane operating that route"
3) Predicates
    - $T(w, p)$ means "w has flown on plane p"
    - $S(f, a)$ means "f is a scheduled flight operated by airline a"
    - $F(p, f)$ means "plane p operates scheduled flight f"
4) $\exists w \forall a \exists f \exists p (S(f, a) \land T(w, p) \land F(p, f))$

## Some good questions

Why is $0^{0}$ undefined?

1) Take $x^{0} = 1$. This is true for all $x \ne 0$ because $x^{i - j} = \dfrac{x^{i}}{x^{j}} = 1$ if $i=j$
2) Take $0^{x} = 0$. This is ture for all $x \ne 0$ because zero times anything is 0
    1) By rule 1, $0^{0} = 1$
    2) By rule 2, $0^{0} = 0$
- Therefore,  $0^{0}$ is undefined

"All elephants in this room are pink"

- $P(e) = \text{"e is pink"}$
- $\forall e \in R \,\, P(e)$ is true
- The statement is false if you can find a non-pink elephant
- The opposite ($\exists e \in R \,\, \neg P(e)$) is false