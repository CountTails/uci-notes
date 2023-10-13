# Network models

## Random graphs

- Generate a graph with $n$ nodes
- Every pair of nodes is connected independently with probability $p$
- The average degree is the new graph: $d = (n - 1)p$

### Naïve generation

1) Begin with $n$ isolated vertices without any edges
2) Consider unordered vertex pairs $\{ v, w \}$ according to some ordering
3) Randomly generate a bit, $b$ that is 1 with probability $p$
4) If $b = 1$, then add the edge $(v, w)$ to the graph

- This is likely randomly populating the cells in a adjacency matrix
- As such, the running time of this algorithm is $O(n^{2})$

### Better generation

- The above algorithm for generating `G(n, p)` is slow if $p$ is small
- The probability of having $k-1$ 0's and then a 1 is $(1 - p)^{k - 1}p$
- Waiting times are geometrically distributed
- We can divide the interval $[0, 1)$ according to the waiting times
- Pick $r$ uniformly at random from the interval $[0, 1)$
- The subinterval in which $r$ falls will sample a waiting time
- If we use this to skip streaks of 0's the running time is reduced to $O(n + m)$

```
define G(n, p):
    E := {}
    v := 1
    w := -1
    while v < n do
        r := random()
        w := w + 1 + floor(log(1 - r) / log(1 - p))
        while w >= v and v < n do
            w := w - v
            v := v + 1
        if v < n then
            E := E.union({v, w})

    return E
```

### Threshold phenomena

> As $n$ becomes large
>     - If $p < \frac{1}{n}$, the probability of a giant component goes to 0
>     - If $p > \frac{1}{n}$, the probability of a giant component goes to 1 *and* all other components will have a size at most $\log(n)$

- At edge density $p$, the expected degree is $p(n - 1)$
- So at $p \to \frac{1}{n}$, the average degree is 1, implying an incredibly sparse graph
- The model explains giant components in real-world networks
- General tipping point at edge density $q$
    - If $p < q$, probability of a property goes to 0 as $n$ becomes large
    - If $p > q$, probability of a property goes to 1as $n$ becomes large

### Shortcomings

- Degree distribution is not heavy-tailed
- The clustering coefficient is *exactly* $p$

## Rich get richer processes

- Processes in which the more someone has of something, the more likely they are to get more of it
- Such processes will *amplify* inequity
- If you have an amount $x$ of something, the probability you get more is proportional to $x$
- This generally leads to heavy-tailed distributions

### Preferential attachment

1) Start with two vertices connected by an edge
2) At each step, add one *new* vertex $v$ with one edge back to *previous* vertices
3) Probability a previously added vertex $u$ receives the new edge from $v$ is **proportional to the current degree** of $u$, or more precisely

$$
    P(\text{u gets the edge}) = \frac{\deg{u}}{\sum \limits_{v \in V} \deg{v}}
$$

- Vertices with a high degree are more likely to *get even more* links
- Generates a power law distribution of degrees

### Barabasi-Albert model

- Start with some initial graph $G_{0}$ and some $d$ to be the number of edges per new node
- Each new node connects to $d$ other nodes, selecting them with probability proportional to their degree
- If $[d_{1} \dots d_{t}]$ is the degree sequence at time $t$, the node $t + 1$ links to node $i$ with probability $\frac{d_{i}}{\sum_{i} d_{i}}$
- This guarantees a degeneracy of $d$

### Implementation

```
define preferentialAttachment(n, d):
    G := ({0, ..., n-1}, E)
    M := [0 for 0...2*n*d]
    for v=0...n-1 do
        for i=0...d-1 do
            M[2*(v*d + i)] := v
            r := random(0, 2*(v*d + i))
            M[2*(v*d + i) + 1] := M[r]
    E := {}
    for i=0...n*d - 1 do
        E := E.union({M[2*i], M[2*i + 1]})

    return G
```

- This algorithm has a runtime of $O(nd)$
- It should result in a power law degree distribution with exponent $c = -3$