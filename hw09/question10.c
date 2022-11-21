#include <stdio.h>

int data[] = {2, 3, 4, 5, 6, 7};

int foo(int *x) {
    return x[1] + x[2];
}

int main() {
    printf("%d", foo(&data[1]));
}