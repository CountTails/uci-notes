# N-ary relations

## Relations with more than two sets

- Given sets $A_{1},\ A_{2},\ \dots,\ A_{n}$ (domains) where $n$ is the degree of relation $R$
- $R \subseteq A_{1} \times A_{2} \times \dots \times A_{n}$ 
- Examples
    - Let $n = 3$, $\mathbb{N}^{3}$, $\{ (a, b, c) \ \vert \ a < b < c \}$
    - (Airline, Flight, Source, Destination, Time of departure) is a 5-ary relation

## Relational databases

- Stores n-ary relations
- Tables store attributes for an n-ary relation $R$
- Primary keys are designed to be unique for each entry
- Composite keys are a combo of attributes that (hopefully) gives a unique identifier
- Projection of n-ary relations
    1) Choose a subset of attributes
    2) Eliminate all other attributes
    3) Reduce dimensions