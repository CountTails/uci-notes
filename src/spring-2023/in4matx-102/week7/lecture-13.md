# Lecture 13

## Collections

### Problem

- How to traverse large collections efficiently?
- There may be large intermediary collections
- Example
	- A sequence of positive random numbers $n < 1$ where
	- $| n_{i + 1} - n_{i} | > 0.4$
	- Sequence stops when $n < 0.1$

### Solution 1

```Python
import random

def randomwalk_list():
	last, rand = 1, random.random()
	nums = []
	while rand > 0.1:
		if abs(last - rand) >= 0.4:
			last = rand
			nums.append(rand)
		else:
			print('*')
		rand = random.random()
	nums.append(rand)
	return nums

for num in randomwalk_list():
	print(num)
```

> We need to generate the **entire** list before printing any numbers out!

### Solution 2

```Python
import random

def randomwalk_static(last=[1]):
	rand = random.random()
	if last[0] < 0.1:
		return None
	while abs(last[0] - rand) < 0.4:
		print('*')
		rand = random.random()
	last[0] = rand
	return rand

num = radnomwalk_static()
while num is not None:
	print(num)
	num = randomwalk_static()	
```

> Better, but clumsy

### Actual solutions

- Iterate though collections in a efficient and elegant manner
- Avoid large intermediary data structures
- Support for infinite sequences
- Filtering and transformation of data

## Iterators

### In Python

```Python
import random

class randomwalk_iter:
	def __init__(self):
		self.last = 1
		self.rand = random.random()

	def __iter__(self):
		return self

	def __next__(self):
		if self.rand < 0.1:
			raise StopIteration
		else:
			while abs(self.last - self.rand) < 0.4:
				print('*')
				self.rand = random.random()
			self.last = self.rand
			return self.rand

for num in randomwalk_iter():
	print(num)
```

> Problem is solved, but a little verbose

### What are they

- Objects that keep state for traversing an abstract collection
- Closures that get passed around in every `next()`

### In java

```Java
import java.util.Iterator;

class IterExample implements Iterator<Double> {
	private double last = 1;
	private double rand = Math.random();

	public boolean hasNext() {
		return rand >= 0.1;
	}

	public Double next() {
		if (rand >= 0.1) {
			while (Math.abs(last - rand) < 0.4) {
				System.out.print("*");
				rand = Math.random();
			}
			last = rand;
		}
		return rand;
	}

	public void remove() { ... }

	public static void main(String[] args) {
		IterExample it = new IterExample();
		while (it.hasNext()) {
			System.out.print(it.next() + " ");
		}
	}
}
```

## Generators

### What are they?

- Functions that `yield` values every time they are called
- No equivalent in Java (must use iterators)
- No equivalent in C++ (But boost library supports them via coroutines)
- All other (major) languages have support for them

### In Python

```Python
import random

def randomwalk_gen():
	last = 1
	rand = random.random()
	while rand > 0.1:
		print('*')
		if abs(last - rand) >= 0.4:
			last = rand
			yield rand
		random = random.random()
	yield rand

for num in randomwalk_gen():
	print(num)
```

### In C\#

```C#
using System;  
using System.Collections.Generic;

namespace GenExample { 
	class Program {
		static Random random = new Random();

		static IEnumerable<double> RandomWalkGen() { 
			double last = 1;
			double rand = random.NextDouble(); 
			while (rand > 0.1) {
				Console.Write("* ");  
				if (Math.Abs(last - rand) >= 0.4) {
					last = rand;  
					yield return rand;
				}
				rand = random.NextDouble();
			}
			yield return rand;
		}
	
		static void Main(string[] args) {
			foreach (double d in RandomWalkGen()){
				Console.Write(d + " ");
			}
		}
```

## Streams

### A float stream

```Java
class Floaties implements Spliterator<Float> {
	private float last = 1.0f;  
	private float rand = (float)Math.random();

	public Stream<Float> stream() {   
		return StreamSupport.stream(this, false);
	}
	
	@Override  
	public int characteristics() { 
		return Spliterator.IMMUTABLE | Spliterator.NONNULL;
	}

	@Override  
	public long estimateSize() { return Long.MAX_VALUE; }

	@Override  
	public boolean tryAdvance(Consumer<? super Float> action) {
		if (rand >= 0.1) {  
			while (Math.abs(last - rand) < 0.4) {
				rand = (float)Math.random();
			}
			last = rand;
			action.accept(rand);
			return true;
		}
		return false;
	}

	@Override  
	public Spliterator<Float> trySplit() { return null; }
}

public class FloatStreamExample {  
	public static void main(String[] args) {
		Floaties floaties = new Floaties();  
		floaties.stream().forEach(System.out::println);
	}
}
```

### In other languages

- C#: No streams, but `LINQ`
- JavaScripts: Streams API
- C++: some support, but good support in `Boost.Range`
- Rust: Streams
- Go: `go-streams`

## Coroutines

### What are they?

- Procedures or functions that allow multiple entry points
	- They remember the last state of their execution
	- They call on each other as peers rather than caller/callee
- Appropriate scenario
	- A function that produces a stream of data
	- A function that consumes a stream a data
- Not just pairs of functions, but any number of functions
- Functions can specify which other function to yield to
- Implementation: stack per coroutine, continuations
- Lightweight alternative to threads
	- No real concurrency, just switching functions
	- Very nice model for processing data streams
- Fell out of favor in the 80s
	- May result in spaghetti code
	- May see a come back

### Motivating example: decompression followed by parsing

#### option 1: parser calls decompressor

```C
int decompressor(void) {
    static int repchar;
    static int replen;
    if (replen > 0) {
        replen--;    
	    return repchar;
	}
    c = getchar();
    if (c == EOF)
        return EOF;
    if (c == 0xFF) {
        replen = getchar();
        repchar = getchar();
        replen--;
        return repchar;
    } else
        return c;

}

/* parser code */
while (1) {
       c = decompressor();
       if (c == EOF)
           break;
       if (isalpha(c)) {
           do {
	           add_to_token(c);
               c = decompressor();
           } while (isalpha(c));
	        got_token(WORD);
		}
       add_to_token(c);
       got_token(PUNCT);
   }
```

#### option 2: decompressor calls parser

```C
/* Decompression code */
while (1) {
	c = getchar();
	if (c == EOF)
		break;
	if (c == 0xFF) {
		len = getchar();
		c = getchar();
		while (len--)
			parser(c);
	} else
		parser(c);
}
parser(EOF);

void parser(int c) {
    static enum {
		START,
		IN_WORD
    } state;
    switch (state) {
        case IN_WORD:
        if (isalpha(c)) {
            add_to_token(c);
			return;
		}
        got_token(WORD);
        state = START;
        /* fall through */
        case START:
        add_to_token(c);
        if (isalpha(c)) state=IN_WORD;
        else got_token(PUNCT);
		break;
	}
}
```

#### Option 3: cooperative partners

```C
int decompressor(void) {
    static int c, len;
    crBegin;
    while (1) {
        c = getchar();
        if (c == EOF)
            break;
        if (c == 0xFF) {
            len = getchar();
            c = getchar();
            while (len--)
				crReturn(c);
		} else  
			crReturn(c);
	}    
	crReturn(EOF);
	crFinish;
}

void parser(int c) {
    crBegin;
    while (1) {
      /* first char already in c */
        if (c == EOF)
            break;
        if (isalpha(c)) {
            do {
	            add_to_token(c);
	            crReturn( );
            } while (isalpha(c));        
            got_token(WORD);
        }
        add_to_token(c);
        got_token(PUNCT);  
        crReturn( );
	}
	crFinish;
}
```

- Hackery needed because C doesn't want to do coroutines
- `crBegin`, `crFinish`, `crReturn` are *Horrible* macros that I don't dare to show
