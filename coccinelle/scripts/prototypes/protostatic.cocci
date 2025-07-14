@freeing exists@
type t1, t2;
identifier f, i;
position p;

@@
static t1 f(..., t2 i, ...) {
  <+...
  __FUNCTION__@p(..., i, ...)
  ...+>
}

@script:python@
f << freeing.f;
p << freeing.p;
t << freeing.t2;
rt << freeing.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
