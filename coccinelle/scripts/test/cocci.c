#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Test{
    int field;
};

void pfree(char * s, int i){
	free(s);
}


int main() {
    char *s = malloc(20);
    strcpy(s, "Hello, world!");
    char *c = s;

    struct Test test;
    test.field = 4;
    printf("%d", test.field);
    pfree(s, test.field);
    //free(c);
    printf(s);
    return 0;
}
