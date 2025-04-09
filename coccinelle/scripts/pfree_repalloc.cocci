@pfree@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  <...
  pfree@p(i)
  ...>
}

@script:python@
f << pfree.f;
p << pfree.p;
t << pfree.t2;

@@
print(p[0].file + ":" + p[0].line + ":" + p[0].column);
print("pfree")
print(f"{t}")
print(f">{f}")

@repalloc@
type t1;
identifier f;
type t2;
identifier i;
position p;

@@
t1 f (..., t2 i, ...){
  <...
  repalloc@p(i, ...)
  ...>
}

@script:python@
f << repalloc.f;
p << repalloc.p;
t << repalloc.t2;

@@
print(p[0].file + ":" + p[0].line + ":" + p[0].column);
print("repalloc")
print(f"{t}")
print(f">{f}")

