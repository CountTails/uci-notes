# Lecture 8

## More normal forms

### Second normal form (2NF)

> Relation $R$ is in 2NF if it is in first normal form *AND* no non-prime attribute is *partially* dependent on a candidate key or $R$

```SQL
CREATE TABLE Supplies (
	sno INTEGER,
	sname VARCHAR,
	saddr VARCHAR,
	pno INTEGER,
	pname VARCHAR,
	pcolor VARCHAR
)
```

- Functional dependencies
	- `sno` -> `sname`
	- `sno` -> `saddr`
	- `pno` -> `pname`
	- `pno` -> `pcolor`
- Candidate keys: `(sno, pno)`
- Prime attributes
	- `sno`
	- `pno`
- 2NF? No, each of the functional dependencies in *partially* dependent on a candidate key

### Third normal form (3NF)

> Relation $R$ is in 3NF if it is in 2NF *AND* and it has no *transitive* dependencies to non-prime attributes

> Relation $R$ with functional dependencies $F$ is in 3NF if, for all $X \to A$ in $F+$
> 	- $A \in X$ is trivial
> 	- $X$ is a superkey for $R$
> 	- $A$ is part of some key for $R$ (it's a prime attribute)

```SQL
CREATE TABLE Workers (
	eno INTEGER,
	ename VARCHAR,
	esal REAL,
	dno INTEGER,
	dname VARCHAR,
	dfloor INTEGER
)
```

- Functional dependencies
	- `eno` -> `ename`
	- `eno` -> `esal`
	- `eno` -> `dno`
	- `dno` -> `dname`
	- `dno` -> `dfloor`
- Candidate keys: `(eno)`
- Prime attributes: `(eno)`
- 3NF?
	- Can infer `eno` -> `dname` and `eno` -> `dfloor`
	- Each violates violate the 3NF conditions
- If $R$ is in 3NF, some redundancy is possible. It is often a good compromise when BCNF is not achievable

### Boyce-codd normal form (BCNF)

> Relation $R$ with functional dependencies $F$ is in BCNF if, for all $X \to A$ in $F+$
> 	- $A \in X$ is a trivial functional dependencies
> 	- $X$ is a superkey for $R$
> In other words, $R$ is in BCNF if the *only* non-trivial functional dependencies that hold over $R$ are **key constraints**

```SQL
CREATE TABLE Supply2 (
	sno INTEGER,
	sname VARCHAR,
	pno INTEGER
)
```

- Given functional dependencies
	- `sno` -> `sname`
	- `sname` -> `sno`
- Candidate keys: `(sno, sname)` and `(sname, sno)`
- Prime attributes
	- `sno`
	- `sname`
	- `pno`
- 3NF? Yes
- BCNF? No, each functional dependency has a LHS that isn't a candidate key

## Achieving normal forms

### Decomposition of a relation schema

- Suppose a relation $R$ contains attributes $A_{1} ,\, \dots ,\, A_{n}$. A decomposition of $R$ consists of *replacing* $R$ by two or more relations such that
	- Each new relation contains a subset of the attributes of $R$ (and no attributes that did not appear in $R$)
	- Every attribute of $R$ appears as an attribute of at least one of the new relations
- Intuitively, decomposing $R$ means we will store instances of the relations that result from our decomposition **instead** of storing instances of $R$

### Decomposition: possible issues

1) Some queries may become more expensive
2) Given instances of the decomposed relations, we may **not** be able to reconstruct the corresponding instance of the original relation ("lossy")
3) Checking some dependencies may require joining the instances of the decomposed relations

> Tradeoff: consider these issues vs. tolerating the redundancy

### Lossy join decompositions

- Decomposition of $R$ into $X$ and $Y$ is *lossless-join* with respect to a set of functional dependencies if, for every instance $r$ that satisfies $F$
	- $\pi_{x} (r) \bowtie \pi_{y} (r) = r$
- It is always true that $r \subset \pi_{x} (r) \bowtie \pi_{y} (r)$
	- In general, the other direction does not hold, but if it does, then the decomposition is called **lossless-join**
	- Must ensure that relations $X$ and $Y$ *overlap* and the overlap contains a key for **one** of the two relations
- The definition extends to decomposition into three or more relations as you would expect

### Dependency preserving decomposition

- Consider `CSJDPQV`, $C$ is the key, $JP \to C$ and $SD \to P$
	- BCNF decomposition: two tables `CSJDQV` and `SDP`
	- **Problem**: checking $JP \to C$ now requires a join
- *Dependency preserving decomposition*: if $R$ is decomposed into $X$, $Y$, and $Z$, and we enforce the functional dependencies that hold on $X$, on $Y$, and on $Z$, then all functional dependencies that were given to hold on $R$ must also hold
- *Projection of set of functional dependencies $F$*: if $R$ is decomposed into $X$, ... projection of $F$ into $X$ (denoted $F_{x}$) is the set of functional dependencies $U \to V$ in $F^{+}$ (closure of $F$) where $U$, $V$ are *both* in $X$
- The decomposition of $R$ into two tables $X$ and $Y$ is *dependency preserving* if $(F_{x} \cup F_{y})^{+} = F^{+}$
- Dependency preserving **does not** imply lossless join

## Decomposing a design to BCNF

### Method

- Consider a relation $R$ with functional dependencies $F$. If $X \to Y$ violates BCNF, decompose $R$ into $R - Y$ and $XY$
- Repeated application of this idea will yield a collection of relations that are
	- BNCF
	- A lossless join decomposition (but **not** dependency preserving)
	- A finite size
- In general, *several* dependencies man violate BCNF
	- The order we process dependencies can lead to different decompositions
	- Some of which may be dependency preserving

### BCNF and dependency preservation

- In general, there simply may **not be** a dependency preserving decomposition into BCNF
- Consider again decomposing the relation `CSJDPQV` into the relations `SDP`, `JS` and `CJDQV`
	- *Not* dependency preserving
	- *Is* a lossless join decomposition
	- In this case, *adding* relation `JPC` to the collection of relations would give us a dependency preserving decomposition

### Decomposing 3NF

- The lossless join decomposition algorithm for BCNF can also be used to obtain a lossless join decomposition into 3NF
- One idea to ensure dependency preservation
	- If $X \to Y$ is not preserved in the resulting BCNF, add a relation $XY$
	- Problem is that $XY$ may violate 3NF (even 2NF) due to other functional dependencies
- Real fix: use a *minimal cover* for $F$ to synthesis a decomposed schema