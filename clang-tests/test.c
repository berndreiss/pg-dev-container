#include "test.h"
#include "otherfile.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Test{
  int field;
  char * pointer;
};

void customFree(char *s){
  pfree(s);
}
void second(char *s, int i){
    pfree(s);
}
void first(char *s){
  second(s, 0);

}

int main(int a, char **args){
  //struct Test test;
  //test.pointer = malloc(10 * sizeof(char));
  //strcpy(test.pointer, "Hello World\0");
  char *str = malloc(10 * sizeof(char));
  strcpy(str, "Hello World\0");

  int i = 1;if (i == 0)
    free(str);
  //pfree(str);
  //first(str);
  //otherFileFree(str);
  //str = malloc(10 * sizeof(char));
  //pfree(test.pointer);
  //char c = test.pointer[0];
  //free(test.pointer);
  printf(str);
  //printf("%c", c);

  free(str);
}

