# Lecture 21

## List methods

### Adding elements

| Method | Explanation |
| ---- | ---- |
| `list.append(x)` | Add `x` to the end of the lsit |
| `list.exend(x)` | Add all elements in `x` to the end of the list |
| `list.insert(i, x)` | Add `x` into the list *before* index `i` |

### Removing elements

| Method | Explanation |
| ---- | ---- |
| `list.remove(x)` | Remove first item with value `x` from the list |
| `list.pop()` | Remove *and* return last element in the list |
| `list.pop(i)` | Remove *and* return item at position `i` |

### Modifying elements

| Method | Explanation | 
| ---- | ---- |
| `list.sort()` | Sort the items of the list in-place |
| `list.reverse()` | Reverse elements of the list in-place |

A complete list of all list methods can be found [here](https://www.w3schools.com/python/python_ref_list.asp)

## Iterating over a list

```python
for my_var in my_list:
	pass #Loop body goes here
```

