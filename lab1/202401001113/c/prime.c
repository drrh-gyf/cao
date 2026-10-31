#include <stdio.h>
#include <math.h>
int is_prime(int n)
{
    int i;
    if (n < 2) return 0;
    for (i = 2; i <= sqrt((double)n); i++) {
        if (n % i == 0) return 0;
    }
    return 1;
}
int main(void)
{
    int n = 17;
    int result = is_prime(n);
    printf("%d is prime: %d\n", n, result);
    n = 18;
    result = is_prime(n);
    printf("%d is prime: %d\n", n, result);
    return 0;
}
