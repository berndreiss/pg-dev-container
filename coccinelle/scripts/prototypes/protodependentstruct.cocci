@__METAFUNCTION__14 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__14.f;
p << __METAFUNCTION__14.p;
t << __METAFUNCTION__14.t2;
rt << __METAFUNCTION__14.t1;
a << __METAFUNCTION__14.a;
i << __METAFUNCTION__14.i;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f", {i}.{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__15 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << __METAFUNCTION__15.f;
p << __METAFUNCTION__15.p;
t << __METAFUNCTION__15.t2;
rt << __METAFUNCTION__15.t1;
a << __METAFUNCTION__15.a;
i << __METAFUNCTION__15.i;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f", {i}.{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

