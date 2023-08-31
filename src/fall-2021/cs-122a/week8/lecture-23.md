# Lecture 23

## Nested data

### Nesting

- Subquery results can be *inserted* into overall query results

```SQL
SELECT VALUE {
	"CustomerName": c.name,
	"Orders": (SELECT VALUE o.orderno FROM orders AS o WHERE o.custid = c.custid)
}
FROM customers AS c
WHERE c.custid = "C41";
```

### Unnesting

- Nested data can be hard to read, so we have the option to unnest it

```SQL
SELECT o.orderno, o.order_date, i.itemno AS item_number, i.qty AS quantity
FROM orders AS o UNNEST o.items AS i
WHERE i.qty > 100
ORDER BY o.orderno, item_number;
```

- Order fields will be joined with item fields
- Items will be nested inside orders
- `UNNEST` will flatten the result

## Quantification

> At least one item in the order is over 25 dollars

```SQL
SELECT DISTINCT VALUE o.custid
FROM orders AS o
WHERE SOME i IN o.items SATISFIES i.price >= 25.00;
```

- Equivalent to $\{ \exists_{i} \in \text{items} \, \vert \, \text{i.price} \ge 25.00 \}$

> All items in the order are over 25 dollars

```SQL
SELECT DISTINCT VALUE o.custid
FROM orders AS o
WHERE EVERY i IN o.items SATISFIES i.price >= 25.00;
```

- Equivalent to $\{ \forall_{i} \in \text{items} \, \vert \, \text{i.price} \ge 25.00 \}$
- The statement is true of empty orders as well, the following accounts for empty orders

```SQL
SELECT DISTINCT VALUE o.custid
FROM orders AS o
WHERE EVERY i IN o.items SATISFIES i.price >= 25.00 AND array_count(o.items) > 0
```

## Grouping and aggregation

### SQL grouping and aggregation

- Take all rows and create groups
- Apply the aggregate to each group
- **Happens together**

### SQL++ aggregation only

- A `GROUP BY` clause is **not** required
- All selected attributes are not aggregated, only those in aggregate functions

```SQL
SELECT c.cname, array_count(o.items) AS order_size
FROM customers AS c, orders AS o
WHERE c.custid = o.custid
ORDER BY order_size DESC
LIMIT 3;
```

- This is allowed, because SQL++ has `array_*` equivalents to each aggregate function

### SQL++ grouping only

```SQL
SELECT c.address.city, g
FROM customers AS c, orders AS o
WHERE c.custid = o.custid
GROUP BY c.addres.city GROUP AS g
```

- Have the ability to `SELECT` groups
- `g` will contain `c` and `o` pairs
- Resulting object contains orders that go to a specific city

## Missing information

### Absent checks

- Can explicitly check for missing data

```SQL
SELECT o.orderno, o.order_date, o.ship_date, o.custid
FROM orders o
WHERE o.ship_Date IS MISSING;
```

- Missing values are not included in resulting object

```SQL
SELECT VALUE {
	"orderno": o.orderno,
	"order_date": o.order_date,
	"ship_date": o.ship_date -- not shown in result
	"custid": o.custid
}
FROM orders o
WHERE o.ship_date IS MISSING;
```

- Attributes can also be explicitly checked for
	- `IS UNKNOWM`
	- `IS NULL`

### Case actions

- Can specify a course of action for any of the aforementioned checks

```SQL
SELECT VALUE {
	"orderno": o.orderno,
	"order_date": o.order_date,
	"ship_date":
		CASE
			WHEN o.ship_date IS MISSING THEN "TBD"
			ELSE o.ship_date
		END
	"custid": o.custid
}
FROM orders o
WHERE o.ship_date IS MISSING;
```