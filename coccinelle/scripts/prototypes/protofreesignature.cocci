@freeing exists@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(t2 i) {
  <+...
  __FUNCTION__@p(i)
  ...+>
}

@script:python@
f << freeing.f;
p << freeing.p;
t << freeing.t2;
rt << freeing.t1;

@@
print(f">{f},{t}, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")
