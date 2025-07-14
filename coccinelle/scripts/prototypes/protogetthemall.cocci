@function exists@
type rt;
identifier f;
position p;

@@
rt f@p(...) {
  ...
}

@script:python@
f << function.f;
p << function.p;
rt << function.rt;

@@
print(f">{f}, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Ret. Type: {rt}")
