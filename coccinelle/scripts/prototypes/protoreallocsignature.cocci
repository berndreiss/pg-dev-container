@__METAFUNCTION__ exists@
type t1, t2, t3;
identifier f, i, j;
position p;

@@
t1 f(t2 i, t3 j) {
  <+...
  __FUNCTION__@p(i, j)
  ...+>
}

@script:python@
f << __METAFUNCTION__.f;
p << __METAFUNCTION__.p;
t << __METAFUNCTION__.t2;
rt << __METAFUNCTION__.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
