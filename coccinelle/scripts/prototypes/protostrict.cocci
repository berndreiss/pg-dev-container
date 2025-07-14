@freeing0 forall@
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
f << freeing0.f;
p << freeing0.p;
t << freeing0.t2;
rt << freeing0.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing1 forall@
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
f << freeing1.f;
p << freeing1.p;
t << freeing1.t2;
rt << freeing1.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing2 forall@
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
f << freeing2.f;
p << freeing2.p;
t << freeing2.t2;
rt << freeing2.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing3 forall@
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
f << freeing3.f;
p << freeing3.p;
t << freeing3.t2;
rt << freeing3.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing4 forall@
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
f << freeing4.f;
p << freeing4.p;
t << freeing4.t2;
rt << freeing4.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing5 forall@
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
f << freeing5.f;
p << freeing5.p;
t << freeing5.t2;
rt << freeing5.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing6 forall@
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
f << freeing6.f;
p << freeing6.p;
t << freeing6.t2;
rt << freeing6.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing7 forall@
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
f << freeing7.f;
p << freeing7.p;
t << freeing7.t2;
rt << freeing7.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing8 forall@
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
f << freeing8.f;
p << freeing8.p;
t << freeing8.t2;
rt << freeing8.t1;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
