@pfree@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  <...
  (free@p(i) | i = realloc@p(i, ...))
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
print("Use: free")
print(f"Type: {t}")
print(f"Return Type: {rt}")

