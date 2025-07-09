#include <stdint.h>
#define FLEXIBLE_ARRAY_MEMBER   /* empty */
typedef unsigned int Oid;
typedef int16_t int16;
typedef int32_t int32;
typedef uint8_t uint8;
typedef uint16_t uint16;

typedef int16 AttrNumber;
typedef struct AttrDefault
{
    AttrNumber  adnum;
    char       *adbin;          /* nodeToString representation of expr */
} AttrDefault;

typedef struct ConstrCheck
{
    char       *ccname;
    char       *ccbin;          /* nodeToString representation of expr */
    bool        ccenforced;
    bool        ccvalid;
    bool        ccnoinherit;    /* this is a non-inheritable constraint */
} ConstrCheck;

typedef struct TupleConstr
{
    AttrDefault *defval;        /* array */
    ConstrCheck *check;         /* array */
    struct AttrMissing *missing;    /* missing attributes values, NULL if none */
    uint16      num_defval;
    uint16      num_check;
    bool        has_not_null;   /* any not-null, including not valid ones */
    bool        has_generated_stored;
    bool        has_generated_virtual;
} TupleConstr;
 
typedef struct CompactAttribute
{
    int32       attcacheoff;    /* fixed offset into tuple, if known, or -1 */
    int16       attlen;         /* attr len in bytes or -1 = varlen, -2 =
                                 * cstring */
    bool        attbyval;       /* as FormData_pg_attribute.attbyval */
    bool        attispackable;  /* FormData_pg_attribute.attstorage !=
                                 * TYPSTORAGE_PLAIN */
    bool        atthasmissing;  /* as FormData_pg_attribute.atthasmissing */
    bool        attisdropped;   /* as FormData_pg_attribute.attisdropped */
    bool        attgenerated;   /* FormData_pg_attribute.attgenerated != '\0' */
    char        attnullability; /* status of not-null constraint, see below */
    uint8       attalignby;     /* alignment requirement in bytes */
} CompactAttribute;

typedef struct TupleDescData
{
    int         natts;          /* number of attributes in the tuple */
    Oid         tdtypeid;       /* composite type ID for tuple type */
    int32       tdtypmod;       /* typmod for tuple type */
    int         tdrefcount;     /* reference count, or -1 if not counting */
    TupleConstr *constr;        /* constraints, or NULL if none */
    /* compact_attrs[N] is the compact metadata of Attribute Number N+1 */
    CompactAttribute compact_attrs[FLEXIBLE_ARRAY_MEMBER];
}           TupleDescData;
typedef struct TupleDescData *TupleDesc;
 
