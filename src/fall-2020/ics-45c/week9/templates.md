# Templates

## Functions

- Function types must be followed
- Consider a function that swaps two integers

```C++
void swap(int& a, int& b) {
    int t = a;
    a = b;
    b = t;
}
```

- This will only work for integers
- What if we want to swap other types?
    - Could utilize function overloading
    - Same name, but differentiated by types
    - But do we really want to rewrite this function for every data type we might want to swap?
- Function templates
    - Things that allow the compiler to build functions
    - Allows for an infinite set of functions to be created
    - The `template` keyword
        - Thing that immediately follows is a template
        - Template parameters placed in angled brackets
        - Parameter types are a typename or a class
        - Can be type instances
        - Write the function for every possible type `T`
    - Template functions do not exist at compile time
    - Template instantiation
        - Make one of the infinite set exist
        - Calling instantiates the template
    - Template parameter constraints
        - Needs to be copy constructible
        - Needs to be copy assignable
        - Needs to be destructible
        - Compiler will try to instantiate, but will fail
        - Constraints based on the template body
    - Templates should be written in header files
        - Entire thing (including body)
        - Does not violate the one-definition rule (even if there are multiple identical instantiations)

```C++
template <typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}
```

## Classes

- Mark a class with the `template` keyword
- Yields potentially infinite classes
- Parameters in angled brackets
- Member variables should be declared with parameter typename
- Member functions
    - Signatures placed in classes
    - Place implementation beneath template declaration in header file
    - Mark implementations as templates as well
    - Instantiate template with a typename
    - Yields potentiall infinite number of member functions

```C++
#ifndef POINT_HPP
#define POINT_HPP

#include <cmath>

template <typename CoordinateType>
class Point
{
public:

    Point(
        const CoordinateType& x, const CoordinateType& y,
        const CoordinateType& z);

    template <typename OtherCoordinateType>
    Point(const Point<OtherCoordinateType>& other);

    template <typename OtherCoordinateType>
    Point& operator=(const Point<OtherCoordinateType>& other);

    CoordinateType& x() noexcept;
    const CoordinateType& x() const noexcept;

    CoordinateType& y() noexcept;
    const CoordinateType& y() const noexcept;

    CoordinateType& z() noexcept;
    const CoordinateType& z() const noexcept;

    double distanceFrom(const Point<CoordinateType>& p) const;

private:

    CoordinateType x_;
    CoordinateType y_;
    CoordinateType z_;
};

template <typename CoordinateType>
Point<CoordinateType>::Point(
    const CoordinateType& x, const CoordinateType& y,
    const CoordinateType& z)
    : x_{x}, y_{y}, z_{z}
{
}

template <typename CoordinateType>
template <typename OtherCoordinateType>
Point<CoordinateType>::Point(const Point<OtherCoordinateType>& other)
    : x_{other.x()}, y_{other.y()}, z_{other.z()}
{
}

template <typename CoordinateType>
template <typename OtherCoordinateType>
Point<CoordinateType>& Point<CoordinateType>::operator=(const Point<OtherCoordinateType>& other)
{
    // Memberwise self-assignment should be safe here, so no need to do
    // the self-assignment check.
    x_ = other.x();
    y_ = other.y();
    z_ = other.z();
    return *this;
}

template <typename CoordinateType>
CoordinateType& Point<CoordinateType>::x() noexcept
{
    return x_;
}

template <typename CoordinateType>
const CoordinateType& Point<CoordinateType>::x() const noexcept
{
    return x_;
}

template <typename CoordinateType>
CoordinateType& Point<CoordinateType>::y() noexcept
{
    return y_;
}

template <typename CoordinateType>
const CoordinateType& Point<CoordinateType>::y() const noexcept
{
    return y_;
}

template <typename CoordinateType>
CoordinateType& Point<CoordinateType>::z() noexcept
{
    return z_;
}

template <typename CoordinateType>
const CoordinateType& Point<CoordinateType>::z() const noexcept
{
    return z_;
}

template <typename CoordinateType>
double Point<CoordinateType>::distanceFrom(const Point<CoordinateType>& other) const
{
    return std::sqrt(
        (x_ - other.x_) * (x_ - other.x_)
        + (y_ - other.y_) * (y_ - other.y_)
        + (z_ - other.z_) * (z_ - other.z_));
}

#endif
```