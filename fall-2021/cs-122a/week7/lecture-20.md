# Lecture 20

## B+ tree implementation details

### Order

- The (mythical) order $d$ concept replaced by physical space criterion in practice
- Index pages can typically hold many more entries than leaf pages
- Variable sized records and search keys means that different nodes will contain different numbers of entries
- Even with fixed length fields, multiple records with the same search key value can lead to variable sized data entries in the tree's leaf pages

### Page implementation

A B+ tree page contains

- Control info (level, number of children, free space offset)
- Search key array (with possible on-page direction for variable length data, using offsets), or a key/data array
- Child pointer array, where pointer = page ID on disk

## Hash based indexes

- *Hash-based* indexes are fast for **equality selections**, but cannot support range searches

### Static hashed indexes

- Number of primary pages is fixed, allocated sequentially, never de-allocated with overflow pages as needed
- $h(k) \mod N$ is the bucket (or page) to which data entry with key $k$ belongs (with $N = \text{\# of buckets}$)
- Buckets contain *data* entries
- Hash function works on *search key* field of record $r$. Must distribute values of the range $0 \dots N - 1$
	- $h(\text{key}) = (a * \text{key} + b) \mod N$ works fairly well
	- $a$ and $b$ are constants that are used to tune the hash function
- Long overflow chains can develop and degrade performance (similar to ISAM)

### Dynamic hashed indexes

- Extensible hashing and linear hashing address the degraded performance problem
- Explored in CS 122C

## Physical DB design

- After ER design, schema refinement, and the definition of any views, we have the conceptual and external schemas for our databases
- Next step is to choose indexes, make clustering decisions and refine the conceptual and external schemas to meet performance goals
- Start by understanding the workload
	1) Most important queries and how often they arise
	2) Most important updates and how often the arise
	3) Desired performance goals for those queries/updates

### Decisions to be made

- What index should be created?
	- Which relations should have indexes?
	- What fields should be their search keys?
	- Should we build several indexes?
- For each index, what kind should it be?
	- B+ tree?
	- Hashed?
	- Clustered or unclustered?
- Should we make changes to the conceptual schema?
	- Consider alternative normalized schemas?
	- Should we "undo" some decomposition steps and settle for a lower normal form
	- Horizontal partitioning, materialized views, replications, etc.

### Understanding the workload

- For each **query** in the workload
	- Which relations does it access?
	- Which attributes are retrieved?
	- Which attributes appear in selection/join conditions?
- For each **update** in the workload
	- Which attributes are involved in selection/join conditions?
	- The type of update and the attributes affected

### Choice of indexes

- One approach: consider the most important queries in turn. Consider the best query plan using the current indexes and see if a better plan is possible with an additional index. If so, create it
	- This means we must understand and see how a DBMS evaluates its queries
- Before creating an index, we must also consider its impact on updates in the workload
	- *Trade-off*: indexes can make queries go faster, but updates will become slower

### Index selection guidelines

- Attributes in the `WHERE` clause are candidates for index keys
	- Exact match conditions -> hashed index or tree index
	- Range query -> tree index
- Multi-attribute search keys should be considered when a `WHERE` clause contains several conditions
	- Order of attributes in key matter for range queries
	- Such indexes can sometimes enable **index-only** strategies for important queries
- Choose indexes that benefit **as many queries** as possible
	- Only **one** index can be clustered per relation, so choose it based on important queries that benefit most from clustering

### Composite search keys

- To retrieve `Emp` records with `age = 30 AND sal = 4000`, and index on $\langle \text{age, sal} \rangle$ or $\langle \text{sal, age} \rangle$ would be better than an index *only* on `age` or `sal`
- If condition is `20 < age < 30 AND 3000 < sal < 5000` a clustered B+ tree index on $\langle \text{age, sal} \rangle$ or $\langle \text{sal, age} \rangle$ is best
- If condition is `age = 30 AND 3000 < sal < 5000`, a clustered index on $\langle \text{age, sal} \rangle$ is *much* better than $\langle \text{sal, age} \rangle$
- Composite indexes are larger and are updated more often
- Data entries in index sorted in lexicographical order

### Index-only query plans

- Some queries can be answered without retrieving *any* tuples from one or more of the relations involved if a suitable index is available

```SQL
-- Requires an index on Emp.dno
SELECT E.dno, COUNT(*)
FROM Emp E
GROUP BY E.dno;

-- Requires a composite key index on (Emp.dno, Emp.sal)
SELECT E.dno, MIN(E.sal)
FROM Emp E
GROUP BY E.dno;

-- Requires a composite key index on (Emp.age, Emp.sal)
SELECT AVG(E.sal)
FROM Emp E
WHERE E.age = 25 AND E.sal BETWEEN 3000 AND 5000;
```