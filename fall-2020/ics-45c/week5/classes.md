# Classes

## What are they?

- A blueprint for a new kind of object
- An interface
    - What information is stored?
    - What can the object do?
- An implementation
    - Specifies what happens when you ask them to do things

## Data types

### Java

- Primitive types (static)
- Class types (dynamic)

### C++

- No distinction; all types are on equal footing
- Types specify memory required and layout for that memory
- Some types support operators
    - `std::cin >> x`
    - `std::cout << x`
- Some types support member functions (a.k.a methods)
    - Can be called on object of those types
    - `std:: string s; s.length();`
- A type specifies any initialization that happens
    - `int x;` <- no initialization
    - `std::string s;` <- initialized to an empty string
- A types specifies how resources are released when destroyed
    - Dynamically allocated memory
    - Opens files/network connections
- A type specifies how its objects are copied or moved
- A type specifies whether its objects *can* be copied or moved
- A type specifies what can be done to `const` objects of that type

## The song class

### Song.hpp

- Specifies an interface (how to use)
- [Multiple inclusion guards](../week2/separate-compilation.md) are a must
- Consists of two things
    - Member variables: information stored in each instance
    - Member functions: jobs the object can do
- Class declaration
    - For a human reader who wants to know how to use
    - For the compiler who needs enough information to use it in other source files

```C++
#include <string>

#ifndef Song_HPP
#define Song_HPP

class Song {
public: //accessible anywhere in a program (most member functions)
    Song(const std::string& initialArtist, const std::string& initialTitle);
    std::string getArtist() const; //legal to call on constant Song
    std::string getTitle() const;
    void setArtist(const std::string& newArtist);
    void setTitle(const std::string& newTitle);
private: //accessible only within the class (member variables)
    std::string artist;
    std::string title
};

#endif
```

### Song.cpp

- Implemenation of a class (how it works)

```C++
#include "song.hpp"

Song::Song(const std::string& initialArtist, const std::string& initialTitle) 
    :artist {initialArtist}, title {initialTitle}
    {}

std::string Song::getArtist() const {
    return artist;
}

std::string Song::getTitle() const {
    return title;
}

void Song::setArtist(const std::string& newArtist) {
    artist = newArtist;
}

void Song::setTitle(const std::string& newTitle) {
    title = newTitle
}
```

### Using the song class

```C++
int main() {
    Song song{"v2", "Moment of surrender"}; //curly braces mean initialization
    std::cout << song.getArtist() << "-" << song.getTitle() << std::endl;
}
```