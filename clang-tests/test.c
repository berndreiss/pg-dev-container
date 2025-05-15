#include "test.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Test{
  int field;
};

int main(int a, char **args){
  struct Test test;
  test.field = 4;
  test.field = 'a';
  test.field++;
  char *str = malloc(10 * sizeof(char));
  char *str2 = malloc(10 * sizeof(char));
  printf("%d\n", test.field);
  strcpy(str, "Hello!\n\0");
  pfree(str, args[0][0]);
  pfree(str2, test.field);
  pfree(str2, test.field);
  pfree(str, args[0][0]);
  //pfree(str, 3);
  printf(str);


}
