# Lecture 14

## More on aggregates

> For each red boat, find the number of reservations for this boat

```SQL
SELECT B.bid, COUNT(*) AS scount
FROM Sailors S, Boats B, Reserves R
WHERE S.sid = R.sid AND R.bid = B.bid AND B.color = 'red'
GROUP BY B.bid
```

- If grouping by a key, the `SELECT` clause can include any other column from the table
- To get names and colors, they must be added to the `GROUP BY` clause

> Find age of the youngest sailor with age $>$ 18 for each rating with at least 2 sailors (of **any** age)

```SQL
SELECT S.rating, MIN(S.age)
FROM Sailors S
WHERE S.age > 18
GROUP BY S.rating
HAVING 1 < (
	SELECT COUNT(*)
	FROM Sailors S2
	WHERE S.rating = S2.rating
)
```

- Shows the `HAVING` clause can also contain a subquery
- Compare this with the query we considered only ratings with 2 or more sailors *at least 18*

> Find the ratings and average ages for which the average Sailor age is the minimum age over **all** of the sailors

- Aggregates themselves **cannot** be nested, the following query is illegal

```SQL
SELECT S.rating
FROM Sailors S
WHERE S.age = (SELECT MIN(AVG(S2.age)) FROM Sailors S2)
```

- Instead, we would have to compute the average age for *each* rating and then find the *overall* minimum age

```SQL
SELECT Temp.rating, Temp.average
FROM (
	SELECT S.rating, AVG(S.age) AS avgage
	FROM Sailors S
	GROUP BY S.rating
	) AS Temp
WHERE Temp.avgage = (SELECT MIN(age) FROM Sailors)
```

### Aside: SQL's `WITH` clause

- The previous solution utilizes a subquery in the `FROM` clause which can be difficult to read
- We could use a `WITH` clause here for clarity

```SQL
WITH Temp AS (
	SELECT S.rating, AVG(S.age) AS avgage
	FROM Sailors S
	GROUP BY S.rating
);

SELECT Temp.rating Temp.avgage
FROM Temp
WHERE Temp.avgage > (SELECT AVG(age) FROM Sailors);
```

## Nulls in SQL

- Field values in a tuple are sometimes *unknown* or *inapplicable*
- SQL provides the special value `NULL` for such situations
- The presence of `NULL` complicates many issues
	- Special operators needed to check if value is/is not `NULL`
	- Is `rating > 8` true or false when *rating* is equal `NULL`
	- What about `AND`, `OR`, and `NOT` connectives
	- Meaning of constructs must be defined carefully. (The `WHERE` clause eliminates rows that don't evaluate to *true*)
	- New operators (in particular, *outer joins*) possible/needed

### Nulls and SQL's 3 valued logic

| `AND` | true | false | unknown |
|:---:|:----:|:-----:|:-------:|
| true | true | false | unknown |
| false | false | false | false |
| unknown | unknown | false | unknown |

| `OR` | true | false | unknown |
|:---:|:---:|:-----:|:-------:|
| true | true | true | true
| false | true | false | unknown |
| unknown | true | unknown | unknown |

| `NOT` | bool |
|:---:|:----:|
| true | false |
| false | true |
| unknown | unknown |

- Can think of short-circuit evaluations to deal with unknowns
- SQL arithmetic involving `NULL` values will yield `NULL`

### Queries with `NULL`s

```SQL
SELECT *
FROM Sailors S
WHERE age > 35.0;

SELECT *
FROM Sailors S
WHERE age <= 35.0;
```

- The queries above would **NOT** include sailors where `S.age = IS NULL`
- Misleadingly does not obtain the entire stored relation

```SQL
SELECT COUNT(*)
FROM Sailors S
WHERE age > 35.0 OR age <= 35.0 OR age IS NULL;
```

- This query will include **all** sailors in the stored relation