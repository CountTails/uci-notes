# Type conversions

## Implicit conversions

- Not asked for, done automatically
- Supported by the built-in types
- Some conversion can't be done implicitly, but is still doable

## C style casts

- Taking a value and explicitly asking for expression
- Type in parenthesis in front of the expression: `double k = i / (double) j;`
- Will work, since it is always legal, but may not be what you want
- Since it is always legal, it can be dangerous and should be avoided
- Downcasting
    - Casting down an inheritance heirarchy
    - Pointer/reference of base -> pointer/reference of derived
    - Incorrect casts may lead to strange behavior

## C++ style casts

- `dynamic_cast`
    - Downcast in an inheritance heirarchy
    - No more; no less
    - Doesn't fail quietly
    - Fails by returning `nullptr` if unable to downcast
    - Only works on types with at least one pure virtual function
- `static_cast`
    - Only checked if doable at compile time
    - Can be used for downcasting
    - Fails unpredictably (undefined behavior)
    - Allow for explicit converion between built-in types
- `reinterpret_cast`
    - Sort of a C style cast
    - Mostly for low-level implementations
- `const_cast`
    - Lets you remove `const`
    - But **cannot** change types