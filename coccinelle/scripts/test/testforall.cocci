@free forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NULL) {... return ...;}
  ... when != if(...){ ... return ...;}
  free@p(..., i, ...)
  <... when any
  free(i)
  ...>
}


@script:python@
f << free.f;

@@
print(f" >{f}")

@free1 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ... when != if(...){ ... return ...;}
  free@p(..., i, ...)
  <... when any
  free(i)
  ...>
}


@script:python@
f << free1.f;

@@
print(f" >{f}")

@free2 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ... when != if(...){ ... return ...;}
  if (i){...
  free@p(..., i, ...)
  ...}
  <... when any
  free(i)
  ...>
}


@script:python@
f << free2.f;

@@
print(f" >{f}")

