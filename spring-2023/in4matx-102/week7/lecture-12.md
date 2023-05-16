# Lecture 12

## SQL

### History

- Data banks since 1950s
- Disks (direct access storage) in 1960s
- How to store and retrieve data from disk
	- Efficiently
	- Cleanly
- Before 1970
	- Hierarchical models (trees)
	- Network models (graphs)
- E. Codd, 1970:
	- Relational model

### The relational model

- Logic deductive system minus deductions
	- Data independence: isolate applications from data representations
	- Data inconsistency
- "Relation" as in mathematics

> Given sets $S_{1},\, S_{2},\, \dots S_{n}: R$ is a relation on these set if and only if $R= \{ \{ e_{1},\, e_{2},\, \dots ,\, e_{n} \}  ,\, \dots \}$ where $e_{i} \in S_{i}$
> $R \subset S_{1} \times S_{2} \times \dots \times S_{n}$. ($R$ is a subset of the cartesian product) 

### Relations

- Each column represents a domain
	- Ordering of columns is important - order of the domains of $R$
- Each row represents an n-tuple of $R$
	- Ordering of rows is immaterial
	- All rows are distinct

#### Relations vs. functions

- Relation $>>$ Function
- Function $=$ relation where each element of the domain corresponds to one element of the range

#### Relations in databases

- Relations define subsets of the domain

> $R \subset S_{1} \times S_{2} \times \dots \times S_{n}$

$$
	\begin{bmatrix}
		supplier & part & project & quantity \\
		1 & 2 & 5 & 17 \\
		1 & 3 & 5 & 23 \\
		2 & 3 & 7 & 9 \\
		2 & 7 & 5 & 4 \\
		4 & 1 & 1 & 12
	\end {bmatrix}
$$

> Supply is a relation (subset) and supplier, part, project, quantity are all subsets of int

- Relations may include repeated domains

$$
	\begin{bmatrix}
		part & part & quantity \\
		1 & 5 & 9 \\
		2 & 5 & 7 \\
		3 & 5 & 2 \\
		2 & 6 & 12 \\
		3 & 6 & 3
	\end{bmatrix}
$$

> part 1 is subpart of part 6 and there needs to be 9 part 1s to make a part 5

### Relationships

- A relationship is an equivalence class of those relations that are equivalent under permutation of domains
- Order not important
- Same domains are distinguished by role names
- User facing model

#### Cross references

- Elements of a relation can cross reference elements of the same (recursive) or another (foreign) relation
- Done via keys

#### Operations on relations

- Permutation: interchanging columns yields converse relations
- Subsetting: selecting only a subset of tuples
- Projection: selecting only a subset of columns
- Join: merging two or more relations without loss of information

### Relational model -> SQL

- Data definition language (DDL)
	- Create/alter/delete tables and their attributes
- Data manipulation language (DML)
	- Query one or more tables
	- Insert/delete/modify tuples in tables

#### Subsetting

```SQL
SELECT *
FROM Product
WHERE category = 'Gadgets'
```

#### Projection + subsetting

```SQL
SELECT Pname, Price, Manugacturer
FROM Product
WHERE Price > 100
```

#### Joins

```SQL
SELECT PName, Price
FROM Product, Company
WHERE Manufacturer = CName AND Count = 'Japan' AND Price <= 200
```

- Implicit joins between `Product` and `Company` tables

#### Full SQL

- Very powerful query language
	- Ordering, grouping, aggregation, rich type system
- Declarative
	- Say **what** you want, not *how* you want it to happen
	- Nothing related to query processing or internal data representations

## Spreadsheets

- One of the most successful software genres
- Centuries old accounting practices...
	- Some cells contain primitive values
	- Some cells contain values derived from formulas
- With computers
	- Automatic update of derived values when primitive values change

### In OOP

- Columns = objects with 2 parts, data and formula
- Formulas =  objects with method `execute`
- Map functions: applies a given function to one or more list of values
	- Check for equivalents in C++ (boost maybe?), C# (select)
	- Not hard to do by hand: iterate
- Homework: no ugly code!
	- Think carefully. Model it nicely. Use the right words. Use ADTs.