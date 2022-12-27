# Illuminating the dark corners

## The C++17 standard

- Explains all of C++
- What constitutes as a "legal" C++ program
- What a legal C++ program "means"
- What is included in the C++ standard library

## Undefined behavior

- Zero overhead principle: features should'nt cost anything unless you use them
- Could do nothing
- Could crash
- Could do something unpredictable

## Memcheck

- Can find
    - Use of initialized variables
    - Use of unallocated/deallocated memory
    - Use of memory beyond array boundaries
    - Deallocation of unallocated memory
    - Deallocating memory twice
    - Any deallocations not completed (memory leaks)