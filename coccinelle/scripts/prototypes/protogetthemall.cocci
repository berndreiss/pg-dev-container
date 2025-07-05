@func exists@
type t;
identifier f;
position p;

@@
t f@p(...) {
  ...
}

@script:python@
f << func.f;
p << func.p;
rt << func.t;

@@
print(f">{f}, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Ret. Type: {rt}")
