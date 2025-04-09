@anyid@
type t;
identifier id;
identifier param;
position p;

@@
t id (t param) {  
    ...
    param@p = 1;
    ...
}

@script:python@
t << anyid.t;
p << anyid.p;
id << anyid.id;
param << anyid.param;
@@

tilde = "~"

print(p[0].file + ":" + p[0].line + ":" + p[0].column + ": \033[93m warning: \033[0m some warning message")
print(f">>  {t} {id}({t} {param}) {{" + "\n" +  

">>    ···\n" +
f">>    {param} = 1;\n" +
">>    \033[32m^" + tilde*(len(param)-1+4) + "\033[0m\n" +
">>    ···\n" +
f">>  }}")
