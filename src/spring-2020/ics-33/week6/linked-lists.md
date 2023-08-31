# Linked lists

## What are they?

Here is the trivial class that serves as the basis for all our linked list code. LN stands for List Node: a linked list is a sequence of zero or more list nodes, with each one explicitly referring to the next LN in the list.

```Python
class LN:
    def __init__(self : "LN", value : object, next : "LN or NoneType" = None):
        self.value = value
        self.next  = next
```

In this way we describe LN as a self-referential class: each of its objects refers to another one of its objects (although None will serve to stop this recursive definition from being infinite)

```
  x
+---+    +---+---+    +---+---+    +---+---+    +---+---+    +---+---+
| --+--->| 5 | --+--->| 3 | --+--->| 8 | --+--->| 2 | --+--->| 4 | / |
+---+    +---+---+    +---+---+    +---+---+    +---+---+    +---+---+
```

A reference in the next attribute to the value None is represented symbolically by the symbol `/`.

1) `x` stores a reference to the first LN object
2) `x.value` stores a reference to the int object 5 in this first LN object
3) `x.next` stores a reference to the second LN object
4) `x.next.value` stores a reference to the int object 3 in this second LN object
5) `x.next.next` stores a reference to the third LN object 
6) `x.next.next.value` stores a reference to the int object 8 in this third LN object

## Function that query/access linked lists

The following function computes the sum of all the values in a linked list ll.

```Python
def sum_ll(ll):
	sum = 0
	while ll != None:
		sum += ll.value
		ll = ll.next
	return sum
```

Lots of code that traverses (iterates over) linked lists looks similar. There is no special iterator for LN objects (unless we create one)

We can also define linked lists recursively and use such a definition to help us write functions that recursively process linked lists.

1) None is the smallest linked list: it contains no nodes
2) A list node (LN) whose next refers to a linked list is also linked list

We can recursively compute the sum of linked list by

```Python
def sum_ll_r(ll):
    if ll == None:              # Could also test: type(ll) is NoneType
        return 0
    else:
        return ll.value + sum_ll_r(ll.next)
```

Next lets look at computing a string representation for a list. There is no standard for how linked lists are represented as strings.

In the iterative method, for each node in the list we concatenate its value followed by '->', and concatenate just the value 'None' at the end, before returning.

```Python
def str_ll(ll):
    answer = ''
    while ll != None:
        answer += str(ll.value) + '->'
        ll = ll.next
    return answer + 'None'
```

In the recursive version, we return 'None' as the base-case, concatenating the value and '->' in front of the result returned on each recursive call.

```Python
def str_ll_r(ll):
    if ll == None:
        return 'None'
    else:
        return str(ll.value) + '->' + str_ll_r(ll.next)
```

To find a value in a linked list (returning a reference to the node that contains that value; if the value appears in the list multiple times, it returns a reference to the first node that it is in)

Iteratively, we use ll to traverse the list, looking for avalue: we either find it or "run off the end of the list by reaching None" and return None.

```Python
def find_ll(ll, avalue):
    while ll != None:
        if ll.value == avalue:
            return ll
        ll = ll.next
    return None
```

For the recursive functions, the first uses the simplest base case/non-base case form. If the linked list isn't empty

```Python
def find_ll_r(ll, avalue):
    if ll == None:
        return None
    else:
        if ll.value == avalue:
            return ll
        else:
            return find_ll_r(ll.next, avalue)
```

Here is similar code that copies a linked list: constructs new nodes with the same values, arranged in the same order, for a linked list.

```Python
def copy_ll(ll): 
    if ll == None:
        return None
    front = rear = LN(ll.value)     # next parameter is implicitly None in LN

    while ll.next != None:
        ll = ll.next
        rear.next = LN(ll.value)    # next parameter is implicitly None in LN
        rear = rear.next
    return front
```

As we expect, the recursive version is more elegant, and similar to the other recursive code that processes linked lists.

```Python
def copy_ll_r(ll):
    if ll == None:
        return None
    else:
        return LN(ll.value, copy_ll_r(ll.next))
```

Finally, languages like Java/C++ don't easily support generators. But because Python does, we can easily write a generator that produces all the values in a linked list.

```Python
def iterator(ll):
    while ll != None:
        yield ll.value
        ll = ll.next
```

In fact, we could put a variant of this code in the __iter__ method in the LN class itself

```Python
def __iter__(self):
    current = self
    while current != None:
        yield current.value
        current = current.next
```

## Functions that command/mutate linked lists

We can write the following iterative/recursive functions to append a value at the end of the linked list. In both cases the list is mutated

```Python
def append_ll(ll,value):
    if ll == None:	    # special case for an empty list
        return LN(value)

    front = ll
    while ll.next != None:  # while ll does not refer to the last node...
        ll = ll.next        #   advance: terminates when ll.next == None

    ll.next = LN(value)     # (at end: ll.next == None) put value after end node
    return front            # return reference to original front of ll (still front)
```

The recursive method is again simpler to write.

```Python
def append_ll_r(ll,value):
    if ll == None:
        return LN(value)
    else:
        ll.next = append_ll_r(ll.next,value)
        return ll
```

Here are two simple functions (not iterative or recursive) to mutate a list by adding/removing a value directly after the one referred to by their argument.

```Python
def add_after_ll(ll,value):
    # raises an exception if ll is None; otherwise splice value after ll
    ll.next = LN(value,ll.next)

def remove_after_ll(ll):
    # raises exception if ll (no list) or ll.next (no value to remove) is None
    # excise value after ll
    ll.next = ll.next.next
```

To remove the first value of a linked list, write `x = x.next`