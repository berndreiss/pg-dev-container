@freeing exists@
type rt, t;
identifier f, i;
position p;

@@
rt f(t i) {
  <+...
  __FUNCTION__@p(i)
  ...+>
}

@script:python@
f << freeing.f;
p << freeing.p;
t << freeing.t;
rt << freeing.rt;

@@
print(f">{f},{t}, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")
