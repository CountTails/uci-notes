# Strong induction

## Principle of strong induction

- Let $P(n)$ be a statement that is parametrized by natural numbers $n$
- Let $a$ and $b$ be constants, with $a \le b$
- If the following are true
    1) $P(a) \land P(a + 1) \land \dots \land P(b)$ (base cases)
    2) For $k \ge b$ $P(a) \land P(a + 1) \land \dots \land P(k) \implies P(k + 1)$
- Then $P(n)$ is true for all $n \ge a$

## Strong inductive proofs

### Equality

> Theorem: $\sum \limits_{i = 0}^{n} f_{i}^{2} = f_{n}f_{n+1}$

- $f_{0} = 0$
- $f_{1} = 1$
- $f_{2} = 1$

#### Base cases

1) $(f_{0})^{2} = 0^{2} = f_{0}f_{1} = 0*1 = 0$
2) $(f_{0})^{2} + (f_{1})^{2} = 0^{2} + 1^{2} = f_{1}f_{2} = 1*1 = 1$

#### Inductive step

- Assume the equality is true for $1 \le j \le k$

$$
    \sum \limits_{i = 0}^{1} f_{i}^{2} = f_{0}f_{1} \land \dots \land
    \sum \limits_{i = 0}^{j} f_{i}^{2} = f_{j}f_{j+1} \land \dots \land
    \sum \limits_{i = 0}^{k} f_{i}^{2} = f_{k}f_{k+1}
$$

- Then

$$
    \sum \limits_{i = 0}^{k + 1} f_{i}^{2} = f_{k+1}f_{k+1+1} = 
     (f_{k + 1})^{2} + \sum \limits_{i = 0}^{k} f_{i}^{2} = f_{k}f_{k+1}
$$

$$
    = (f_{k + 1}) + f_{k}f_{k + 1} \, \text{by the inductive hypothesis}
$$

$$
    = f_{k + 1}(f_{k} + f_{k + 1}) \, \text{by the definition of } 
    f_{n} = f_{n} + f_{n - 1}
$$

$$
    = f_{k + 1}(f_{k + 2})
$$

- Since the equality can be expressed for $k + 1$, and the eqality is true for $1 \le j \le k$, the statement is true

### Lower bound for the Fibonacci sequence

> Theorem: For $n \ge 5$ $f_{n} \ge 1.5^{n}$

#### Base cases

- $f_{4} = 5$ and $1.5^{4} = 5.0625$ (False)
- $f_{5} = 8$ and $1.5^{5} = 7.59375$ (True)
- $f_{6} = 12$ and $1.5^{6} = 11.390625$ (True)

#### Inductive step

- Assume the inequality is true for $6 \le j \le k + 1$ 


$$
    f_{6} \ge 1.5^{6} \land \dots \land
    f_{j} \ge 1.5^{j} \land \dots \land
    f_{k + 1} \ge 1.6^{k + 1} 
$$

- Then

$$
    f_{k + 2} = f_{k} + f_{k + 1} \ge 1.5^{k} + 1.5^{k + 1}    
$$

$$
    1.5^{k}(1 + 1.5) = 1.5^{k}(2.5)
$$

$$
    1.5^{2} = 2.25 \implies 2.5 \ge 2.25
$$

$$
    f_{k + 2} \ge 1.5^{k}(1.5^{2}) \implies f_{k + 2} \ge 1.5^{k + 2}
$$

## Well ordering principle

> Every nonempty subset $S$ of positive integers has a least element

### Theorem

> There are no positive integers **strictly** between $0$ and $1$

### Proof

Let $S$ be the the set of integers $x$ such that $0 \le x \le 1$. Suppose $S$ is nonempty; let $n$ be its smallest element. Multiplying both sides of $n \lt 1$ by $n$ give $n^{2} \lt n$. The square of a positive integer is a positive integer, so $n^{2}$ is an integer such that $n^{2} \lt n \lt 1$. This is a contradiction of the minimality of $n$. Hence $S$ is the empty set.

## City route

> A country has $n$ cities. Any two cities are connected by a one-way road. Show that there is a route that passes through every city.

### Weak induction

#### Base case

2 cities: they are connected by a one-way road, which is the route that passes through every city

#### Inductive step

Suppose we already have a route going through $k$ cities and we want to show that it can be turned into a route that goes through $k +  1$ cities. Let's number the cities in order in which the route proceeds

$$
    c_{1} \to c_{2} \to \dots \to c_{k - 1} \to c_{k}
$$

Then we have 3 cases

##### Case 1

There is a road from $c_{k + 1} \to c_{1}$. Then we can prepend the $c_{k + 1}$ to the existing route and get the route

$$
    c_{k + 1} \to c_{1} \to c_{2} \to \dots \to c_{k - 1} \to c_{k}
$$

that goes through all $k + 1$ cities.

##### Case 2

There is a road from $c_{k} \to c_{k + 1}$.  Then we can append the $c_{k + 1}$ to the existing route and get the route

$$
    c_{1} \to c_{2} \to \dots \to c_{k - 1} \to c_{k} \to c_{k + 1}
$$

that goes through all $k + 1$ cities.

##### Case 3

There is a road from $c_{1} \to c_{k + 1}$ and a road from $c_{k + 1} \to c_{k}$. Consider all cities with the roads leading to $c_{k + 1}$ and choose one with the highest index. The highest index $j$ is less than $k$, and bigger or equal to $1$. Thus we have two cities, $c_{j}$ and $c_{j + 1}$, such that there is a road leading from $c_{j} \to c_{k + 1}$ and a road leading from $c_{k + 1} \to c_{j + 1}$. Hence, we can insert $c_{k + 1}$ between them and get the route

$$
    c_{1} \to c_{2} \to \dots 
    \to c_{j} \to c_{k + 1} \to c_{j + 1} \to \dots 
    \to c_{k - 1} \to c_{k}
$$

that goes through all $k + 1$ cities.

These are all possible cases, thus we proved that if we have a route goint through $k$ cities we can always turn it into a route that goes through $k +  1$ cities.

### Strong induction

#### Base cases

- For $n = 0$, the statement is vacuously true
- For $n = 1$, the statement is trivially true, since the route contains only one city

#### Inductive step

Let's break all cities into two groups.   

In one group we have all cities from which a road leads to $c_{k + 1}$. In another group we have all cities to which a road leads from $c_{k + 1}$. 

By induction assumption we can construct a route going through the first group, since it contains at most $k$ cities. Let's number cities in the order in which the route proceeds: 

$$
    c_{1B} \to c_{2B} \to \dots \to c_{LB - 1} \to c_{LB}
$$

We use $L$  for last value and $B$ to mark cities that will appear in the ultimate route before $c_{k + 1}$.   

Also by induction assumption we can construct a route going through the second group, since it contains at most $k$ cities. Let's number cities in the order in which the route proceeds: 

$$
    c_{1A} \to c_{2A} \to \dots \to c_{LA - 1} \to c_{LA}
$$
 
We use $L$ for last value and $A$ to mark cities that will appear in the ultimate route after $c_{k + 1}$   

Now we can insert $c_{k + 1}$ between $c_{LB}$ and $c_{1A}$, because by construction there exists a road from $c_{LB}$ to $c_{k + 1}$ and a road from $c_{k + 1}$ to $c_{1A}$. This creates a route   

$$
    c_{1A} \to \dots \to c_{LA} \to c_{k + 1} \to c_{1B} \to dots \to c_{LB}
$$
that goes through all $k + 1$ cities.

There are two special cases When either first or second group is empty.   

In the first case the new route has prepended to the old route of $k$ cities

$$
    c_{k + 1} \to c_{1A} \to c_{2A} \to \dots \to c_{k - 1A} \to c_{kA}
$$
 
In the second case the new route has appended to the old route of $k$ cities

$$
    c_{1B} \to \dots \to c_{LB} \to c_{k + 1}
$$

These are all possible cases. Therefore, we proved that if we can construct routes going through up to $k$ cities we can always use them to construct a route that goes through $k + 1$ cities.
