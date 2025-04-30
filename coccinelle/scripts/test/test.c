
int test(int i){
   free(i);
}

int test2(int i){
   free(i);
}

int test_OTHER(int i){
   test(i);
}

int test_OTHER_ONCE(int i){
    free(i);
    test(i);
}