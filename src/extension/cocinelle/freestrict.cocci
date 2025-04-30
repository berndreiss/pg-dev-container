@anyid@
type t1, t2;
identifier id;
identifier param;
position p;

@@
t1 id (t2 param) {  
    <...
    free@p(param);
    ...>
}

@script:python@
t2 << anyid.t2;
p << anyid.p;
id << anyid.id;
param << anyid.param;
@@

tilde = "~"

print(p[0].file + ":" + p[0].line + ":" + p[0].column + ": " + id);
