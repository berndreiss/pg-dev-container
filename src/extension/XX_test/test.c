#include "postgres.h"

#include "nodes/bitmapset.h"
#include "utils/builtins.h"


#include <stdlib.h>

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
    addSet = bms_add_member(addSet, 128);

    bms_add_member(addSet, 0); 
    //ERROR
    //->return pointer contains newly allocated space
    //old pointer is dangling
    bms_add_member(addSet, 128);

    //use addSet one more time to invoke error
    bms_add_member(addSet, 0); 
    PG_RETURN_VOID();
    //_______BMS_ADD_MEMBER_______


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
