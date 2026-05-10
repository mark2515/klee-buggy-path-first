#include <assert.h>
#include <klee/klee.h>

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    if (x > 100)
    if (x % 2 == 0)
    if (x % 3 == 0)
    if (x % 5 == 0)
    if (x % 7 == 0)
    if (x % 11 == 0)
    if (x % 13 == 0)
    if (x % 17 == 0)
        klee_assert(0);  // deep bug

    return 0;
}