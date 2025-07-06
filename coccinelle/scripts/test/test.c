#define NULL ((void*)0)
#define NIL ((void*)0)
typedef enum { false = 0, true = 1 } bool;
void somefunc();
void free(void *ptr);
void test(void *ptr);
typedef struct {
  int dummy_field;
} Type;
typedef struct {
  int b;
} OtherType;
void pfree(Type *i){
  free(i);
}
void oneParameter(Type *i){
  somefunc();
  pfree(i);
}
void threeParameters(OtherType a, Type *i, OtherType o){
  pfree(i);
}
void twoParameters(Type *i, OtherType o){
  pfree(i);
}
void noFree(Type *i){
  test(i);
}
void conditional(Type *i){
  int integer = 0;
  if (integer > 3)
    pfree(i);
}
void conditionalReturn(Type *i){
  int integer = 0;
  if (integer > 3)
    return;
  pfree(i);
}
void returnifdef(Type *i){
#ifdef something
  return;
#endif
  pfree(i);
}
void twice(Type *i){
  pfree(i);
  pfree(i);
}
void conditionalNULL(Type *i){
  if (i == NULL)
    return;
  pfree(i);
}
void conditionalNIL(Type *i){
  if (i == NIL)
    return;
  pfree(i);
}
void notI(Type *i){
  if (!i)
    return;
  pfree(i);
}
void confirmI(Type *i){
  if (i)
    pfree(i);
}
void whileI(Type *i){
  while (i)
    pfree(i);
}
void ifINULLreturn(Type *i){
  if (i == NULL)
    return;
  if (i)
    pfree(i);
}
void ifINULLconditionalReturn(Type *i){
  if (i == NULL)
    return;
  int integer = 0;
  if (integer < 3)
    return;
  if (i)
    pfree(i);
}
void doubleFree(Type *i, Type *j){
  pfree(i);
  pfree(j);
}
void dependant(Type *i, bool b){
  if (b)
    pfree(i);
}
void dependantMultiple(Type *i, bool b){
  if (b)
    pfree(i);
  if (b)
    pfree(i);
}
void dependantBoolFirst(bool b, Type *i){
  if (b)
    pfree(i);
}
void dependantFieldAccess(Type *i, OtherType *B){
  if (B->b)
    pfree(i);
}
void dependantFieldAccessMultiple(Type *i, OtherType * B){
  if (B->b)
    pfree(i);
  if (B->b)
    pfree(i);
}
void dependantElse(Type *i, OtherType *B){
  if (B->b)
    pfree(i);
  else
    return;
}
void dependantFieldAccessFirst(OtherType * B, Type *i){
  if (B->b)
    pfree(i);
}
void excludeAll(Type *i, OtherType b){
  pfree(i);
}
void excludeStrict(Type *i, OtherType b){
  pfree(i);
}
