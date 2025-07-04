@exists@
type t;
identifier x;
@@
t x;
...
-free(x);
+pfree(x);

