#include <klee/klee.h>
#include <assert.h>
#include <stdlib.h>

int main() {
    int a, b, c;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");

    // Phase 1: misleading simple paths
    if (a > 0) {
        if (a > 10) {
            if (a > 20) {
                if (a > 30) {
                    // no bug
                }
            }
        }
    }

    // Phase 2: must go through memory
    if (b > 50) {
        int *p = (int *)malloc(4 * sizeof(int));
        if (!p) return 0;

        // force symbolic pointer usage
        int idx = (a + b + c) % 20;

        if (idx >= 0 && idx < 4) {
            p[idx] = 1;
        } else {
            // not enough yet
            if ((a * b + c) % 7 == 0) {
                if ((b - c) % 5 == 0) {

                    p[idx] = 999;   // OOB
                    klee_assert(0);
                }
            }
        }

        free(p);
    }

    // Phase 3: fake easy bug removed
    if (c == 123456) {
        // no bug here
    }

    return 0;
}