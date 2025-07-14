@freeing0 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
  ... when != if(...){ ... return ...;}
  __FUNCTION__@p(..., i, ...)
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}

@script:python@
f << freeing0.f;
p << freeing0.p;
t << freeing0.t;
rt << freeing0.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing1 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing1.t;
rt << freeing1.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing2 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing2.t;
rt << freeing2.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing3 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing3.t;
rt << freeing3.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing4 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing4.t;
rt << freeing4.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing5 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing5.t;
rt << freeing5.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing6 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing6.t;
rt << freeing6.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing7 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing7.t;
rt << freeing7.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing8 forall@
type rt, t;
identifier f, i;
position p;

@@
rt f(..., t i, ...) {
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
t << freeing8.t;
rt << freeing8.rt;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column)
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")
