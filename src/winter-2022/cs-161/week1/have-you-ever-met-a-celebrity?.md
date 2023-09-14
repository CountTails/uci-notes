# Have you ever met a celebrity?

## Defining a celebrity

- Everyone knows who they are
- The celebrity doesn't know who everyone else is

## Checking if a person might be a celebrity

### A brute force approach

1) Select two people $(a ,\, b)$
2) Ask if $a$ knows $b$

> The cost of this method is determined by the number of questions asked

```
for each person q in G - {p}:
    if p knows q then
        return false
    if q doesn't know p then
        return false
return true 
```

> The above procedure can determine if person `p` is famous. Repeating the same logic for each person `p` in the group...

```
for each person p in G
    if p is famous then
        return true
return false
```

- The runtime of this solution is $O(2n(n - 1))$

### Improvement

- What does it mean if $a$ knows $b$?
    - If yes, $a$ is not a celebrity
    - If no, $b$ is not a celebrity
- Let's do this by process of elimination

```
G' := copy of G
while |G'| > 1 do
    pick x, y from G // x and y are arbitrary and distinct
    if x knows y then
        remove x from G' // x not a celeb
    else
        remove y from G' // y not a celeb

p := the remaining element in G'
if p is famous then
    return true
else
    return false
```

## Can multiple celebrities exist in a group?

> A group cannot have two or more celebrities because if $a$ and $b$ are celebrities, then $a$ knows $b$ and $b$ knows $a$.
> However, a celebrity cannot know anyone else in the group.
> Thus, $a$ and $b$ cannot co-exist as celebrities in the same group.