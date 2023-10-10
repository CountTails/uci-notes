## Collecting timing data

## The `time` command

- All the major OSes can provide detailed performance data of program runs
    - Linux: `/usr/bin/time`
    - Windows: can use the same executable if using subsystem for linux
    - macOS: `gtime` from [homebrew](https://brew.sh)

### Using the command

```sh
$ time shell_sort1 32768

1.01user 0.00system 0:01.01elapsed 99%CPU
```

- The default format may give more information than needed
- It is also not in a format that is easy to parse

### Custom formatting

- Change the output to contain the number of seconds the program spent in user space
- You may want to look at some of the other metrics; read the docs for more details

```sh
$ time --format "%U" shell_sort1 32768

1.01
```

## Saving timing data

- If you use the suggested benchmark driver, you can write a bash script that loops over all function names and your desired array sized
- Each call might look like

```sh
$ time --format "1048576, %U" shell_sort1 1048576 -o shell_sort1.csv --append
```

- We suggest putting the timings for each function in a separate file
- The file should be a csv file with a header line indicating what each column represents

## Repeated timing

- Bash supports for loops in a few different ways shown

```sh
for fn in shell_sort, merge_sort, insertion_sort
do
    echo $fn
done

shell_sort
merge_sort
insertion_sort
```

```sh
for j in (10..14)
do
    echo $((2**j))
done

1024
2048
4096
8192
```

- We can combine the forms just shown to get something that loops over all the functions to benchmark with all of the sizes

```sh
for fn in shell_sort, merge_sort, insertion_sort
do
    for ((i=10; i<=20; i++));
    do
        # Use a call to time here
    done
done
```