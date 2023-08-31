# Streams (part 2)

## Other terminal operations

- `findAny` is like `findFirst`, but returns any match, not necessarily the first one, and is faster on parallel streams

```Java
result = words
	.parallel()
	.filter(w -> w.length() > 10)
	.filter(w -> w.endsWith("y"))
	.findAny()
	.orElse("");
```

- `max/min` require a comparator and return an `Optional` (since the input may be empty)

```Java
Optional<String> result = words.max((v, w) -> v.length() - w.length());
```

- `allMatch/anyMatch/nonMatch` check a predicate

```Java
boolean result = words.allMatch(w -> w.contains("e"));
// result is true if all words contain the letter e
```

## Primitive type streams

- Inefficient to have stream of number wrappers such as `Stream<Integer>`
- For example, `numbers.map(x -> x * x)` requires unboxing and boxing for each element
- `IntStream`, `LongStream`, `DoubleStream` work with `int`, `long`, `double` values without boxing

### Creating primitive type streams

- Can create from individual numbers, or an array

```Java
IntStream stream = IntStream.of(3, 1, 4, 1, 5, 9);
int[] values = {3, 1, 4, 1, 5, 9};
stream = IntStream.of(values);
```

- `range` yields a contiguous range of integers

```Java
IntStream stream = IntStream.range(a, b);
// Stream contains a, a + 1, a + 2, ..., b - 1
```

- `Random` generate yields infinite stream of random numbers

```Java
Random generator = new Random();
IntStream dieTosses = generator.ints(1, 7);
```

- `String` yields string of Unicode code points

```Java
IntStream codePoints = str.codePoints();
```

### Mapping primitive type streams

- `IntStream.map` with an `int -> int` function yields another `IntStream`

```Java
IntStream stream = IntStream.range(0, 20)
	.map(n -> Math.min(n , 10));
	// A stream with twenty elements 0, 1, 2, ..., 9, 10, 10, ..., 10
```

- When the function yields objects, use `mapToObj`

```Java
String river = "Mississippi";
int n = river.length();
Stream<String> prefixes = IntStream.range(0, n)
	.mapToObj(i -> river.substring(0, i));
	// "", "M", "Mi", "Mis", "Miss", "Missi"
```

- Also have `mapToDouble`, `mapToLong` if the function yields `double`, `long` values
- Think of `IntStream.range(a, b).mapXXX` as an equivalent of a `for` loop that yields a value in each iteration
- Use `mapToInt/mapToLong/mapToDouble` with streams of objects when the map function yields primitive type values

### Processing primitive type streams

- Stream methods for primitive type streams have modified parameters/return types
- For example, `IntStream.toArray` returns an `int[]` and doesn't require a constructor
- Four additional methods: `sum`, `average`, `max`, and `min` (without comparators)
- Last three return `OptionalInt/OptionalLong/OptionalDouble`

```Java
double average = words
	.mapToInt(w -> w.length())
	.average()
	.orElse(0);
```

## Grouping results

- So far, results were either a value or a collection
- Sometimes, we want to split a result into groups
- Example: Group all words with the same first letter together

```Java
stream.collect(Collectors.groupingBy(function))
```

- Use
	- *function* produces a key for each element
	- The result is a map
	- Map values are collection of elements with the same key

```Java
Map<String, List<String>> groups = Stream.of(words)
	.collect(Collectors.groupingBy(
		w -> w.substring(0, 1)
	)); // The function for extractin the keys
```

- `groups.get("a")` is a list of all words starting with `a`

### Processing groups

- Nice to split result into groups
- Even nicer: can process each group
- Pass a collector to`Collectors.groupingBy`
- Example: group into sets, not lists

```Java
Map<String, Set<String>> groupOfSets = Stream.of(words)
	.collect(Collectors.groupingBy(
		w -> w.substring(0, 1), // The function for extracting the keys
		Collectors.toSet() // The group collector
	))
```

- The `groupingBy` collector collects the *stream* into groups
- The `toSet` collector collects *each group* into a set

### Collecting counts and sums

- Use `Collectors.counting()` to count the group values

```Java
Map<String, Long> groupCounts = Stream.of(words)
	.collect(Collectors.groupingBy(
		w -> w.substring(0, 1),
		Collectors.counting()
	));
```

- `groupCounts.get("a")` is the number of words that start with an "a"
- To sum up some aspect of group values, use `summingInt`, `summingDouble` and `summingLong`

```Java
Map<String, Long> groupSum = countries.collect(
	Collectors.groupingBy(
		c -> c.getContinent(), // The function for extracting the keys
		Collectors.summingLong(
			c -> c.getPopulation()
		)
	)
); // The function for getting the summands
```

- `groupSum.get("Asia")` is the total population of Asian countries

### Collecting average, minimum, maximum

- The `Collectors` method `averagingInt`, `averagingDouble`, and `averagingLong` work just like `summingXXX`
- Return $0$ for empty groups (not an `Option`)
- Average word length grouped by starting character

```Java
Map<String, Double> groupAverage = Stream.of(words)
	.collect(Collector.groupingBy(
		w -> w.substring(0, 1),
		Collectors.averagingInt(String::length)
	));
```

- `maxBy`, `minBy` use a comparison function and return `Optional` results

```Java
Map<String, Optional<String>> groupLongest = Stream.of(words)
	.collect(
		Collectors.groupingBy(
			w -> w.substring(0, 1), // The function for extracting the keys
			Collectors.maxBy((v, w) -> v.length() - w.length())
		)
	); // The comparator function
```

## Course Wrap up

### Overall course goals

- Build upon your fundamental programming concepts and skills
- Learn the Java language
- Construct programs for varied problems and environements
- Build a solid foundation for future ICS courses and for your career