# Graph connectedness

## Undirected graphs

> We say that 2 vertices, $v$ and $w$, in an undirected graph are connected if there exists a path containing $v$ and $w$

- An undirected graph is connected if *every* pair of vertices are connected

### Connected components

- Subsets of the graph that are connected
- Components are not connected to each other

### Connection detection algorithms

- To check if a graph is connected

```
IsConnected(UndirectedGraph g):
	startVertex := any vertex in g
	visitedCount := 0

	DFTr(g, startVertes) // adds one to visitedCount
	return visitedCount == number of vertices in g
```

- To find connected components

```
FindConnectedComponents(UndirectedGraph g):
	for each vertex v in g:
		v.visited = false

	componentNumber = 0
	for each vertex v in g:
		if not v.visited:
			componentNumber++
			DFTr(g, v)
```

- Analysis of `IsConnected`
	- This algorithm is a depth-first traversal
	- $O(v^{2})$ time for adjacency matrix
	- $O(v + e)$ time for adjacency list
	- Memory: $\theta(v)$
- Analysis of `FindConnectedComponents`
	- This algorithm is a *full* depth-first traversal
	- $O(v^{2})$ time for adjacency matrix
	- $O(v + e)$ time for adjacency list
	- Memory: $\theta(v)$

## Directed graphs

### Strongly connected

- Any two vertices have a round trip path
- Can reach every other vertex for any given vertex

```
IsStronglyConnected(DirectedGraph g):
	for vertex v in g:
		DFTr(g, v)
		if not all vertices in g were visited:
			return false
	return true
```

- $O(v^{3})$ time for adjacency matrix
- $O(v^{2} + ve)$ time for adjacency list
- Memory: can be handled one DFTr at a time

### Weakly connected

- Remove directionality of edges and self edges
- If the resulting undirected graph is connected, the directed graph is weakly connected

```
IsWeaklyConnected(DirectedGraph g):
	Construct the underlying undirected graph
	Test the copied graph for connectedness
```

- $O(v^{2})$ time for adjacency matrix
- $\theta(v + e)$ time for adjacency list
