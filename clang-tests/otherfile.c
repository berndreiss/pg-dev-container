#include "test.h"
#include "otherfile.h"
#include <stdlib.h>
void otherFileFree(void *p){
	pfree(p);
}
