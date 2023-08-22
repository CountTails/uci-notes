# Lecture 25

## Transactions

- Concurrent execution of user programs is essential for good DBMS performance (and wait times)
	- Disk I/O is slow
	- DBMS should keep CPU cores busy by running multiple concurrent requests
- A program may perform many operations on data from the DB, but the DBMS only cares about what's being read(R) and written(W) from/to the DB
- A *transaction* is the DBMS's view of a user progrm
	- It is seen as a sequence of database R's and W's
	- The targets of the R's and W's are records (or pages)

### The ACID properties

- **Atomicity**: each transaction is all or nothing (no worries about partial effects and cleanup)
- **Consistency**: each transaction moves the database from one consistent sate to another
- **Isolation**: each transaction can be written as it if's the *only transaction* in existence
- **Durability**: once a transaction has committed, its effect will not be lost

### Concurrency in a DBMS

- Users run **transactions** and can think of each one as executing *all by itself*
	- Concurrency is handled by the DBMS, which allows the actions of various transactions to interleave
	- Each transaction must leave the DB in a consistent state if it was consistent when the transaction started
	- The DBMS may enforce some constraints, depending on the constraints declared in `CREATE TABLE` statements
	- The DBMS does *not* understand the semantics of the data
- Issues: effects of interleaving and effects of crashes

## Atomicity of transactions

- A transaction may *commit* after completing all of its actions, or it might *abort* or be aborted after executing some of its actions
	- Could violate a constraints
	- Encounter some other error
	- Be caught in a crash
	- Picked to resolve a deadlock
- The DBMS guarantees that transactions are *atomic*
	- All actions are logged so that they can be undone in the event a transaction is aborted

```
T1: BEGIN A=A+100, B=B-100 END
T2: BEGIN A=1.06*A, B=1.06*B END
```

- Consider a possible interleaving schedule

```
T1:     A=A+100                 B=B-100           | OK
T2:              A=1.06*A                B=1.06*B | OK
```

- Consider another possible interleaving schedule

```
T1:    A=A+100                           B=B-100 | OK
T2:             A=1.06*A    B=1.06*B             | Failed (too much interest)
```

### Scheduling transactions

- *Serial schedule*: any schedule that does not interleave the actions of different transactions
- *Equivalent schedules*: if for any database state, the effect (on the DB) of executing the first schedule is identical to the effect of the second schedule
- *Serializable schedule*: a schedule that is equivalent to **some** serial execution of the transactions

> If each transaction preserves consistency, then *every* serializable schedule preserves consistency

### Anomalies

- Reading uncommitted data ("dirty reads")
- Unrepeatable reads (different values at different points in a transaction)
- Overwriting uncommitted data

### Lock-based concurrency control

- Strict two-phase locking protocol
	- Each transaction requires a shared lock on an object before reading it and an exclusive lock on it before writing
	- All of the locks held by a transaction are released only when the transaction completes
	- If a transaction holds an exclusive lock on an object, no other transaction can get either type of lock on that object
- Strict 2PL allows only serializable schedules
	- Makes transaction abortion simpler
	- Prevents the anomalies from occurring

### Aborting transactions

- If transaction $T_{i}$ aborts, all its actions must be undone
	- And, if some $T_{j}$ already read a values last written by $T_{i}$, $T_{j}$ must also be aborted
- Most systems avoid such *cascading aborts* by releasing a transaction's locks only at *commit time*
- In order to *undo* the actions of an aborted transaction, the DBMS keeps a *log* where every write is recorded
	- Also used when recovering from a crash (transactions at crash time are aborted when DBMS is restored)

## The transaction log

- The following actions are recorded in the log
	- $T_{i}$ writes an object: record its old and new values
	- $T_{i}$ commits/aborts: write a log record noting the outcome
- Log record must go to disk *before* the changed page - hence the name **write-ahead logging**
- All log related activities are *transparently* taken care of by the DBMS

### Recovering from a crash

1) Analysis: scan logs (starting from most recent checkpoint) to identify active transactions and dirty pages
2) Redo: redo any updates to dirty pages to ensure that all logged updates were carried out
3) Undo: undo the writes of all active transactions at crash time, working backwards through the log, and aborting any partially-completed transactions

### Support for transactions in SQL

- A transaction is *automatically* started whenever a statement access or modifies the database
	- `SELECT`, `UPDATE`, `CREATE TABLE`, `INSERT`, etc
	- Multi-statement transactions are also supported
- A transaction can be terminated by
	- A `COMMIT` statement
	- A `ROLLBACK` statement
- Each transaction runs under a combination of an access mode and an isolation level
	- Access mode: controls what the transaction can potentially do the the database
		- `READ ONLY`: not permitted to modify the DB
		- `READ WRITE`: allowed to modify the database
	- Isolation level: controls the transaction's exposure to other (concurrent) transactions
		- `READ UNCOMMITTED`: can see dirty data
		- `READ COMMITTED`: won't see dirty data
		- `REPEATABLE READ`: re-reads get the same result
		- `SERIALIZABLE`: no concurrency worries!
	- Choosing isolation level
		- An application controllable tradeoff
			- Consistency vs. performance
			- Warning: it **will** affect your programming model
		- Things to watch out for
			- Default consistency level is DBMS engine-specific
			- Some engines may not support all levels
			- Default consistency is often **not** `SERIALIZABLE`
		- Snapshot isolations
			- DBMS keeps multiple versions of data
			- Transactions see versions as of when they started

### NoSQL transactions

- For transactions, NoSQL systems tend to be limited to *record-level* transactions (in order to *scale* on a cluster)
- As a result, one sometimes considers an application's transactional needs when picking a schema (what to nest)