#include <klee/klee.h>
#include <stdio.h>
#include <assert.h>

static void printLine(const char *s) {
    if (s) printf("%s\n", s);
}

static void printIntLine(int x) {
    printf("%d\n", x);
}

#ifndef OMITBAD

void benchmark_bad() {
    int a, b, c, d;
    int arr1[6] = {10, 20, 30, 40, 50, 60};
    int arr2[4] = {1, 3, 5, 7};

    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");
    klee_make_symbolic(&d, sizeof(d), "d");

    /* misleading safe path */
    if (a > -20 && a < 20) {
        if ((b ^ c) != 1234) {
            if ((a + b - c) == 999) {
                printLine("unlikely");
            }
        }
    }

    /* arithmetic distraction */
    if (a > 5) {
        if (b > 10) {
            if (c > 15) {
                if ((a + b + c + d) % 9 == 0) {
                    printLine("deep safe path");
                }
            }
        }
    }

    /* main suspicious path 1 */
    if (a >= 0 && a < 6) {
        int *p = &arr1[a];

        if (b > 2) {
            if (c < 0) {
                int idx = a + b - c + d;

                if (idx >= 0 && idx < 6) {
                    int val = arr1[idx];
                    printIntLine(val);

                    if (val == 999) {
                        klee_assert(0);
                    }
                } else {
                    /* out-of-bounds read */
                    int val = arr1[idx];
                    printIntLine(val);
                    klee_assert(0);
                }

                if (*p == 777) {
                    klee_assert(0);
                }
            }
        }
    }

    /* main suspicious path 2 */
    if (d >= 0 && d < 4) {
        int *q = &arr2[d];

        if (a < 0) {
            if (b > 5) {
                int off = b + c - d;

                if (off >= 0 && off < 4) {
                    int val2 = *(q + off);
                    printIntLine(val2);
                } else {
                    /* pointer-based out-of-bounds read */
                    int val2 = *(q + off);
                    printIntLine(val2);
                    klee_assert(0);
                }
            }
        }
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

static void goodG2B() {
    int arr[6] = {10, 20, 30, 40, 50, 60};
    int idx = 3;

    if (idx >= 0 && idx < 6) {
        printIntLine(arr[idx]);
    } else {
        printLine("ERROR: Index out-of-bounds");
    }
}

static void goodB2G() {
    int a, b, c, d;
    int arr1[6] = {10, 20, 30, 40, 50, 60};
    int arr2[4] = {1, 3, 5, 7};

    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");
    klee_make_symbolic(&d, sizeof(d), "d");

    if (a >= 0 && a < 6) {
        int idx = a + b - c + d;

        if (idx >= 0 && idx < 6) {
            printIntLine(arr1[idx]);
        } else {
            printLine("ERROR: Index out-of-bounds");
        }
    }

    if (d >= 0 && d < 4) {
        int off = b + c - d;

        if (off >= 0 && off < 4) {
            printIntLine(arr2[off]);
        } else {
            printLine("ERROR: Pointer offset out-of-bounds");
        }
    }
}

void benchmark_good() {
    goodG2B();
    goodB2G();
}

#endif /* OMITGOOD */

int main() {
#ifndef OMITGOOD
    printLine("Calling good()...");
    benchmark_good();
    printLine("Finished good()");
#endif

#ifndef OMITBAD
    printLine("Calling bad()...");
    benchmark_bad();
    printLine("Finished bad()");
#endif
    return 0;
}