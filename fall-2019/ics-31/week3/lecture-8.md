# Lecture 8

## Dictionary basics

### Parallel lists

Let's say we are ant-watching and we want to keep track of the number of each type we've seen

One approach is to use parallel lists. The elements `kinds[i]` corresponds with `counts[i]`

```python
kinds = ['picnic', 'fire', 'carpenter', 'garden']
counts = [1, 5, 2, 11]
```

However, there are several issues

- Have to maintain integrity between both lists
- Have to ensure access and edits to elements are correct
- Require a complete search to verify membership

### Dictionaries

```python
ant_dict = {
			'picnic': 1,
			'fire': 5,
			'carpenter': 2,
			'garden': 1
}
```

Using dictionaries address the following

- Only one data structure to maintain integrity of
- Membership can be verified without a complete search


### Working with dictionaries

Keys must be **immutable** and **unique**

Values can be immutable or mutable and do not have to be unique

Use `d[k]` to obtain the value associated with key `k` of dictionary `d`

If `k` does not exists, this causes an error

### Keys, values and items

`d.keys()` returns a dictionary's keys

`d.values()` returns a dictionary's values

`d.items()` returns a dictionary's key-value pairs as tuples

The objects returns are similar to list, but are not lists. They must manually be converted into a list `list(d.keys())`

### Visualizing a dictionary

```python
ant_dict = {
			'picnic': 1,
			'fire': 5,
			'carpenter': 2,
			'garden': 1
}
```

| key | 'picnic' | 'fire' | 'carpenter' | 'garden' |
| --- | ---- | --- | --- | --- |
| value | 1 | 5 | 2 | 1 |

