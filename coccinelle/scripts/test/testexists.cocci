@free exists@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  free@p(..., i, ...)
  ...+>
}

@script:python@
f << free.f;

@@
print(f">{f}")

