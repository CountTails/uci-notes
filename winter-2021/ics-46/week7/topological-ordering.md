# Topological ordering

- A sequence of vertices in which every vertex appears exactly once. If an edge $v \to w$ exists, $v$ appears before $w$

```
FindTopologicalOrdering(DAG g):  
    while g is not empty:  
        let v be a vertex in g with in-degree zero  
        visit(v)  
        remove from the graph, along with all of its outgoing edges
```

- Time and space is equivalent to a depth-first traversal