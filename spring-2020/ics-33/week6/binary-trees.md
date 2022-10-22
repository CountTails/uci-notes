# Binary (Search) Trees

## What are they?

Binary search trees have structure and order property. Its **STRUCTURE PROPERTY** dictates that every PARENT node has 0, 1, or 2 *CHILDREN* nodes. Its **ORDER PROPERTY** dictates that all values in the left subtree of any node are *LESS THAN* that node, and all values in the right subtree of any node are *GREATER THAN* that node.

Given the ORDER PROPERTY, you might think that the shape of a binary search tree is **UNIQUELY DETERMINED** by the values that it contains. **THIS IS NOT SO.** For a tree of 4 nodes, there are 14 different shapes the tree could have.

## Metrics

### Size 

Size counts the number of nodes in a tree (therefore it is similar to length for linked lists). It is easy to compute size recursively

```Python
def size(atree):
    if atree == None:
        return 0
    else:
        return 1 + size(atree.left) + size(atree.right)
```

To achieve this iteratively, it is a little trickier

```Python
def size_i(atree)
    nodes = []
    size = 0
    nodes.append(atree)
    while len(nodes) > 0:
        next = nodes.pop(0)
        if next != None:
            size += 1
            nodes.append(next.left)
            nodes.append(next.right)
    return size
```

### Height

Height is the number of steps needed to get from that node to the deepest leaf in either of the node's subtrees. So the height of a leaf (the base case) is 0 and the height of a tree is the height of its root node.

```Python
def height(atree)
   if atree.left == None and atree.right == None:   # leaf check as base case
       return 0
   elif atree.right == None:			    # only a left subtree
       return 1 + height(atree.left)		    #   recur only to left
   elif atree.left == None:			    # only a right subtree
       return 1 + height(atree.right)		    #   recur only to right
   else:				            # both a left/right subtree
       return 1 + max(height(atree.left),height(atree.right)) # recur on both
```

While this code deals with all necessary cases, its base cases are more complicated than they need to be. If we choose the the empty tree to be the base case, we can define the height of an empty tree to be -1

```Python
def height(atree):
    if atree == None:
        return -1
    else:
        return 1 + max( height(atree.left), height(atree.right) )
```

## List representation of a tree

The following tree

```
         5
       /   \
      3     8
           / 
          6
```

Can be represented by the list `[5, [3, None, None], [8, [6, None, None], None]]`

There are simple recursive functions to translate a tree argument returning a
list, and a list argument returning a tree.

```Python
def list_to_tree(alist : list) -> TN:
    if alist == None:
        return None
    else:
        return TN( alist[0], list_to_tree(alist[1]), list_to_tree(alist[2]) )

def tree_to_list(atree : TN) -> list:
    if atree == None:
        return None
    else:
        return [atree.value, tree_to_list(atree.left), tree_to_list(atree.right)]
```

## Printing a binary tree

The following function prints a tree rotated 90 degree counter-clockwise. So the following tree

```
             30
          /      \
       15          50
    /     \      /    \
  10       25  35      70 
         /
       20
```

would print as

```
....70
..50
....35
30
....25
......20
..15
....10
```

```Python
def print_tree(atree,indent_char =' ',indent_delta=2):
    def print_tree_1(indent,atree):
        if atree == None:
            return None     # print nothing
        else:
            print_tree_1(indent+indent_delta, atree.right)
            print(indent*indent_char+str(atree.value))
            print_tree_1(indent+indent_delta, atree.left)
    print_tree_1(0,atree)
```

## Searching a binary search tree

We can use the following iterative function to search for a value; unlike the other functions written above, this one goes only one way (left or right) for each tree node.

```Python
def search_i(atree,value):
    while atree != None and atree.value != value:    # Short-circutit evaluation
        if value < atree.value
           atree = atree.left
        else:
           atree = atree.right
    return atree  # either None or the TN storing value
```

This can also be done recursively

```Python
def search_r(atree,value):
    if atree == None:
        return None
    else:
        if value == atree.value:
            return atree
        elif value < atree.value:
            return search_r(atree.left,value)
        else: # value > atree.value # true by law of trichotomy: ==, <, or >
            return search_r(atree.right,value)
```

## Adding/removing from a binary search tree

### Add

```Python
def add(atree,value):
    if atree == None:
        return TN(value)
    elif value == atree.value:
        return atree                   # already in tree; do not change the tree
    else:
        if value < atree.value:
            atree.left = add(atree.left,value)
          else: # value > atree.value: # true by law of trichotomy: ==, <, or >
            atree.right = add(atree.right,value)
        return atree
```

In all cases, this function returns a reference to a tree to which a TN with value has been added as a subtree. It is similar to the recursive append function for linked lists

### Remove

Deferred for now, but implements the following process

1) To remove a leaf node, make its parent refer to `None`
2) To remove a node with a child, make its parent refer to its child
3) To remove a node with two children
	1) Find the biggest node less than it
	2) Remove that node via rule 1 or 2
	3) Take its value and put it as the value of the node being removed

### Copy

```Python
def copy(atree):
    if atree == None:
        return None
    else:
        return TN(atree.value, copy(atree.left), copy(atree.right))
```

### Equality

```Python
def equal(t1,t2):
    if t1 == None or t2 == None:
        return t1 == None and t2 == None
    else:
        return t1.value == t2.value and equal(t1.left,t2.left) and equal(t1.right,t2.right)
```

## Expression trees

We can also use binary trees to represent mathematical formulas/expressions. Consider the quadratic formula

$$
	x = \dfrac{-b \pm \sqrt{b^{2}-4ac}}{2a}
$$

It can be represented by the following binary tree

```
                       '/'
            /                    \
           +                      *
      /         \                /  \
     -          sqrt            2    a
      \           \
       b           -
                /      \
               **       *
              /  \     / \ 
             b    2   *   c
                     / \
                    4   a
```

The structure of the tree determines how the subexpressions are computed. There is no need for operator precedence rules or parentheses

Once we have such a tree, we can perform many operations on it. The first and
most important is evaluating the tree, which can be done recursively as follows

1) Evaluate the leaves as themselves
2) Evaluate unary operators or unary functions
3) Evaluate binary operators

```Python
def evaluate(etree):
    #name/literal as leaf node
    if etree.left == None and etree.right == None:
        return eval(str(etree.value))

    #unary operator/function cal
    elif etree.left == None:
        if etree.value in {'+','-'}:
            #unary operator
            return eval(etree.value + str(evaluate(etree.right)))
        else:
            #function call: assume legal name
            return eval(etree.value+'('+str(evaluate(etree.right))+')')
    else:
        #binary operator: assume etree.value in {'+','-','*','/','//','**'}

        return eval(str(evaluate(etree.left)) + etree.value + str(evaluate(etree.right)))
```


