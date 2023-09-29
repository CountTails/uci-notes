# Concurrency (part 2)

## Semaphores

- Semaphores are a *low-level* synchronization mechanism
- It is a data structure that contains
    - `count`: an integer, where `0` means it is locked
    - `queue`: a queue of tasks suspended on that semaphore
- Each synchronization condition requires its own semaphore
- There are two operations available on a semAphore
    - `request`: acquire the resource if `count > 0` otherwise enqueue the process and block
    - `release`: release the resource or hand it off to the next process in `queue`
- These operations must be **INDIVISIBLE**. They **CANNOT** be interrupted

### `request` and `release`

```C++
struct Lock {
    int count,
    std::queue<int>
}

void request(struct Lock lk) {
    if (lk.count > 0) {
        lk.count--;
    }
    else {
        /* Suspend process with getpid() */
        lk.queue.push(getpid())
    }
}

void release(struct Lock lk) {
    if (!lk.queue.empty()) {
        int pid = lk.pop()
        /* Resume process with PID pid */
    }
    else {
        lk.count++;
    }
}
```

### Consumer-producer problem

```
process producer
        i : element;
    repeat
        produce(i);
        request(/*free space in buffer */) -- Enqueue product in slot
        request(/*mutual exclusion*/) -- Start of critical section
        b.append(i)
        release(/*mutual exclusion*/) -- End of critical section
        release(/*item in buffer*/) -- Slot filled
    forever
```

```
process consumer
        j : element
    repeat
        request(/*item in buffer*/); -- Ensure item in available
        request(/*mutual exclusion*/);
        j := b.remove();
        release(/*mutual exclusion*/);
        release(/*free space in buffer*); -- Record consumption
        consume(j);
    forever
```

## Synchronized queues

### Thread-safe queues

```Java
class Queue {
    boolean isEmpty() { ... }
    boolean isFull() { ... }
    void enque(Request item) { ... }
    Request deque() { ... }
}


class SafeQueue extends Queue{
    synchronized boolean isEmpty() {
        return super.isEmpty();
    }

    synchronized boolean isFull() {
        return super.isFull();
    }

    synchronized void enque(Request item) {
        while(super.isFull()) {
            this.wait();
        }
        super.enque(item);
        this.notifyAll();
    }

    synchronized Request deque() {
        while(super.isEmpty()) {
            this.wait();
        }
        Request ret = super.deque();
        this.notifyAll();
        return ret;
    }
}
```

### Consumer-producer problem

```
process producer
    i : element
    SingletonSafeQue q = SingletonSafeQue.instance();
    repeat
        i = produce();
        q.enque(i);
    forever
```

```
process consumer
    j : element
    SingletonSafeQue q = SingletonSafeQue.instance();
    repeat
        j = q.deque();
        consume(j)
    forever
```

## Process queues

### Process descriptors

- Process status (ready, running, waiting)
- Priority
- Process ID
- Program counter, stack pointers, registers, etc.

### Switching processes

- Called a *context switch* and is **very expensive**
    - Suspend the current process
    - Save process status
    - Pick process to run
    - Restore process status
    - Resume execution
- Scheduler algorithm
    - Picks the next process to run
    - Timing interrupts trigger a context switch

## The `ResourceManager` class

```Java
class ResourceManager {
    boolean isFree[];
    ResourceManager(int numberOfItems) {
        isFree = new boolean[numberOfItems];
        for (int i = 0; i < isFree.length; ++i) {
            isFree[i] = true;
        }
    }

    synchronized int request() {
        while (true) {
            for (int i = 0; isFree.length; ++i) {
                if (isFree[i]) {
                    isFree[i] = false;
                    return i;
                }
            }
            this.wait(); // block until someone releases a resource
        }
    }

    synchronized int release(int index) {
        isFree[index] = tree; // Release resource
        this.notify(); // let a waiting thread run
    }
}
```