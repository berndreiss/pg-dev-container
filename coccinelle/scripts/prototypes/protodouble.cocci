@__METAFUNCTION__0 exists@
type t1, t2;
  identifier f, i, j;
position p;

@@
t1 f(..., t2 i, ..., t2 j, ...) {
  <+...
  __FUNCTION__@p(..., i, ...)
  ...+>
}

@script:python@
f << __METAFUNCTION__0.f;
p << __METAFUNCTION__0.p;
t << __METAFUNCTION__0.t2;
rt << __METAFUNCTION__0.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__1 exists@
type t1, t2;
identifier f, i, j;
position p; 

@@
t1 f(..., t2 i, ..., t2 j, ...) {
  <+...
  __FUNCTION__@p(..., j, ...)
  ...+>
}

@script:python@
f << __METAFUNCTION__1.f;
p << __METAFUNCTION__1.p;
t << __METAFUNCTION__1.t2;
rt << __METAFUNCTION__1.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
