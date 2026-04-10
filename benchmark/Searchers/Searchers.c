#include <klee/klee.h>
#include <assert.h>

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    if (x > 0) {
        if (x > 10) {
            if (x > 20) {
                if (x > 30) {
                    klee_assert(0);  // deep bug
                }
            }
        }
    }

    return 0;
}