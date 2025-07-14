#include <stddef.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include "test.h"
//#include "otherfile.c"
//#include "PostgresTypes.h"

typedef struct TupleDescData{
  int tdrefcount;
}TupleDescData;
typedef struct TupleDescData *TupleDesc;
void DecrTupleDescRefCount(TupleDesc tupdesc);
void use_tupledesc(TupleDesc tupdesc);


typedef struct{}Path;
typedef struct{}RelOptInfo;

void use_path(Path *path){}
void add_partial_path(RelOptInfo *parent_rel, Path *new_path);
void pfree(void *);

typedef struct {} Bitmapset;
Bitmapset *bms_int_members(Bitmapset *a, const Bitmapset *b);
void use_bms(Bitmapset *a);
const Bitmapset * get_bms();
void DecrTupleDescRefCount(TupleDesc tupdesc){
  tupdesc->tdrefcount--; 
}

typedef struct {}TupleTableSlot;
typedef struct {}MinimalTupleStruct;
typedef MinimalTupleStruct * MinimalTuple;
typedef struct {}HeapTupleStruct;
typedef HeapTupleStruct * HeapTuple;

void ExecForceStoreMinimalTuple(MinimalTuple mtup, TupleTableSlot *slot, bool shouldFree);
void ExecForceStoreHeapTuple(HeapTuple mtup, TupleTableSlot *slot, bool shouldFree);
void useTuple(HeapTuple tuple);

int main(int argnum, char **args){
  //RelOptInfo *parent=malloc(sizeof(RelOptInfo));
  //Path *new_path = malloc(sizeof(Path));
  //add_partial_path(parent, new_path);
  //use_path(new_path);
   //TupleDesc tupdesc = palloc(sizeof(TupleDescData));
  //tupdesc->tdrefcount = 2;
  //DecrTupleDescRefCount(tupdesc);
  //use_tupledesc(tupdesc);
  //tupdesc->tdrefcount = 1;
  //DecrTupleDescRefCount(tupdesc); // expected-note{{Freeing function: DecrTupleDescRefCount}}
  //use_tupledesc(tupdesc); // expected-warning{{Attempt to use re
  //
    HeapTuple tuple = palloc(sizeof(HeapTuple));
  TupleTableSlot *slot = palloc(sizeof(TupleTableSlot));
  ExecForceStoreHeapTuple(tuple, slot, false);
  useTuple(tuple);
  ExecForceStoreHeapTuple(tuple, slot, argnum); // expected-note{{Freeing function: ExecForceStoreHeapTuple}}
  useTuple(tuple); // expected-warning{{Attempt to use potentially released memory}}


/*
int natts = 3; // Number of attributes

    // Allocate memory: base size + space for N attributes
    TupleDesc desc = palloc(sizeof(TupleDescData) + sizeof(CompactAttribute) * natts);
    if (!desc) {
        return 1;
    }

    // Initialize fields
    desc->natts = natts;
    desc->tdtypeid = 1234;
    desc->tdtypmod = -1;
    desc->tdrefcount = 1;  // Means "do not count references"
    desc->constr = NULL;

    // Initialize attributes
    for (int i = 0; i < natts; i++) {
        desc->compact_attrs[i].attcacheoff = -1;
        desc->compact_attrs[i].attlen = sizeof(int32);
        desc->compact_attrs[i].attbyval = true;
        desc->compact_attrs[i].attispackable = false;
        desc->compact_attrs[i].atthasmissing = false;
        desc->compact_attrs[i].attisdropped = false;
        desc->compact_attrs[i].attgenerated = false;
        desc->compact_attrs[i].attnullability = 0;
        desc->compact_attrs[i].attalignby = 4;
    }

    DecrTupleDescRefCount(desc);
    // Access a field like tdrefcount
    if (desc->tdrefcount == -1) {
        printf("Refcount is disabled\n");
    } else {
        printf("Refcount: %d\n", desc->tdrefcount);
  }

    // Cleanup
    free(desc);
    return 0;*/
}

