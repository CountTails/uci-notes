# TTD walkthrough

## Example

An iterative process of developing some functionality for a class called SongCollection, which, as its name suggests, was intended to define a kind of object that stores and manages a collection of songs.

## Iteration 1

The size of a newly-created collection is zero

### Writing a test

Using the unittest module in Python, we're able to write a minimal amount of code to perform the test. 

By leveraging the unittest module's handling of many of the tedious details, we can concentrate our efforts on what we're trying to test

We'll begin by defining a class to test our `SongCollection` class; a reasonable name for it is `SongCollectionTest`

The `SongCollectionTest` class will contain all of the tests that are focused on our `SongCollection` class.

Our class needs to inherit from the built-in `unittest.TestCase` class. So we'll start by creating such a class, in a module called `test_songs`

```Python
import unittest  
  
  
class SongCollectionTest(unittest.TestCase):  
    pass
```

We need a test that checks whether the size of a newly-created collection is zero.

- add a method to a test class whose name begins with `test_`
- a unittest test method is considered to have failed if it raised an exception and succeeded if it doesn't. Assertions are used to implement these methods easily
- An assertion is something that you believe should be true at some point in your test
- If the asserted behavior occurs, no exception is raised; if it isn't, an exception is raised

```Python
class SongCollectionTest(unittest.TestCase):  
     def test_new_collections_have_size_zero(self):  
         collection = SongCollection()  
         self.assertEqual(collection.size(), 0)
```

### Running our test

```Python
if __name__ == '__main__':  
    unittest.main()
```

Executing this module (e.g., using F5 in IDLE) will cause all of the test methods in this module to automatically be found and executed for you

### Making the test run

Running the test yields the following results

```Python
NameError: global name 'SongCollection' is not defined
```

Since creating a SongCollection class is all the error messages are complaining about, that's all we should do, then try running the test again.

```Python
class SongCollection:  
    pass
```

```Python
from songs import SongCollection

class SongCollectionTest(unittest.TestCase):  
     def test_new_collections_have_size_zero(self):  
         collection = SongCollection()  
         self.assertEqual(collection.size(), 0)
```

Re-running the test yields a different error

```Python
AttributeError: 'SongCollection' has no attribute 'size'
```

Define the non existing method, but don't worry about how it should work for now

```Python
class SongCollection:  
    def size(self) -> int:
	    return 0
```

Re-running the tests leads to accidental success. The feature is considered correct until it fails later on.

### Refactoring

Since we're just getting started, there aren't any improvements that can be made in either the test or the code, so we're done with the first iteration.

## Iteration 2

The size of a collection after creating it and adding a song is 1

### Writing the test

```Python
class SongCollectionTest(unittest.TestCase):  
        ...  
  
     def test_after_adding_one_song_to_a_collection__size_is_1(self):  
         collection = SongCollection()  
         collection.add(Song())  
         self.assertEqual(collection.size(), 1)
```

Now we need to make the test run, which necessitates a `Song` class. Since we're not depending on the `Song` class it can be empty

```Python
class Song:
    pass
```

We also need to put an add method into the `SongCollection` class. Note that the goal, at present, is to make the test run, so we don't write any code into this method

```Python
class SongCollection:
	...
	def add(self, song_to_add: Song) -> None:
		pass
```

At this point, the test will run, but it will fail, since, of course, we haven't added the code to make the size of the collection be 1 after we add a song to it

This requires an `__init__` method to initialize it, along with minor changes to the `size()` and `add()` methods.

```Python
class SongCollection:  
	def __init__(self):  
		self._count = 0  

	def size(self) -> int:  
		return self._count  

	def add(self, song_to_add: Song) -> None:  
		self._count = 1
```

After every little step we take in making these modifications, we should run the tests. And once the tests pass, we're done and ready to move on.

### Refactoring

Always remember that when you've implemented the functionality you want in one iteration, you're not actually done with the iteration.

At this point, there are two tests in my `SongCollectionTest` class that create and manipulate a `SongCollection`

The unittest framework in Python provides a nice solution to this problem. If you write a `setUp` method in your test class, it will be called automatically each time one of your tests is executed.

```Python
class SongCollectionTest(unittest.TestCase):  
	def setUp(self):  
		self._collection = SongCollection()  

	def test_new_collections_have_size_zero(self):  
		self.assertEqual(self._collection.size(), 0)  

	def test_after_adding_one_song_to_a_collection__size_is_1(self):  
		self._collection.add(Song())  
		self.assertEqual(self._collection.size(), 1)
```

We'll be careful to make only one very minor change at a time, running the tests along the way to ensure that we haven't made any mistakes.

If the `Song` constructor ever starts requiring arguments, we may have a lot of changes to make in our tests. The following changes should prevent those.

## Iteration 3

Continuing to add songs will continue to increase the size by 1 each time

### Writing a test

```Python
class SongCollectionTest(unittest.TestCase):  
        ...  
  
	def test_continuing_to_add_songs_continues_to_increase_size(self):  
		for song_number in range(1, 101):  
			self._collection.add(self._create_test_song())  
			self.assertEqual(self._collection.size(), song_number)
```

### Making the test pass

```Python
class SongCollection:  
        ...  
  
	def add(self, song_to_add: Song) -> None:  
		self._count += 1
```

### Refactoring

No refactoring can be done here; let's move on.

## Iteration 4

After a song is added to the collection, the collection contains the song

### Writing a test

```Python
class SongCollectionTest(unittest.TestCase):  
        ...  
  
	def test_after_adding_song_to_collection__collection_contains_song(self):  
		new_song = self._create_test_song()  
		self._collection.add(new_song)  
self.assertTrue(self._collection.contains(new_song))
```

### Making the test pass

```Python
class SongCollection:  
	...  

	def contains(self, song_to_find: Song) -> bool:  
		return True
```

### Refactoring

But something is rotten in the SongCollection class. It's doing work that lists already do, namely the tracking of the number of songs stored in the collection. We should remove our own code that tracks this number and let the list do the work instead.

## The code

### songs.py

```Python
# songs.py


class Song:
    pass


class SongCollection:
    def __init__(self):
        self._songs = []


    def size(self) -> int:
        return len(self._songs)


    def add(self, song_to_add: Song) -> None:
        self._songs.append(song_to_add)


    def contains(self, song_to_find: Song) -> bool:
        return song_to_find in self._songs
```

### test_songs.py

```Python
# test_songs.py


from songs import Song, SongCollection
import unittest



class SongCollectionTest(unittest.TestCase):
    def setUp(self):
        self._collection = SongCollection()


    def test_new_collections_have_size_zero(self):
        self.assertEqual(self._collection.size(), 0)


    def test_after_adding_one_song_to_a_collection__size_is_1(self):
        self._collection.add(self._create_test_song())
        self.assertEqual(self._collection.size(), 1)


    def test_continuing_to_add_songs_continues_to_increase_size(self):
        for song_count in range(1, 101):
            self._collection.add(self._create_test_song())
            self.assertEqual(self._collection.size(), song_count)


    def test_after_adding_song_to_collection__collection_contains_song(self):
        new_song = self._create_test_song()
        self._collection.add(new_song)
        self.assertTrue(self._collection.contains(new_song))


    def test_collections_do_not_contain_songs_that_have_not_been_added(self):
        self.assertFalse(self._collection.contains(self._create_test_song()))


    def _create_test_song(self) -> Song:
        return Song()



if __name__ == '__main__':
    unittest.main()
```



