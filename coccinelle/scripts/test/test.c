
int test(int i){
   somefunc();
   free(i);
}

int test2(int i, Othertype o){
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
int testNIL(int i){
   if (i == NIL)
      return;
   free(i);
}


int testEXCLAMATION(int i){
   if (!i)
      return;
   free(i);
}

int testIfI(int i){
   if (i)
      free(i);
}

int testWhileI(int i){
   while (i)
      free(i);
}

int testIfINULL(int i){
   if (i == NULL)
      return;
   if (i)
      free(i);
}
int testIfIfINULL(int i){
   if (i == NULL)
      return;
   if (i < 3)
      return;
   if (i)
      free(i);
}


int testTwo(int i, int j){
   free(i);
   free(j);
}

int dependant1(int i, bool b){
   if (b)
      free(i);
}

int dependantMULTIPLE(int i, bool b){
   if (b)
      free(i);
   if (b)
      free(i);
}

int dependant2(bool b, int i){
   if (b)
      free(i);
}

int dependant3(int i, void * B){
   if (B->b)
      free(i);
}

int dependant3MULTIPLE(int i, void * B){
   if (B->b)
      free(i)
   if (B->b)
      free(i)
}
int testIfINULL(int i){
   if (i == NULL)
      return;
   if (i)
      free(i);
}
int testIfIfINULL(int i){
   if (i == NULL)
      return;
   if (i < 3)
      return;
   if (i)
      free(i);
}


int testTwo(int i, int j){
   free(i);
   free(j);
}

int dependant1(int i, bool b){
   if (b)
      free(i);
}

int dependantMULTIPLE(int i, bool b){
   if (b)
      free(i);
   if (b)
      free(i);
}

int dependant2(bool b, int i){
   if (b)
      free(i);
}

int dependant3(int i, void * B){
   if (B->b)
      free(i);
}

int dependant3ELSE(int i, void * B){
   if (B->b)
      free(i);
   else
      return;
}


int dependant3MULTIPLE(int i, void * B){
   if (B->b)
      free(i)
   if (B->b)
      free(i)
}

int dependant4(void * B, int i){
   if (B->b)
      free(i);
}

int dependant5(void * B, int i){
   if (B.b)
      free(i);
}

int dependant6(int i, void * B){
   if (B.b)
      free(i);
}

int dependant7Self(struct SOME i){
   if (i.b)
      free(i);
}

int dependent8Equ(void * B, int i){
   if (2 == B->some)
      free(i);
}

int dependent8Bigger(void *B, int i){
   if (B->some == 1)
      free(i);
}


int testEreport(int i){
   if (i > 2){
      if (i)
         free(i);

      ereport(ERROR);
   }

}
int testEreport2(int i){
      if (i > 3)
         return;

      if (i)
         free(i);

      ereport(ERROR);

}
