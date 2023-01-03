# Recursion in MIPS

## A recursive example

Let's solve the following recursive function, written in C. This sums all elements of an array.

```C
int sum( int arr[], int size ) { 
if ( size == 0 ) {
    return 0;
} else {
    return sum( arr, size - 1 ) + arr[ size - 1 ]; 
}
```

## A MIPS translation

- Assume the address of **arr** is in `$a0` and **size** is in `$a1`
- Must decide what to save to the stack
    - Can save `size - 1` to compute `arr[size - 1]` <-- let's do this one
    - Can save `arr[size - 1]`

```
sum:     addi $sp, $sp, -8           # Adjust sp 
         addi $t0, $a1, -1           # Compute size - 1
         sw   $t0, 0($sp)            #Savesize-1tostack
         sw   $ra, 4($sp)            # Save return address
         bne  $a1, $zero, ELSE       # branch ! ( size == 0 )
         li   $v0, 0                 # Set return value to 0
         addi $sp, $sp, 8            # Adjust sp
         jr $ra                      # Return

ELSE:    move $a1, $t0               # update second arg to size-1
         jal sum
         lw    $t0, 0($sp)           # Restore size - 1 from stack
         li    $t7, 4                # t7=4
         mult  $t0, t7               # Multiplesize-1by4
         mflo  $t1                   # Put result in t1

         add   $t1, $t1, $a0         # Compute & arr[ size - 1 ] 
         lw    $t2, 0($t1)           # t2 = arr[ size - 1 ]
         add   $v0, $v0, $t2         # retval = $v0 + arr[size - 1]
         lw    $ra, 4($sp)           # restore return address from stack
         # we don’t need to restore $t0, it was saved for the
         # function not for whoever called sum
         addi $sp, $sp, 8            # Adjust sp
         jr $ra                      # Return
```


## A second example

Let's solve the following variation of a recursive function, written in C. This sums only the odd elements of an array.

```C
int sumOdd( int arr[], int size ) {
    if ( size == 0 ) {
        return 0;   
    }
    else if ( arr[ size - 1 ] % 2 == 1 ) { 
        return sumOdd( arr, size - 1 ) + arr[ size - 1 ]; // number is ODD 
    } 
    else {
        return sumOdd( arr, size - 1 ); // number is EVEN
    }
}
```

- Usually, the difficult part is figuring out what to save
- Turns out that we will need to save `size - 1` **AND** `arr[size - 1]` to the stack

```
sumOdd: 
    # Adjust sp (this is moved 2 positions to hold a value later in the code)
    addi $sp, $sp, -8      
    addi $t0, $a1, -1                      # Compute size - 1
    sw   $ra, 4($sp)                       # Save return address
    # base case (size == 0)
    bne  $a1, $zero, check_odd             # Branch (size != 0 )
    li   $v0, 0                            # Set return value to 0
    addi $sp, $sp, 8                       # Adjust sp  
    # No function was called so, $ra is unchanged. Don't have to put it back.
    jr $ra                                 # Return to calling function

check_odd:
    sll $t1, $t0, 2                        # Multiply size - 1 by 4
    add $t1, $t1, $a0                      # Compute address of arr[size - 1]
    lw $t2, 0($t1)                         # t2 = arr[size - 1]
    andi $t3, $t2, 1                       # Is arr[size - 1] odd?
    beq $t3, $zero, even                   # Branch if even
    sw $t2, 0($sp)                         # Save arr[size - 1] on the stack
    move $a1, $t0                          # Update second arg
    jal sumOdd
    lw $t2, 0($sp)                         # Restore arr[arr - 1] from the stack
    add $v0, $v0, $t2                      # Update return value
    lw $ra, 4($sp)                         # Restore return address from the stack
    addi $sp, $sp, 8                       # Adjust sp
    jr $ra                                 # return

even:
    move $a1, $t0                          # Update second arg
    jal sumOdd
    lw $ra, 4($sp)                         # Restore return address from the stack
    # Don’t need to put other items back; they weren’t for who called sumOdd
    addi $sp, $sp, 8                       # Adjust sp
    jr $ra                                 # Return
```

## Another example

Assume we have a function f that calls another function func. We have no clue what func does or if it calls any other functions. All we know is that its function prototype is `int func(int a, int b)`. Assume that f does the following:

```C
int f(int a, int b, int c) {
    return func(func(a, b), c);    
}
```

If we were to convert function f into MIPS assembly, it would look like:

```
f:
    addi $sp, $sp, -8          # allocate frame = 8 bytes
    sw $ra, 0($sp)             # save return address
    sw $a2, 4($sp)             # save c
    jal func                   # call func(a, b)
    move $a0, $v0              # $a0 = result of func(a,b)
    lw $a1, 4($sp)             # $a1 = c
    jal func                   # call func(func(a,b),c)
    lw $ra, 0($sp)             # restore return address
    addi $sp, $sp, 8           # free stack frame
    jr $ra                     # return to caller
```

- Why do we save `$a3`, parameter `c` on the stack?
    - We need to save it because we don’t know what func is going to do and who it may call
    - Similar thinking should be used for all parameters.

