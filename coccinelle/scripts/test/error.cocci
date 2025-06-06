@pfree@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  <...
      pfree@p(i)
      ...
      ereport(...)
      
  ...>
}

@script:python@
f << pfree.f;
p << pfree.p;
t << pfree.t2;
rt << pfree.t1;

@@
print(f">{f}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print("Use: pfree")
print(f"Type: {t}")
print(f"Return Type: {rt}")

