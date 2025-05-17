#include "test.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Test{
  int field;
  char * pointer;
};

void customFree(char *s){
  free(s);
}
void second(char *s, int i){
  if (i > 0)
    pfree(s);
}
void first(char *s){
  second(s, 0);

}

int main(int a, char **args){
  struct Test test;
  test.pointer = palloc(10 * sizeof(char));
  strcpy(test.pointer, "Hello World");

  pfree(test.pointer);
  //free(test.pointer);
  //first(test.pointer);
  char c = test.pointer[0];
  printf("%c", c);

}
