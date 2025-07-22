@freeing exists@
type rt, t1, t2;
identifier f, i, j;
position p;

@@
rt f(t1 i, t2 j) {
  <+...
  __FUNCTION__@p(i, j)
  ...+>
}

@script:python@
f << freeing.f;
p << freeing.p;
t << freeing.t1;
rt << freeing.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
