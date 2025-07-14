@freeing0 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << freeing0.f;
p << freeing0.p;
t << freeing0.t2;
rt << freeing0.t1;
b << freeing0.b;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing1 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << freeing1.f;
p << freeing1.p;
t << freeing1.t2;
rt << freeing1.t1;
b << freeing1.b;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing2 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << freeing2.f;
p << freeing2.p;
t << freeing2.t2;
rt << freeing2.t1;
b << freeing2.b;
a << freeing2.a;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + F",{b}->{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing3 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << freeing3.f;
p << freeing3.p;
t << freeing3.t2;
rt << freeing3.t1;
b << freeing3.b;
a << freeing3.a;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}->{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing4 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << freeing4.f;
p << freeing4.p;
t << freeing4.t2;
rt << freeing4.t1;
b << freeing4.b;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing7 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << freeing7.f;
p << freeing7.p;
t << freeing7.t2;
rt << freeing7.t1;
b << freeing7.b;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing8 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << freeing8.f;
p << freeing8.p;
t << freeing8.t2;
rt << freeing8.t1;
b << freeing8.b;
a << freeing8.a;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}->{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing9 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << freeing9.f;
p << freeing9.p;
t << freeing9.t2;
rt << freeing9.t1;
b << freeing9.b;
a << freeing9.a;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{b}.{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing10 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << freeing10.f;
p << freeing10.p;
t << freeing10.t2;
rt << freeing10.t1;
a << freeing10.a;
i << freeing10.i;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{i}->{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

@freeing11 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << freeing11.f;
p << freeing11.p;
t << freeing11.t2;
rt << freeing11.t1;
a << freeing11.a;
i << freeing11.i;

@@
if t == __CHECKTYPE__:
  print(f">{f},__PRINTTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f",{i}->{a}")
  print(f"Used: __FUNCTION__")
  print(f"Ret. Type: {rt}")

