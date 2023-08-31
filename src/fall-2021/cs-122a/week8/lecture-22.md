# Lecture 22

## What is NoSQL?

- **Not** from the DB world
	- Distributed systems folks
	- Also various startup companies
- From caches -> persistent key:value use cases
	- Apps needed massive scale-out
	- OLTP (vs. parallel query DB) applications
	- Simple, low-latency API -- get/put by key
	- Need a key $K$, but want **no schema** for value $V$
	- Record-level atomicity, replica consistency varies
- In the context of this talk, NoSQL will **not** mean
	- Hadoop (or SQL on Hadoop)
	- Graph databases or graph analytics platforms

## JSON-based data

- Data is self-describing (no schema)
- Consists of fields each with an associated value
	- Values can be nested fields
	- Values can be arrays of values or fields
- Foreign keys are not declared, they are simply included

```JSON
{
	"id": "123",
	"Customer": {
		"custName": "Fred",
		"custCity": "LA"
	},
	"total": 25.97,
	"items": [
		{
			"product-sku": 401, // Refers to the Garfield T-Shirt
			"qty": 2,
			"price": 9.99
		},
		{
			"product-sku": 544, // Refers to the USB Charger
			"qty": 1,
			"price": 3.99
		}
	]
}
```

```JSON
{
	"sku": 401,
	"name": "Garfield T-Shirt",
	"listPrice": 9.99,
	"size": "XL"
}

{
	"sky": 544,
	"name": "USB Charger",
	"listPrice": 5.99,
	"power": "115V"
}
```

### Current trends

- *Popular commercial examples*: MongoDB, Couchbase server
- Users today covet the benefits of many DB goodies
	- Secondary indexing and non-key access
	- Declarative queries
	- Aggregates and now (commonly small) joins
- World seems to be heading towards
	- BDMS (think scalable, OLTP-aimed, parallel/distributed DBMS)
	- Declarative queries and query optimization, applied to schema-less data
	- Return of (some, optional) schema information

### Sloppy data

- Consider the following field

```JSON
{
	"rating": "625"
}
```

- The value of the field is a string
- It is clearly a string of digits, so it could probably be a integer
- However, there isn't too much of a point as JSON will not enforce a type restriction for the `rating` field

## SQL++

### Just like SQL

- Queries are written with a familiar syntax
- DB returns an array of JSON objects

```SQL
SELECT name
FROM customers
WHERE rating > 650;
```

- Can refer to multiple documents similar to a join

```SQL
SELECT c.name, o.order_date
FROM customers AS c, orders AS o
WHERE c.custid = o.custid AND c.custid = 'C41';

-- Or with an explict join clause

SELECT c.name, o.order_date
FROM customers AS c LEFT OUTER JOIN orders AS o ON c.custid = o.custid
WHERE c.custid = 'C41';
```

- Many SQL analytic methods are also supported

```SQL
SELECT order_date, count(*) AS cnt
FROM orders
GROUP BY order_date
HAVING count(*) > 0
ORDER BY order_date DESC
LIMIT 3;
```

### Caveats

- Schema laziness is not allowed
- No schema means that attribute existence cannot be inferred

```SQL
SELECT name, order_date
FROM customers, orders
WHERE customers.custid = orders.custid 
	AND rating > 650; -- customers.rating or orders.rating ???
```

```
Cannot resolve ambiguous alias reference for identifier `rating` (in line 4, at column 7)
```

- A prefix is required for all attribute names
- Contrasts with SQL where this is only a recommendation

```SQL
SELECT c.name, o.order_date
FROM customers AS c, orders AS o
WHERE c.custid = o.custid AND c.rating > 650;
```

- Results are not concatenated with joins

```SQL
SELECT *
FROM customers AS c, orders AS o
WHERE c.custid = o.custid AND c.rating > 650;
```

- The result is a nested structure, each containing a customer object, followed by an order object

### Added value

- By default, the DB will give back JSON object with full schema information
- Sometimes, only the values are needed and the schema is of no use, so we can exclude it with the `VALUE` keyword
- Result will simply be an array of strings (names in this case)

```SQL
SELECT VALUE name
FROM customers
WHERE rating > 650;
```

- The `VALUE` keyword allows you to specify a schema of your own
- This customized the structure of the returned data
- Similar to renaming columns in an SQL query

```SQL
SELECT VALUE {
	"CustomerName": c.name,
	"OrderDate": o.order_date
}
FROM customers AS c, orders AS o
WHERE c.custid = o.custid AND rating > 650;
```

- Subqueries can also be specified in the `VALUE` schema

```SQL
SELECT VALUE {
	"CustomerName": c.name,
	"Orders" (SELECT VALUE o.orderno FROM orders AS o WHERE o.custid = c.custid)
}
FROM customers AS c
WHERE c.custid = "C41":
```

### Pitfalls of value

- Aggregates do not work directly on objects

```SQL
SELCT name
FROM customers
WHERE rating = 
	(SELECT MAX(rating) FROM customers);
```

```
Type mismatch: expected value of type multiset or array, but got the value of type object (in line 4, at column 28)
```

- Sometimes, they may lead to unexpected results

```SQL
SELECT c1.name
FROM customers AS c1
WHERE c1.rating = 
	(SELECT MAX(c2.rating) FROM customers AS c2);
```

- The query above would run, but would give an empty result (probably not what is expected)

```SQL
SELECT c1.name
FROM customers AS c1
WHERE c1.rating = 
	(SELECT VALUE MAX(c2.rating) FROM customers AS c2);
```

- Fails because the data types do not match
- Subquery will yield an array with a single value, but it is being compared directly with rating value

```SQL
SELECT VALUE c1.name
FROM customers AS c1
WHERE c1.rating = 
	(SELECT VALUE MAX(c2.rating) FROM customers AS c2)[0];
```

- It is an array, so index into it to retrieve the value