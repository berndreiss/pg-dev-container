@freeing0 exists@
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
f << freeing0.f;
p << freeing0.p;
t << freeing0.t2;
rt << freeing0.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing1 exists@
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
f << freeing1.f;
p << freeing1.p;
t << freeing1.t2;
rt << freeing1.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
