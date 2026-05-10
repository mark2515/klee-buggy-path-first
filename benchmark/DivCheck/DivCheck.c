#include <klee/klee.h>

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    if (x == 0) {
        int y = 10 / x;  // divide by zero bug
    }

    return 0;
}