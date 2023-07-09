# Graph traversals

## Depth-first 

### Naive implementation

```
DFT(Graph g):
	startVertex := any vertex in g
	DFTr(g, startVertex)

DFTr(Graph g, Vertex v):
	visit(v)
	for each vertex s.t. an edge v -> w exists:
		DFTr(g, w)
```

### Problems with the naive implementation

- May visit some vertices more than once
- May get stuck in a cycle (infinite recursion)

### A better implementation

```
DFT(Graph g):
	for each vertex v in g:
		v.visited = false

	startVertex := any vertex in g
	DFTr(g, startVertex)

DFTr(Graph g, Vertex v):
	visit(v)
	v.visited = true

	for each vertex w s.t. an edge v -> w exists:
		if not w.visited:
			DFTr(g, w)
```

### Problems with the better implementation

- No explicit vertex to start at
- May not visit some vertices
- Could solve the issue by trying again

### Even better implementation

```
DFT(Graph g):
	for each vertex v in g:
		v.visited = false

	for each vertex v in g:
		if not v.visited:
			DFTr(g, v)

DFTr(Graph g, Vertex v):
	visit(v)
	v.visited = true

	for each vertex w s.t. an edge v -> w exists:
		if not w.visited:
			DFTr(g, w)
```

### Analysis 

- Time
	- Marking all vertices as not visited: $\theta(v)$
	- Deciding to make recursive calls: $\theta(v)$
	- Marking vertices as visited: $\theta(v)$
	- Enumerating all edges
		- $\theta(v^{2})$ for adjacency matrix
		- $\theta(v + e)$ for adjacency list
- Memory
	- Storing visit flags: $\theta(v)$
	- Tracking recursive calls: $O(v)$

### Application

- Visit things in a depth-first order
- Basis for cycle detection
	- Keep track of current path
	- When visiting add to current path
	- When backtracking remove from current path
	- If edge leads to a vertex on current path, a cycle was found

## Breadth-first

### Implementation

```
BFT(Graph g, Vertex startVertex):
	for each vertex v in g:
		v.visited = false

	q := Queue()
	q.enqueue(startVertex)

	while not q.isEmpty():
		v = q.dequeue()
		visit(v)
		v.visited = true

		for each vertex w s.t. edge v -> w exists:
			if not w.visited and not q.contains(w):
				q.enqueue(w)
```

### Analysis

- Time
	- Mark all not visited: $O(v)$
	- Dequeue and visiting: $O(v)$
	- Enumerating all edges
		- $O(v^{2})$ for an adjacency matrix
		- $O(v + e)$ for an adjacency list
	- Enqueue not visited: $O(v)$
- Memory
	- Visited flags: $\theta(v)$
	- Queue: $O(v)$