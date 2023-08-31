# Complexity of python operations

## Lists

```
                               Complexity
Operation     | Example      | Class         | Notes
--------------+--------------+---------------+-------------------------------
Index         | l[i]         | O(1)	         |
Store         | l[i] = 0     | O(1)	         |
Length        | len(l)       | O(1)	         |
Append        | l.append(5)  | O(1)	         | mostly: ICS-46 covers details
Pop	          | l.pop()      | O(1)	         | same as l.pop(-1), popping at end
Clear         | l.clear()    | O(1)	         | similar to l = []

Slice         | l[a:b]       | O(b-a)	     | l[1:5]:O(l)/l[:]:O(len(l)-0)=O(N)
Extend        | l.extend(...)| O(len(...))   | depends only on len of extension
Construction  | list(...)    | O(len(...))   | depends on length of ... iterable

check ==, !=  | l1 == l2     | O(N)          |
Insert        | l[a:b] = ... | O(N)	         | 
Delete        | del l[i]     | O(N)	         | depends on i; O(N) in worst case
Containment   | x in/not in l| O(N)	         | linearly searches list 
Copy          | l.copy()     | O(N)	         | Same as l[:] which is O(N)
Remove        | l.remove(...)| O(N)	         | 
Pop	          | l.pop(i)     | O(N)	         | O(N-i): l.pop(0):O(N) (see above)
Extreme value | min(l)/max(l)| O(N)	         | linearly searches list for value
Reverse	      | l.reverse()  | O(N)	         |
Iteration     | for v in l:  | O(N)          | Worst: no return/break in loop

Sort          | l.sort()     | O(N Log N)    | key/reverse mostly doesn't change
Multiply      | k*l          | O(k N)        | 5*l is O(N): len(l)*l is O(N**2)
```

Tuples support all operations that do not mutate the data structure (and they have the same complexity classes)

## Sets

```
                               Complexity
Operation     | Example      | Class         | Notes
--------------+--------------+---------------+-------------------------------
Length        | len(s)       | O(1)	         |
Add           | s.add(5)     | O(1)	         |
Containment   | x in/not in s| O(1)	         | compare to list/tuple - O(N)
Remove        | s.remove(..) | O(1)	         | compare to list/tuple - O(N)
Discard       | s.discard(..)| O(1)	         | 
Pop           | s.pop()      | O(1)	         | popped value "randomly" selected
Clear         | s.clear()    | O(1)	         | similar to s = set()

Construction  | set(...)     | O(len(...))   | depends on length of ... iterable
check ==, !=  | s != t       | O(len(s))     | same as len(t); False in O(1) if
      	      	     	       		       the lengths are different
<=/<          | s <= t       | O(len(s))     | issubset
>=/>          | s >= t       | O(len(t))     | issuperset s <= t == t >= s
Union         | s | t        | O(len(s)+len(t))
Intersection  | s & t        | O(len(s)+len(t))
Difference    | s - t        | O(len(s)+len(t))
Symmetric Diff| s ^ t        | O(len(s)+len(t))

Iteration     | for v in s:  | O(N)          | Worst: no return/break in loop
Copy          | s.copy()     | O(N)	         |
```

### Dictionaries

```
                               Complexity
Operation     | Example      | Class         | Notes
--------------+--------------+---------------+-------------------------------
Index         | d[k]         | O(1)	         |
Store         | d[k] = v     | O(1)	         |
Length        | len(d)       | O(1)	         |
Delete        | del d[k]     | O(1)	         |
get/setdefault| d.get(k)     | O(1)	         |
Pop           | d.pop(k)     | O(1)	         | 
Pop item      | d.popitem()  | O(1)	         | popped item "randomly" selected
Clear         | d.clear()    | O(1)	         | similar to s = {} or = dict()
View          | d.keys()     | O(1)	         | same for d.values()

Construction  | dict(...)    | O(len(...))   | depends # (key,value) 2-tuples

Iteration     | for k in d:  | O(N)          | all forms: keys, values, items
	      	      	       		             | Worst: no return/break in loop
```

## Law of Addition for big-O notation

$$
	O(f(n)) + O(g(n)) is O( f(n) + g(n) )
$$

## Law of Multiplcation for big-O notation

$$
	O(f(n)) * O(g(n)) is O( f(n) * g(n) )
$$

## One Function Specification/3 Implementations and their Analysis

```Python
def is_unique1 (alist : [int]) -> bool:
    for i in range(len(alist)):		# O(N) - for every index; see * below
        if alist[i] in alist[i+1:]:	# O(N) - index+add+slice+in: O(1)+O(1)+O(N)+O(N) = O(N)
            return False		    # O(1) - never executed in worst case; ignore
    return True				        # O(1) - always executed in worst case; use
```

```Python
def is_unique2 (alist : [int]) -> bool:
    copy = list(alist)			    # O(N)
    copy.sort()				        # O(N Log N) - for fast Python sorting
    for i in range(len(alist)-1):	# O(N) - really N-1, but that is O(N); len and - are both O(1)
        if copy[i] == copy[i+1]:	# O(1): +, 2 [i], and  == on ints: all O(1)
            return False		    # O(1) - never executed in worst case
    return True	   			        # O(1) - always executed in worst case
```

```Python
def is_unique3 (alist : [int]) -> bool:
    aset = set(alist)			    # O(N): construct set from alist values
    return len(aset) == len(alist)	# O(1): 2 len (each O(1)) and == ints O(1)
```
