@free forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  when != if(...){ ... return ...;}
  free@p(..., i, ...)
  <... when any
  free(..., i, ...)
  ...>
}


@script:python@
f << free.f;

@@
print(f">{f}")

