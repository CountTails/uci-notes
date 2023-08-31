# Lecture 11

## Tuple relational calculus

### Formulas

- Atomic formulas
	- $r \in R$ or $r \notin R$ or $r.a \text{ op } s.b$ or  $r.a \text{ op } c$
	- *op* is one of $< ,\, >,\, \le,\, \ge,\, \ne,\, =$
- Formula
	- An atomic formula or 
	- $\neg P$ or $P \land Q$ or $P \lor Q$ where $P$ and $Q$ are formulas
	- $\exists_{r} \in R \, (P(r))$ where variable $r$ is *free* in $P(\dots)$
	- $\forall_{r} \in R \, (P(r))$ where variable $r$ is *free* in $P(\dots)$
	- $P \implies Q$

### Free and bound variables

- The use of a *quantifier* in a formula is said to **bind** a variable
- A variable that is not bounded is **free**

## Queries

```SQL
CREATE TABLE Sailors (
	sid INTEGER,
	sname VARCHAR,
	rating INTEGER,
	age INTEGER
);

CREATE TABLE Reserves (
	sid INTEGER,
	bid INTEGER,
	date DATE
);

CREATE TABLE Boats (
	bid INTEGER,
	bname VARCHAR,
	color VARCHAR
)
```

> Find sailors with a rating above 7

$$
	\{ s \, \vert \, s \in Sailors \land s.rating > 7 \}
$$

> Find IDs of sailors who are older than 30.0 or who have a rating under 8 and are named "Horatio"

$$
	\{ t(sid) \, \vert \, \exists_{s} \in Sailors ((s.age > 30.0 \lor (s.rating > 8 \land s.sname = 'Horatio')) \land t.sid = s.sid) \}
$$

- The result schema and values are specified
- Use of boolean formula to specify the query constraints
- Highly **declarative** nature

> Find names of sailors who've reserved a **red** boat

$$
	\{ t(sname) \, \vert \, \exists_{s} \in Sailors (t.sname = s.sname \land \exists_{r} \in Reserves (r.sid = s.sid \land \exists_{b} \in Boats (b.bid = r.bid \land b.color = 'red'))) \}
$$

- **Joins** appear here as value-matching predicates

> Find IDs of sailors who've reserved a **red** boat *and* a **green** boat

$$
	\{ t(sid) \, \vert \, \exists_{s} \in Sailors (t.sid = s.sid \land \exists_{r1} \in Reserves (r1.sid = s.sid \land \exists_{b1} \in Boats (b1.sid = r1.sid \land b1.color = 'red')) \land \exists_{r2} \in Reserves (r2.sid = s.sid \land \exists_{b2} \in Boats (b2.sid = r2.bid \land b2.color = 'green'))) \}
$$

- Several more variable are required
- Think of tuple variables as "fingers" pointing through table rows

> Find names of sailors who've reserved **all** boats

$$
	\{ t(sname) \, \vert \, \exists_{s} \in Sailors (t.sname = s.sname \land \forall_{b} \in Boats (\exists_{r} \in Reserves (r.sid = s.sid \land b.bid = r.bid))) \}
$$

- Universal quantification addresses the **all** query use case
- "For **all** boats $b$, sailors $s$ has a reservation $r$ for it"

> Find the names of sailors who've reserved all **Interlake** boats

$$
	\{ t(sname) \, \vert \, \exists_{s} \in Sailors (t.sname = s.sname \land \forall_{b} \in Boats (b.bname = 'Interlake') \implies(\exists_{r} \in Reserves (r.sid = s.sid \land b.bid = r.bid))) \}
$$

- "For all boats $b$, if $b$ is an 'Interlake' then sailor $s$ has a reservation $r$ for it"

### Unsafe queries and expressive power

- It is possible to write syntactically correct calculus queries that have an **infinite** number of answer
- It is known that *every* query that can be expressed in relational algebra can be expressed as a *safe* query in tuple relational calculus; the converse is also true
- *Relational completeness*: query languages that can express every query that is expressible in the relational algebra / (safe) calculus

