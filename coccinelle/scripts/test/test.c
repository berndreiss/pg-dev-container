
int test(int i){
   somefunc();
   free(i);
}

int test2(int i){
   free(i);
}

int test_OTHER(int i){
   test(i);
}

int testif(int i){

   if (i > 3)
      free(i);

}
void testreturn(int i){

   if (i > 3)
      return;

   free(i);
}

int testreturnifdef(int i){

#ifdef something
      return 3;
#endif
   free(i);
}

int test_OTHER_ONCE(int i){
    free(i);
    test(i);
}
int testTwice(int i){
   free(i);
   free(i);
}

int testNULL(int i){
   if (i == NULL)
      return;
   free(i);
}

int testIfI(int i){
   if (i)
      free(i);
}
