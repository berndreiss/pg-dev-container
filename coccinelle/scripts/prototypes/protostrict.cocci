@__METAFUNCTION__0 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ... when != if(...){ ... return ...;}
  __FUNCTION__@p(..., i, ...)
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__0.f;
p << __METAFUNCTION__0.p;
t << __METAFUNCTION__0.t2;
rt << __METAFUNCTION__0.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__1 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NULL) {... return ...;}
  ... when != if(...){ ... return ...;}
  __FUNCTION__@p(..., i, ...)
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__1.f;
p << __METAFUNCTION__1.p;
t << __METAFUNCTION__1.t2;
rt << __METAFUNCTION__1.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__2 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ... when != if(...){ ... return ...;}
  if (i){...
  __FUNCTION__@p(..., i, ...)
  ...}
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__2.f;
p << __METAFUNCTION__2.p;
t << __METAFUNCTION__2.t2;
rt << __METAFUNCTION__2.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__3 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NULL) {... return ...;}
  ... when != if(...){ ... return ...;}
  if (i){...
  __FUNCTION__@p(..., i, ...)
  ...}
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__3.f;
p << __METAFUNCTION__3.p;
t << __METAFUNCTION__3.t2;
rt << __METAFUNCTION__3.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__4 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ... when != if(...){ ... return ...;}
  while (i){...
  __FUNCTION__@p(..., i, ...)
  ...}
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__4.f;
p << __METAFUNCTION__4.p;
t << __METAFUNCTION__4.t2;
rt << __METAFUNCTION__4.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__5 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NULL) {... return ...;}
  ... when != if(...){ ... return ...;}
  while (i){...
  __FUNCTION__@p(..., i, ...)
  ...}
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__5.f;
p << __METAFUNCTION__5.p;
t << __METAFUNCTION__5.t2;
rt << __METAFUNCTION__5.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__6 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NIL) {... return ...;}
  ... when != if(...){ ... return ...;}
  __FUNCTION__@p(..., i, ...)
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__6.f;
p << __METAFUNCTION__6.p;
t << __METAFUNCTION__6.t2;
rt << __METAFUNCTION__6.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__7 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NIL) {... return ...;}
  ... when != if(...){ ... return ...;}
  if (i){...
  __FUNCTION__@p(..., i, ...)
  ...}
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__7.f;
p << __METAFUNCTION__7.p;
t << __METAFUNCTION__7.t2;
rt << __METAFUNCTION__7.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@__METAFUNCTION__8 forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  if (i == NIL) {... return ...;}
  ... when != if(...){ ... return ...;}
  while (i){...
  __FUNCTION__@p(..., i, ...)
  ...}
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << __METAFUNCTION__8.f;
p << __METAFUNCTION__8.p;
t << __METAFUNCTION__8.t2;
rt << __METAFUNCTION__8.t1;

@@
if t == __TYPE__:
  print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
