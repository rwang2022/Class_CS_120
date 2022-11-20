int x[] = {3, 50, 22, 91, 47};
int func(int *z) {
    *z = *z + 1;
    ++z;
    return z[0] + z[2];
}
int main() {
    printf("%d", func(x));
}