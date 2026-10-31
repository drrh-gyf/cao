#include <stdio.h>
int main(void)
{
    char line[1024];
    int c, n = 0, overflow = 0;
    while ((c = getchar()) != '\n' && c != EOF) {
        if (n < (int)sizeof(line)) line[n++] = (char)c;
        else overflow = 1;
    }
    if (overflow) { fputs("Input too long\n", stderr); return 1; }
    for (int i = 0; i < n; i++) {
        c = (unsigned char)line[i];
        if (c >= 'a' && c <= 'z') c = c - 'a' + 'A';
        else if (c >= 'A' && c <= 'Z') c = c - 'A' + 'a';
        putchar(c);
    }
    putchar('\n');
    return 0;
}
/* Edited and saved using Vim. */
