# Lecture 16

## SQL data integrity

- So far, we have made good use of
	- `PRIMARY KEY`
	- `UNIQUE`
	- `NOT NULL`
	- `FOREIGN KEY`
- Other features for ensuring field integrity
	- `DEFAULT` (instead of `NULL` for missing `INSERT` values)
	- `CHECK` (can access anything in the current row)
- More powerful integrity features include
	- `TRIGGER` (a sledge hammer to use when all else fails)

### Some integrity related examples

- `CHECK` is useful when more *general* integrity constraints than just keys are involved

```SQL
CREATE TABLE Sailors (
	sid INTEGER,
	sname CHAR(10)
	rating INTEGER,
	age REAL DEFAULT 18.0,
	PRIMARY KEY (sid)
	CHECK (rating >= 1 AND rating <= 10)
);
```

- Constraints can be *named* to better manage them

```SQL
ALTER TABLE Sailors
ADD CONSTRAINT AliveConstraint
CHECK (age > 0);
```

### Enforcing referential integrity

- Consider `Sailors` and `Reserves`; `sid` in `Reserves` is a foreign key that references `Sailors`
- What should be done if a `Reserves` tuple with a non-existent sailor ID is *inserted*? -> **Reject it!**
- What should be done if a `Sailors` tuple is *deleted*?
	- Also delete all `Reserves` tuples that refer it it (cascaded deletion)
	- Disallow deletion of a `Sailor` that is being referred to (prevent dangling reference)
	- Set `sid` in `Reserves` tuple to some default `sid`
- Similar issues if a `Sailor` primary key is *updated*?

### Referential integrity in SQL

There are 4 options on deletes and updates

- Default is `NO ACTION` (delete/update is rejected)
- `CASCADE`
- `SET NULL` / `SET DEFAULT`

## Stored procedures in SQL

- What is a stored procedure?
	- A program executed via a single SQL statement
	- Executes in the process space of the **server**
- Advantages
	- Can encapsulate application logic while staying close to the data
	- Supports the reuse (sharing) of application logic by different users
	- Can be used to help secure database applications

### Some more details

- A **stored procedure** is a function or procedure written in a *general-purpose* programming language that executes within the DBMS
- These can perform computations that *cannot* be expressed in SQL; they go beyond the limits of relational completeness
- Procedure execution is requested through a single SQL statement: `CALL`
- Executes on the (usually remote) DBMS server
- SQL persistent stored modules (PSM) extends SQL with concepts from general-purpose programming languages

### Functions

```SQL
CREATE FUNCTION ShowNumReservations(boat_id int)
RETURNS TABLE (sid int, sname text, cnt int)
AS $$
	SELECT S.sid, S.sname, COUNT(*) AS cnt
	FROM Sailors S, Reserves R
	WHERE S.sid = R.sid AND R.bid = boat_id
	GROUP BY S.sid
$$
LANGUAGE SQL;
```

- The function above can be used in queries since it returns a table
- This function simply wraps a query to read the data from the table. Usable without needing to know the underlying query

### Procedures

```SQL
CREATE PROCEDURE IncreaseRating (IN sailor_id int, IN increase int)
AS $$
	UPDATE Sailors
	SET rating = rating + increase
	WHERE sid = sailor_id
$$
LANGUAGE SQL;
```

- The procedure above can modify the underlying data 
- There is no return value, so it should be invoked through the `CALL` statement

### External logic

- Stored procedures can also be written outside of the SQL language

```SQL
CREATE PROCEDURE RecklessSailors ()
AS 'DIRECTORY/funcs', 'reckless_sailors'
LANGUAGE C;
```

### Main SQL/PSM constructs

- Supports `FUNCTION`s and `PROCEDURE`s
- Local variable (`DECLARE`)
- `RETURN` values for functions
- Assign variables with `SET`
- Branches and loops
- Queries can be part of expressions
- Cursors available to iterate over query results

```SQL
CREATE FUNCTION ResvRateSailor (IN sailorId INT) RETURNS INT
BEGIN
	DECLARE resvRating INT
	DECLARE numResv INT
	SET numResv = (
		SELECT COUNT(*)
		FROM Reserves R
		WHERE R.sid = sailorId
	)
	IF (numResv > 10) THEN
		resvRating = 1
	ELSE
		resvRating = 0
	ENDIF
	RETURN resvRating
END;
```

> See your chosen RDBMS's docs for info about its procedural extension to SQL

### Triggers in SQL

- Trigger: a procedure that runs automatically if specified change occurs to the DBMS
- Three parts
	1) Event (activates the trigger)
	2) Condition (tests if the trigger should run)
	3) Action (what happens if the trigger runs)
- Can be used to do "whatever"
	- In postgreSQL, "whatever" is a stored function call
	- Details vary **widely** from vendor to vendor

```SQL
-- First create the logic
CREATE FUNCTION AddYoungSailor () RETURNS TRIGGER
AS $$
	BEGIN
		INSERT INTO YoungSailors (sid, sname, age, rating)
		VALUES (NEW.sid, NEW.sname, NEW.age, NEW.rating)
		RETURN NEW
	END;
$$
LANGUAGE PLPGSQL;

-- Now create the trigger itself
CREATE TRIGGER YoungSailorLogger
AFTER INSERT ON Sailor
FOR EACH ROW
WHEN (NEW.age < 18)
EXECUTE FUNCTION AddYoungSailor();

-- Ensure YoungSailors table exists
CREATE TABLE YoungSailors (LIKE Sailors);
```

- Now let's try some `INSERT`s

```SQL
INSERT INTO Sailors (sid, sname, rating, age)
VALUES (777, 'Lucky', 7, 77); -- Trigger not executed

INSERT INTO Sailors (sin, sname, rating, age)
VALUES (778, 'Lucky Jr.', 7, 17); -- Trigger executed
```

- Resulting `YoungSailors` table

| `sid` | `sname` | `rating` | `age` |
|:---:|:----:|:-----:|:---:|
| `778` | `'Lucky Jr.'` | `7` | `17` |
