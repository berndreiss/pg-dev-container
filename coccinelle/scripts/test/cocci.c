#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char *s = malloc(20);
    strcpy(s, "Hello, world!");
    char *c = s;

    free(s);
    printf(s);
    return 0;
}
