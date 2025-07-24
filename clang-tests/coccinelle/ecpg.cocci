@rule1a@
expression param0, param1, param2, param3, ret;
statement S;
@@
ret = ecpg_check_PQresult(param0, param1, param2, param3);
(
  if (ret) S
|
  if (!ret) S  
|
+ if (!ret) param0 = NULL;
  S
)

@rule1b@
expression param0, param1, param2, param3;
identifier ret;
statement S;
@@
bool ret = ecpg_check_PQresult(param0, param1, param2, param3);
(
  if (ret) S
|
  if (!ret) S  
|
+ if (!ret) param0 = NULL;
  S
)

@rule2@
expression param0, param1, param2, param3;
@@

- ecpg_check_PQresult(param0, param1, param2, param3);
+ ret = ecpg_check_PQresult(param0, param1, param2, param3);
+ if (!ret) param = NULL;
