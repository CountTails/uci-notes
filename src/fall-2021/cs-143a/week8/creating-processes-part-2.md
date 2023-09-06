# Creating processes (part 2)

## `allocuvm()`

> Allocate user-level pages for the program

```C
int
allocuvm(pde_t *pgdir, unsigned int oldsz, unsigned int newsz) {
    ...
    if (newsz >= KERBASE) // New size can't be ver 2GB
        return 0;
    ...
    a = PGROUNDUP(oldsz); // Start with the olde size rounded up to the nearest page
    for(; a < newsz; a += PGSIZE) {
        mem = kalloc(); // Allocate a new page, memory comes from the kernel memory allocator
        memset(mem, 0, PGSIZE); // Set page to all 0's
        if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0) {
            ...
            // Map the page
                // Take the page directory as argument
                // Virtual address where to map the page
                // The size of the region to map (1 page)
                // Physical address of the page we're mapping
                // Flags should be writable and user-accessible
            return 0;
        }
    }
    return newsz;
}
```

## `loaduvm()`

> Read data from the inode into that memory

```C
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, unsigned int offset, unsigned int sz) {
    ...
    for(i = 0; i < sz; i += PGSIZE) {
        if ((pte = walkpgdir(pgdir, addr + i, 0)) == 0) // Locate PTE: address is virtual where program is loaded
            panic("loaduvm: address should exist");
        pa = PTE_ADDR(*pte); // Resovel PTE into a physical address
        if(sz - i < PGSIZE)
            n = sz - i;
        else
            n = PGSIZE
        if(readi(ip, P2V(pa), offset+i, n) != n) // Use the virtual address of the physical page
            return -1;
    }
    return 0;
}
```

## Allocate program stack

- Allocate two pages
    - One will be the stack
    - The other will be marked as inaccessible

```C
sz = PGROUNDUP(sz);
if ((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
sp = sz;
```

- Push arguments to `main()` onto the new user stack
- Copy argument strings at the top of the stack (one at a time)
- Record pointers to them in the user stack

```C
// Push argument strings, prepare rest of stack in ustack
for(argc = 0; argv[argc]; argc++) {
    ...
    sp = (sp (- strlen(argv[argc]) + 1)) & ~3;
    // Copy elements of the array one by one on the stack
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
        goto bad;
    ustack[3+argc] = sp;
}
ustack[3+argc] = 0;

ustack[0] = 0xffffffff; // Fake return PC
ustack[1] = argc; // Number of arguments in argv
ustack[2] = sp - (argc+1)*4; // argv pointer

sp -= (3+argc+1) * 4;
if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;
```

## Switching page tables

- Start using the newly created page table
- Deallocate the olde page table

```C
int
exec(char *path, char **argv) {
    ...
    switchuvm(proc);
    freevm(oldpgdir);
    return 0;
}
```

- Remember the `exec()` replaces content of an already existing process
    - That process had a page table
    - Has to be allocated or memory will be leaked

### `freevm`

```C
void
freevm(pde_t *pgdir) {
    unsigned int i;

    if(pgdir == 0)
        panic("freevm: no pgdir");
    deallocuvm(pgdir, KERNBASE, 0); // Deallocate the user address space
    for(i = 0; i < NPDENTRIES; i++) { // Deallocate level 2 page table
        if(pgdir[i] & PTE_P) {
            char *v = P2V(PTE_ADDR(pgdir[i]));
            kfree(v);
        }
    }
    kfree((char*)pgdir); // Deallocate page table directory itself
}
```

### `deallocuvm`

```C
int
deallocuvm(pde_t *pgdir, unsigned int oldsz, unsigned int newsz) {
    ...
    a = PGROUNDUP(newsz);
    for(; a < oldsz; a += PGSIZE) {
        pte = walkpgdir(pgdir, (char*)a, 0); // Walke the page table and get each entry
        if(!pte)
            a += (NPTENTRIES - 1) * PGSIZE;
        else if((*pte & PTE_P) != 0) {
            // Deallocate a page
            pa = PTE_ADDR(*pte);
            if(pa == 0)
                panic("kfree");
            char *v = P2V(pa);
            kfree(v);
            *pte = 0;
        }
    }
    return newsz;
}
```

## Creating the first process

- Allocate process structure (information about the process)
- Create a page table (map only the kernel space)
- Allocate a page for the user init code (map this page)
- Configure trp frame for `iret`

### `userinit()`

```C
void
userinit(void) {
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
  
    initproc = p;
    if((p->pgdir = setupkvm()) == 0)
        panic("userinit: out of memory?");
    inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
    p->sz = PGSIZE;
    memset(p->tf, 0, sizeof(*p->tf));
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
    p->tf->es = p->tf->ds;
    p->tf->ss = p->tf->ds;
    p->tf->eflags = FL_IF;
    p->tf->esp = PGSIZE;
    p->tf->eip = 0;  // beginning of initcode.S

    safestrcpy(p->name, "initcode", sizeof(p->name));
    p->cwd = namei("/");

    // this assignment to p->state lets other cores
    // run this process. the acquire forces the above
    // writes to be visible, and the lock is also needed
    // because the assignment might not be atomic.
    acquire(&ptable.lock);

    p->state = RUNNABLE;

    release(&ptable.lock);
}
```

### `inituvm`

```C
void
inituvm(pde_t *pgdir, char *init, uint sz){
    char *mem;

    if(sz >= PGSIZE)
        panic("inituvm: more than a page");
    mem = kalloc();
    memset(mem, 0, PGSIZE);
    mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
    memmove(mem, init, sz);
}
```

### `exec("/init", argv)`

```asm
# exec(init, argv)
.globl start
start:
  pushl $argv
  pushl $init
  pushl $0  // where caller pc would be
  movl $SYS_exec, %eax
  int $T_SYSCALL

# for(;;) exit();
exit:
  movl $SYS_exit, %eax
  int $T_SYSCALL
  jmp exit

# char init[] = "/init\0";
init:
  .string "/init\0"

# char *argv[] = { init, 0 };
.p2align 2
argv:
  .long init
  .long 0
```


### `allocproc`

```C
static struct proc*
allocproc(void){
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if(p->state == UNUSED)
            goto found;

    release(&ptable.lock);
    return 0;

found:
    p->state = EMBRYO;
    p->pid = nextpid++;

    release(&ptable.lock);

    // Allocate kernel stack.
    if((p->kstack = kalloc()) == 0){
        p->state = UNUSED;
        return 0;
    }
    sp = p->kstack + KSTACKSIZE;

    // Leave room for trap frame.
    sp -= sizeof *p->tf;
    p->tf = (struct trapframe*)sp;

    // Set up new context to start executing at forkret,
    // which returns to trapret.
    sp -= 4;
    *(uint*)sp = (uint)trapret;

    sp -= sizeof *p->context;
    p->context = (struct context*)sp;
    memset(p->context, 0, sizeof *p->context);
    p->context->eip = (uint)forkret;

    return p;
}
```

- The previous functions don't actually create a process that runs.
- Instead, `/init` forks and starts `exec("sh")`

### `init.c`

```C
char *argv[] = { "sh", 0 };

int
main(void){
    int pid, wpid;

    if(open("console", O_RDWR) < 0){
        mknod("console", 1, 1);
        open("console", O_RDWR);
    }
    dup(0);  // stdout
    dup(0);  // stderr

    for(;;){
        printf(1, "init: starting sh\n");
        pid = fork();
        if(pid < 0){
            printf(1, "init: fork failed\n");
            exit();
        }
        if(pid == 0){
            exec("sh", argv);
            printf(1, "init: exec sh failed\n");
            exit();
        }
        while((wpid=wait()) >= 0 && wpid != pid)
            printf(1, "zombie!\n");
    }
}
```


### `struct proc`

```C
struct proc {
    unsigned int sz; // Size of process memory (bytes)
    pde_t* pgdir; // Page table
    char *kstack; // Bottom of kernel stack for this process
    enum procstate state; // Process state
    volative int pid; // Process ID
    struct proc *parent; // Parent process
    struct trapframe *tf; // Trap frame
    struct context *context; // swtch() here to run
    void *char; // If non-zero, sleeping on chan
    int killed; // If non-zero, have been killed
    struct file *ofile[NOFILE]; // Open files
    struct inode *cwd; // Current directory
    char name[16]; // Process name (debugging)
}
```