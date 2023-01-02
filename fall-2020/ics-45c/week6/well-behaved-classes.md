# Well behaved classes

## What is a well behaved class?

Objects of well behaved classes have these properties

- Statically allocated portion is compact enough to fit on the runtime stack
- Clean up after themselves automatically when they die
- Can be passed to functions by value **and** preserves the usual semantics (copyable)
- Can be assigned into existing objects of the same type **and** clean up and copy appropriately
- Can be `const`, while performing abilities that do **NOT** violate that promise
- Shouldn't do unnecessary work or use unnecessary memory; they should be efficient

## Example with `ArrayList`

### Definition

- Ask for its size
- Ask for its capacity
- Add an element to the end
- Ask for the $i^{\text{th}}$ element

### Default constructor

- Require no arguments
- Follow the rules of initialization for member variables
- May need to write one
- Should yield a valid, but empty `ArrayList`

### Member names

- Good to use standard names for member functions
- Can't have member *variable* and member *function* with **same** name
- Better to give *nicer* names to public members
- Avoid *magic* numbers
- Hiding names
    - Unnamed namespace (invisible to the linker; global to source file declared in)
    - Arrage names into grouping
    - Avoids risk of colliding names
- `this*`
    - First (hidden) parametes of every member function
    - Points to the object member function is called on

### Overloading member functions

- Multiple functions can have the same name
- Signatures should differ by
    - return type
    - parameter list
    - `const`ness

### Resizing objects

If object reaches capacity and you want to keep adding

- Make object of larger size
- Copy data from old to new
- Delete old
- Point old name to new

### Cleaning up classes

- Constructors may leak memory when constructed object dies
- **DO NOT** define a `cleanUp` member function
- Use **destructors** to clean up after *constructors*
    - De-initialize objects
    - Do anything that doesn't happen automatically
    - `~className()`
- Needed when default destructor is not enough
    - When all member variables are not *well-behaved*, a custom destructor is needed

### Copying from well-behaved classes

- New variable assignment
- Pass by value parameter
- By default
    - Pointer copied, but both point to same memory
    - First time object "dies", it cleans up properly, the next time causes double freeing of memory

#### Copy constructor

- If a class has a destructor, a copy constructor is generally needed
- `ClassName(const ClassName& other)`
    - Must use a constant reference parameter
    - Called for copy initialization (pass-by-value)
    - Pass `other`'s members to initializers
    - Copy members in containers

#### Copy assignment

- Both objects *already* exist, but we want to stuff one into the other
- Clean up one being killed
- Copy initialization and copy assignment are not the same
- By defualt: copy member by member
- Redefine the assignment operator
    - `ClassName& operator= (const ClassName& other)`
    - Needed if copy constructor and destructor are also needed
    - Copy members into new object (including contents of containers)
    - Delete misbehaved members of `other`
    - Point old object to new object
    - return `*this`
- Self assignment
    - Different if in different memory
    - Need pointer to both
    - `if (this != &other) { \\ copy } return *this;`