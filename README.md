# What

Dispatch task on nodes with make

# Test on a handful test VM

```console
thy@tdews2:~$ time fibs.mk
mkdir tmp/fib
01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657 46368 75025 121393 196418 317811 514229 832040 1346269 2178309 3524578
real	0m29.881s
user	0m3.233s
sys	0m2.003s
thy@tdews2:~$ fibs.mk clean
rm -r tmp/fib
thy@tdews2:~$ time fibs.mk -j 4
mkdir tmp/fib
02 01 04 03 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657 46368 75025 121393 196418 317811 514229 832040 1346269 2178309 3524578
real	0m11.799s
user	0m2.855s
sys	0m1.525s
thy@tdews2:~$ fibs.mk clean
rm -r tmp/fib
thy@tdews2:~$ time fibs.mk -j 8
mkdir tmp/fib
01 02 04 03 05 06 07 08 09 10 11 13 12 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657 46368 75025 121393 196418 317811 514229 832040 1346269 2178309 3524578
real	0m7.270s
user	0m2.340s
sys	0m1.483s
```
