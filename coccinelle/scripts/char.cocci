@pfree@
type t1;
identifier f, i;
position p;

@@
t1 f(..., char *i, ...) {
  <...
  pfree@p(i)
  ...>
}

@script:python@
f << pfree.f;
p << pfree.p;

@@
print(f">{f}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column);
print("Use: pfree")
print("Type: char *")

