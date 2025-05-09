@free0 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... free@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << free0.f;
i << free0.i;

@@
print(f" >{f}, {i}")

@free1 exists@
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

@free2 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... free@p(..., i, ...) ...}
  else {...}
  ...+>
}

@script:python@
f << free2.f;
i << free2.i;

@@
print(f" >{f}, {i}")

@free3 exists@
expression val;
type t1, t2, t3;
identifier f, i, b, a;
position p;
binary_operator op;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+... 
  if
  (
  (val == b->a) 
  |
  (b->a == val) 
  )
  {... free@p(..., i, ...) ...}
  ...+>
}


@script:python@
f << free3.f;
i << free3.i;

@@
print(f" >{f}, {i}")


@free4 exists@
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

@free5 exists@
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


@free6 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f( ..., struct SOME i, ...) {
  ...
	  if (i.a) {... free@p(..., i, ...) ...}
  <... when any
  free(i)
  ...>
}

@script:python@
f << free6.f;
i << free6.i;

@@
print(f" >{f}, {i}")


