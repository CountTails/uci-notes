# The union find algorithm

## Equivalence relations

- A way to determine whether two objects are equivalent
- Has the following 3 properties
	- Reflexive ($x = x$)
	- Symmetric (if $x = y$ then $y = x$)
	- Transitive (if $x = y$ and $y = z$ then $x = z$)

## Equivalence classes

- Given a collection of objects and equivalence relations, you get back a set of equivalence classes
- These classes have the same properties of equivalence relations
- From an implementation perspective, then, we need three things.
	- A data structure that efficiently represents a set of equivalence classes.
	- An algorithm for efficiently determining whether two objects are in the same equivalence class.
	- An algorithm for efficiently merging two equivalence classes together.
- The *Union-Find algorithm* is a well-known solution to these problems.

## The parent pointer tree

- Each node could tell you its parent, but no node could tell you about any of its children
- Previous tree traversals could not be completed efficiently
- Instead of storing one tree, we'd store a collection of potentially many trees called a *forest*. (Yes, many trees is called a "forest," which makes sense when you think about it.) But we'd store the entire forest in one data structure.
- Every node in one of the trees would represent one object whose equivalence (to the other objects) we want to keep track of.
- We would say that two objects are in the same equivalence class if their nodes are in the same tree.

## Disjoint set forest

- This data structure is sometimes called a _disjoint-set forest_, because it's a collection of trees, each of which represents sets of objects that are disjoint from the other sets; each of those disjoint sets could be seen as a single equivalence class
- The **find** operation, which determines what equivalence class an object is in. We do this by determining the root of its tree, which leads to a simple algorithm for determining if two objects are equivalent
	- Call **find** twice and see if they return the same root; if so, they're in the same equivalence class and, thus, are equivalent.
- The **union** operation, which checks if two nodes are in the same equivalence class; if not, it combines two equivalence classes into a single one, by changing the root of one of the equivalence classes' trees so that its parent is one of the nodes in the other equivalence class' tree

```
find(n):
    if n's parent is -1:
        return n
    else:
        return find(n's parent)
```

```
union(n1, n2):
    root1 = find(n1)
    root2 = find(n2)

    if root1 != root2:
        make root1's parent be root2
```

### Analysis

- Revolves around find
- Start from given node, travel to root
- A node at depth d, find is theta(d) run time
- When working up the tree, remember the root
- Make all subtree nodes parents to root node
- Path compression/compaction
- Weighted union
	- Make the smaller tree the child of the larger one, by number of nodes
- Amortized running time
	- $\theta(\log^{*} n)$ <-iterated logarithm
		- $\log_{2}^{*}65536 = 4$
		- $\log_{2}^{*} 65536 = 16$
		- $\log_{2}^{*} 16 = 4$
		- $\log_{2}^{*} 4 = 2$
		- $\log_{2}^{*} 2 = 1$
	- practically linear