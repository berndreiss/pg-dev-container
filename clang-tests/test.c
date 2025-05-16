#include "test.h"
#include <stdio.h>
#include <stdlib.h>
//#include <string.h>

struct Test{
  int field;
  char * pointer;
};

void customFree(char *s){
  free(s);
}
void second(char *s){
  pfree(s, 2);
}
void first(char *s){
  second(s);

}

int main(int a, char **args){
  struct Test test;
  //test.field = 4;
  //test.field = 'a';
  //test.field++;
  test.pointer = malloc(10 * sizeof(char));
  //char *str2 = malloc(10 * sizeof(char));

  //free(test.pointer);
  //free(test.pointer);
  first(test.pointer);
  first(test.pointer);
  //pfree(str, 2);
  //test.pointer = malloc(10 * sizeof(char));
  //printf("%d\n", test.field);
  //strcpy(str, "Hello!\n\0");
  //pfree(str, args[0][0]);
  //pfree(str, args[0][0]);
  //pfree(str2, test.field);
  //pfree(test.pointer, 2);
  //pfree(str2, test.field);
  //pfree(str, 3);
  //printf(str);

  //printf("%d", test.field);
  //char c = test.pointer[0];

}
