@pfree@
type t;
identifier f, i;
position p;

@@
t f(..., t i, ...) {
  <...
  pfree@p(i)
  ...>
}

@script:python@
f << pfree.f;
p << pfree.p;
t << pfree.t;

@@
print(f">{f}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column);
print("Use: pfree")
print(f"Type: {t}")
print(f"Return Type: {t}")

