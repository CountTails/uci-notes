# Shortest paths

## The problem

- Positively weighted single source shortest path problem
- All edges have a positive cost
- Start in one place
- Find all shortest paths to every other node

## Dijkstra's algorithm

- Specific to positive-weighted single source shortest path problem
- Tracks 3 things
	- `k`: mapping of whether a shortest path is known. Initially all set to `false`
	- `d`: mapping of distances from the starting node to other nodes. Starting node has distance `0`, the rest have `-infinity`
	- `p`: mapping of the vertex that comes before. Starting vertex has no predecessor
- For each vertex which the shortest path is not known
	- Mark `k` for that vertex as `true`
	- If a cheaper path is found, update `d`
	- Record the predecessor `p`

```
for each vertex v
    {
        set kv to false
        set pv to unknown (or none, if v is the start vertex)
        set dv to ∞ (or 0, if v is the start vertex)
    }

    let pq be an empty priority queue
    enqueue the start vertex into pq with priority 0
    
    while (pq is not empty)
    {
        vertex v = the vertex in pq with the smallest priority
        dequeue the smallest-priority vertex from pq
        
        if (kv is false)
        {
            kv = true

            for each vertex w such that edge v → w exists
            {
                if (dw > dv + C(v, w))
                {
                    dw = dv + C(v, w)
                    pw = v
                    enqueue w into pq with priority dw
                }
            }
        }
    }
```