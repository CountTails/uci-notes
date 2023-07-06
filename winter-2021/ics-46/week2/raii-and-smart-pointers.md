# RAII and smart pointers

## Catch and re-throw

- Dynamic allocation everywhere is dangerous
- Adds unnecessary noise to functioning code
- Pattern is meticulous and easy to get wrong

## Resource acquisition is initialization

- Prefer to acquire dynamic resources in the constructor
	- If acquisition fails, throw an exception from the constructor
- Release dynamic resources in the corresponding destructor
	- Mimics garbage collection
- A `std::vector` is a RAII dynamically-allocated array
	- When `std::vector` dies, the dynamically-allocated array is taken with it
- There is automated cleanup in C++ in certain circumstances
	- Statically-allocated local variables/parameters are cleaned automatically
	- When object dies, member variables die too
		- When constructors throw exceptions, initialized members variables are cleaned up
	
## Smart pointers

### The problem with pointers

- Can pointed to `nullptr`
	- Leads to undefined behavior if dereferenced (crashes on the ics46 vm)
- Can be pointed to places and things that they shouldn't be able to
	- Casting can give an untyped pointer
- Pointers can point to either single objects or arrays of objects
	- Can't tell the difference
	- Tracked outside of code
- Pointers will still point to objects even after they've been deleted
	- Dangling pointer problem
	- This is undefined behavior

### How to fix

- Use RAII when possible
- Need smarter pointer
	- Ownership
	- Pointer is responsible for the object it points to
	- Object dies when pointer dies

```C++
class A {
public:
	A();
	~A();
private:
	B* b;
}

A::A(): b{new B} {}
A::~A(){
	delete b;
}
```

### `<memory>`

- `std::unique_ptr<type>`
	- Holds unique ownership of what it points to
	- `unique_ptr`s *are* pointers
	- Can dereference, read and write
	- No memory leak (without an explicit `delete`)
	- Copying `std::unique_ptr` leads to double deletion (invalid free/read) so it is forbidden
	- Applies RAII techniques to dynamically allocated objects
- Borrowing
	- Use a reference to lend a value
- Other smart pointers
	- `std::shared_ptr<type>`
		- Owns the object, but is shared
		- When last pointer to object dies, object dies
		- Copying is safe
		- Mimics garbage collection
	- `std::weak_ptr`
		- Holds no ownership over its object
		- When used in combination with `std::shared_ptr`s, it knows when the object it points to has died already