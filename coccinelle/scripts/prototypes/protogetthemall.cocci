@function exists@
type t;
identifier f;
position p;

@@
t f@p(...) {
  ...
}

@script:python@
f << function.f;
p << function.p;
rt << function.t;

@@
print(f">{f}, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Ret. Type: {rt}")
