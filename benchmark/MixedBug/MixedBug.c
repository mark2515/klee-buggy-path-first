#include <klee/klee.h>
#include <assert.h>

int main() {
    int a, b, c, d;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");
    klee_make_symbolic(&d, sizeof(d), "d");

    int arr[4] = {1, 2, 3, 4};

    // First group: complex arithmetic + deep bug
    if (a > 10) {
        if (b > 20) {
            if (c > 30) {
                if (d > 40) {
                    if ((a + b * c) % 7 == 0) {
                        if ((b - d) % 5 == 0) {
                            if ((c * d) % 3 == 0) {
                                if (a * b * c * d == 0) {
                                    klee_assert(0);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Second group: pointer + out-of-bounds
    if (a >= 0 && a < 10) {
        int *p = &arr[a];

        if (b > 5) {
            if (c == 100) {
                if (d < 0) {
                    int idx = a + b + c + d;

                    if (idx >= 0 && idx < 4) {
                        int val = arr[idx];
                        if (val == 999) {
                            klee_assert(0);
                        }
                    } else {
                        int val = arr[idx];
                        if (val == 123) {
                            klee_assert(0);
                        }
                    }
                }
            }
        }
    }

    // Third group: complex logic (no bug)
    if ((a ^ b) > 100) {
        if ((c | d) < 50) {
            if ((a & c) == (b & d)) {
                if ((a + b + c + d) % 11 == 0) {
                    if ((a * d - b * c) == 777) {
                        // no bug
                    }
                }
            }
        }
    }

    // Fourth group: division by zero
    if (a == 42) {
        if (b == c) {
            if (d != 0) {
                int x = (a + b) / (d - d);
                if (x == 1) {
                    klee_assert(0);
                }
            }
        }
    }

    return 0;
}