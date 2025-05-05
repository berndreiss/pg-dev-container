@free0 forall@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... pfree@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << free0.f;
i << free0.i;

@@
print(f" >{f}, {i}")

@free1 forall@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  ...
  if (b) {... free@p(..., i, ...) ...}
  <... when any
  free(i)
  ...>
}

@script:python@
f << free1.f;
i << free1.i;

@@
print(f" >{f}, {i}")

@free2 forall@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  ...
  if (b->a) {... free@p(..., i, ...) ...}
  <... when any
  free(i)
  ...>
}

@script:python@
f << free2.f;
i << free2.i;

@@
print(f" >{f}, {i}")

@free3 forall@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  ...
  if (b->a) {... free@p(..., i, ...) ...}
  <... when any
  free(i)
  ...>
}

@script:python@
f << free3.f;
i << free3.i;

@@
print(f" >{f}, {i}")


@free4 forall@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  ...
  if (b.a) {... free@p(..., i, ...) ...}
  <... when any
  free(i)
  ...>
}

@script:python@
f << free4.f;
i << free4.i;

@@
print(f" >{f}, {i}")

@free5 forall@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  ...
  if (b.a) {... free@p(..., i, ...) ...}
  <... when any
  free(i)
  ...>
}

@script:python@
f << free5.f;
i << free5.i;

@@
print(f" >{f}, {i}")


