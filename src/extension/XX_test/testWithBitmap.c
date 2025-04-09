#include "postgres.h"

#include "nodes/bitmapset.h"
#include "utils/builtins.h"

#define WORDNUM(x)	((x) / BITS_PER_BITMAPWORD)
#define BITNUM(x)	((x) % BITS_PER_BITMAPWORD)

#define BITMAPSET_SIZE(nwords)	\
	(offsetof(Bitmapset, words) + (nwords) * sizeof(bitmapword))

#define RIGHTMOST_ONE(x) ((signedbitmapword) (x) & -((signedbitmapword) (x)))

#define HAS_MULTIPLE_ONES(x)	((bitmapword) RIGHTMOST_ONE(x) != (x))

/* Select appropriate bit-twiddling functions for bitmap word size */
#if BITS_PER_BITMAPWORD == 32
#define bmw_leftmost_one_pos(w)		pg_leftmost_one_pos32(w)
#define bmw_rightmost_one_pos(w)	pg_rightmost_one_pos32(w)
#define bmw_popcount(w)				pg_popcount32(w)
#elif BITS_PER_BITMAPWORD == 64
#define bmw_leftmost_one_pos(w)		pg_leftmost_one_pos64(w)
#define bmw_rightmost_one_pos(w)	pg_rightmost_one_pos64(w)
#define bmw_popcount(w)				pg_popcount64(w)
#else
#error "invalid BITS_PER_BITMAPWORD"
#endif

static bool bms_is_empty_internal(const Bitmapset *a);


static bool
bms_is_empty_internal(const Bitmapset *a)
{
	int			nwords;
	int			wordnum;

	nwords = a->nwords;
	for (wordnum = 0; wordnum < nwords; wordnum++)
	{
		bitmapword	w = a->words[wordnum];

		if (w != 0)
			return false;
	}
	return true;
}



Bitmapset *
bms_del_member(Bitmapset *a, int x)
{
	int			wordnum,
				bitnum;

	if (x < 0)
		elog(ERROR, "negative bitmapset member not allowed");
	if (a == NULL)
		return NULL;
	wordnum = WORDNUM(x);
	bitnum = BITNUM(x);
	if (wordnum < a->nwords)
		a->words[wordnum] &= ~((bitmapword) 1 << bitnum);
	/* If we computed an empty result, we must return NULL */
	if (bms_is_empty_internal(a))
	{
		pfree(a);
		return NULL;
	}
	return a;
}

Bitmapset *
bms_add_members(Bitmapset *a, const Bitmapset *b)
{
	Bitmapset  *result;
	const Bitmapset *other;
	int			otherlen;
	int			i;

	/* Handle cases where either input is NULL */
	if (a == NULL)
		return bms_copy(b);
	if (b == NULL)
		return a;
	/* Identify shorter and longer input; copy the longer one if needed */
	if (a->nwords < b->nwords)
	{
		result = bms_copy(b);
		other = a;
	}
	else
	{
		result = a;
		other = b;
	}
	/* And union the shorter input into the result */
	otherlen = other->nwords;
	for (i = 0; i < otherlen; i++)
		result->words[i] |= other->words[i];
	if (result != a)
		pfree(a);
	return result;
}

Bitmapset *
bms_add_range(Bitmapset *a, int lower, int upper)
{
	int			lwordnum,
				lbitnum,
				uwordnum,
				ushiftbits,
				wordnum;

	/* do nothing if nothing is called for, without further checking */
	if (upper < lower)
		return a;

	if (lower < 0)
		elog(ERROR, "negative bitmapset member not allowed");
	uwordnum = WORDNUM(upper);

	if (a == NULL)
	{
		a = (Bitmapset *) palloc0(BITMAPSET_SIZE(uwordnum + 1));
		a->type = T_Bitmapset;
		a->nwords = uwordnum + 1;
	}
	else if (uwordnum >= a->nwords)
	{
		int			oldnwords = a->nwords;
		int			i;

		/* ensure we have enough words to store the upper bit */
		a = (Bitmapset *) repalloc(a, BITMAPSET_SIZE(uwordnum + 1));
		a->nwords = uwordnum + 1;
		/* zero out the enlarged portion */
		for (i = oldnwords; i < a->nwords; i++)
			a->words[i] = 0;
	}

	wordnum = lwordnum = WORDNUM(lower);

	lbitnum = BITNUM(lower);
	ushiftbits = BITS_PER_BITMAPWORD - (BITNUM(upper) + 1);

	/*
	 * Special case when lwordnum is the same as uwordnum we must perform the
	 * upper and lower masking on the word.
	 */
	if (lwordnum == uwordnum)
	{
		a->words[lwordnum] |= ~(bitmapword) (((bitmapword) 1 << lbitnum) - 1)
			& (~(bitmapword) 0) >> ushiftbits;
	}
	else
	{
		/* turn on lbitnum and all bits left of it */
		a->words[wordnum++] |= ~(bitmapword) (((bitmapword) 1 << lbitnum) - 1);

		/* turn on all bits for any intermediate words */
		while (wordnum < uwordnum)
			a->words[wordnum++] = ~(bitmapword) 0;

		/* turn on upper's bit and all bits right of it. */
		a->words[uwordnum] |= (~(bitmapword) 0) >> ushiftbits;
	}

	return a;
}

Bitmapset *
bms_int_members(Bitmapset *a, const Bitmapset *b)
{
	int			shortlen;
	int			i;

	/* Handle cases where either input is NULL */
	if (a == NULL)
		return NULL;
	if (b == NULL)
	{
		pfree(a);
		return NULL;
	}
	/* Intersect b into a; we need never copy */
	shortlen = Min(a->nwords, b->nwords);
	for (i = 0; i < shortlen; i++)
		a->words[i] &= b->words[i];
	for (; i < a->nwords; i++)
		a->words[i] = 0;
	/* If we computed an empty result, we must return NULL */
	if (bms_is_empty_internal(a))
	{
		pfree(a);
		return NULL;
	}
	return a;
}

Bitmapset *
bms_del_members(Bitmapset *a, const Bitmapset *b)
{
	int			shortlen;
	int			i;

	/* Handle cases where either input is NULL */
	if (a == NULL)
		return NULL;
	if (b == NULL)
		return a;
	/* Remove b's bits from a; we need never copy */
	shortlen = Min(a->nwords, b->nwords);
	for (i = 0; i < shortlen; i++)
		a->words[i] &= ~b->words[i];
	/* If we computed an empty result, we must return NULL */
	if (bms_is_empty_internal(a))
	{
		pfree(a);
		return NULL;
	}
	return a;
}

Bitmapset *
bms_join(Bitmapset *a, Bitmapset *b)
{
	Bitmapset  *result;
	Bitmapset  *other;
	int			otherlen;
	int			i;

	/* Handle cases where either input is NULL */
	if (a == NULL)
		return b;
	if (b == NULL)
		return a;
	/* Identify shorter and longer input; use longer one as result */
	if (a->nwords < b->nwords)
	{
		result = b;
		other = a;
	}
	else
	{
		result = a;
		other = b;
	}
	/* And union the shorter input into the result */
	otherlen = other->nwords;
	for (i = 0; i < otherlen; i++)
		result->words[i] |= other->words[i];
	if (other != result)		/* pure paranoia */
		pfree(other);
	return result;
}

Bitmapset *
bms_add_member(Bitmapset *a, int x)
{
	int			wordnum,
				bitnum;

	if (x < 0)
		elog(ERROR, "negative bitmapset member not allowed");
	if (a == NULL)
		return bms_make_singleton(x);
	wordnum = WORDNUM(x);
	bitnum = BITNUM(x);

	/* enlarge the set if necessary */
	if (wordnum >= a->nwords)
	{
		int			oldnwords = a->nwords;
		int			i;

		a = (Bitmapset *) repalloc(a, BITMAPSET_SIZE(wordnum + 1));
		a->nwords = wordnum + 1;
		/* zero out the enlarged portion */
		for (i = oldnwords; i < a->nwords; i++)
			a->words[i] = 0;
	}

	a->words[wordnum] |= ((bitmapword) 1 << bitnum);
	return a;
}

char *testFunc(char *a){
	char *b = (char*) malloc(sizeof(char)*(strlen(a) +1));
	free(a);
	return b;

}

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(bms_test);

Datum bms_test(PG_FUNCTION_ARGS);

Datum bms_test(PG_FUNCTION_ARGS)
{
    //Sets that stay unmodified
    Bitmapset *set;
    Bitmapset *otherSet;
    //Sets we will modify to produce errors
    Bitmapset *addSet;
    Bitmapset *addsSet;
    Bitmapset *addsRangeSet;

	char *a = (char *) malloc(sizeof(char)*6)
	testFunc(a);
    //int i;

    //set = bms_make_singleton(0);
    //otherSet = bms_make_singleton(1);
    //addSet = bms_make_singleton(0);

    //should not throw a warning
    //if (bms_is_member(PG_GETARG_INT32(0), addSet))
    //{
       //ereport(ERROR,
         //       (errcode(ERRCODE_DATA_CORRUPTED),
           //      errmsg("MEMBER")));
    //}


//***************************************************************************** */


    //_______BMS_ADD_MEMBER_______

    addSet = bms_make_singleton(0);

    //NO ERROR 
    //->set is the same as return value
    bms_add_member(addSet, 1);
    
    //NO ERROR
    //->return value is assigned  
    addSet = bms_add_member(addSet, 200);

    bms_add_member(addSet, 0); 
    //ERROR
    //->return pointer contains newly allocated space
    //old pointer is dangling
    //bms_add_member(addSet, 128);

    //use addSet one more time to invoke error
    //bms_add_member(addSet, 0); 

    //_______BMS_ADD_MEMBER_______
    PG_RETURN_VOID();


//***************************************************************************** */


    //BELOW ARE FUNCTIONS THAT TAKE BITMAPSET AS A PARAMETER AND
    //RETURN A BITMAPSET AS WELL AS THE CHECKERS EXPECTED BEHAVIOUR
    //beware that 'const type' is treated differently than 'type'
    //by the compiler
   
    //NO ERROR
    //does not modify input
    //bms_copy(set);

    //NO ERROR
    //does not modify input
    //bms_union(set, otherSet);

    //NO ERROR
    //does not modify input
    //bms_intersect(set, otherSet);

    //NO ERROR
    //does not modify input
    //bms_difference(set, otherSet);

    //use set and otherset one more time to invoke errors
    //bms_add_member(set, 0);
    //bms_add_member(otherSet, 0);


//***************************************************************************** */

    //RECYCLING FUNCTIONS, STYLE -> foo = operation(foo, x);

//***************************************************************************** */


    //_______BMS_ADD_MEMBERS_______
    
    //addsSet = bms_make_singleton(0);
    
    //NO ERROR
    //->return value is the same as addsSet
    //bms_add_members(addsSet, NULL);

    //NO ERROR
    //addsSet = bms_add_members(addsSet, otherSet);

    //make addsSet bigger than other
    //addsSet = bms_make_singleton(64);
    //otherSet = bms_make_singleton(34);
    //NO ERROR
    //->return value is the same as addsSet
    //bms_add_members(addsSet, otherSet);
    
    //make other bigger
    //addsSet = bms_make_singleton(32);
    //otherSet = bms_make_singleton(64);
    //ERROR
    //-> addsSet is freed!
    //bms_add_members(addsSet, otherSet);


    //use addsSet to invoke error
    //bms_add_members(addsSet, addsSet);
    //addsSet = NULL;
    
    //ERROR 
    //->return value is different from addsSet
    //bms_add_members(addsSet, otherSet);

    //_______BMS_ADD_MEMBERS_______

    //use addsSet to invoke error
    //bms_add_members(addsSet, otherSet);


    //PG_RETURN_VOID();
//***************************************************************************** */


    //_______BMS_ADD_RANGE_______

    //addsRangeSet = bms_make_singleton(32);

    //NO ERROR
    //->return value is the same as addsRangeSet
    //bms_add_range(addsRangeSet, 0, 5);//potentially reallocates memory of set
        
    //NO ERROR
    //addsRangeSet = bms_add_range(addsRangeSet, 0, 64);

    //ERROR
    //->addsRangeSet is being reallocated
    //bms_add_range(addsRangeSet, 0, 128);
    
    //use addsRangeSet to invoke error
    //bms_add_range(addsRangeSet, 0, 1);

    //addsRangeSet = NULL;

    //ERROR 
    //->addsRangeSet is different from result but also NULL 
    //bms_add_range(addsRangeSet, 0, 128);

    //_______BMS_ADD_RANGE_______


//***************************************************************************** */


    //_______BMS_INT_MEMBERS_______

    //throws warning
    //bms_int_members(set, otherSet);//potentially frees set!
    //does not throw a warning
    //set = bms_int_members(set, otherSet);

    //_______BMS_INT_MEMBERS_______


//***************************************************************************** */


    //_______BMS_DEL_MEMBER_______

    //throws warning
    //bms_del_member(set, 0);//potentially frees set!
    //does not throw a warning
    //set = bms_del_member(set, 1);
    
    //_______BMS_DEL_MEMBER_______


//***************************************************************************** */


    //_______BMS_DEL_MEMBERS_______

    //throws warning
    //bms_del_members(set, otherSet);//potentially frees set!
    //does not throw a warning
    //set = bms_del_members(set, otherSet);

    //_______BMS_DEL_MEMBERS_______


//***************************************************************************** */


    //_______BMS_JOIN_______
    
    //throws warning (why doesn't it?)
    //bms_join(set, otherSet);//one of set or otherset is potentially freed

    //_______BMS_JOIN_______
    
    
//***************************************************************************** */

    //bms_add_member(otherSet, 0); 
    //bms_add_member(addSet, 0); 
    //bms_add_member(addsSet, 0); 
    //bms_add_member(addsRangeSet, 0); 
    
    bms_free(set);
    bms_free(otherSet); 
    bms_free(addSet); 
    bms_free(addsSet); 
    bms_free(addsRangeSet); 
    
    PG_RETURN_VOID();
}
