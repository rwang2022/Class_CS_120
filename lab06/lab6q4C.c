#include <stdio.h>

int x[] = {3, 10, 4, 25, 33, 6, 2, 0};

int main(){
    int total = 0;
    int *pointer = x;
    while (*pointer != 0) {
        if (*pointer < 10)
            total = total + *pointer;
        pointer++;
    }
    printf("The total of things less than 10 is %d\n", total);
}