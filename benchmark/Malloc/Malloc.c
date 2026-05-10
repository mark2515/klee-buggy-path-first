#include <klee/klee.h>
#include <stdlib.h>

int main() {
    int n;
    klee_make_symbolic(&n, sizeof(n), "n");

    if (n > 0 && n < 10) {
        int *arr = (int *)malloc(n * sizeof(int));

        if (!arr) return 0;

        arr[0] = 1;

        if (n > 5) {
            arr[10] = 42;  // potential out-of-bounds access
        }

        free(arr);
    }

    return 0;
}