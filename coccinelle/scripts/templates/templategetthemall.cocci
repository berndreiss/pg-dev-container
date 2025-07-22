@func exists@
type rt;
identifier f;
position p;

@@
rt f@p(...) {
  ...
}

@script:python@
f << func.f;
p << func.p;
rt << func.rt;

@@
print(f">{f}, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Ret. Type: {rt}")
