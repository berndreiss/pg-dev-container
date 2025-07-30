#include "postgres.h"

#include "nodes/bitmapset.h"
#include "utils/builtins.h"

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(count_via_bms);

Datum count_via_bms(PG_FUNCTION_ARGS);

Datum count_via_bms(PG_FUNCTION_ARGS)
{
    Bitmapset *set;

    set = bms_make_singleton(0);

    PG_TRY();
    {
    bms_free(set);
    }
    PG_CATCH();
    {
    bms_free(set);
    }
    PG_END_TRY();

    PG_RETURN_INT32(0);
}
