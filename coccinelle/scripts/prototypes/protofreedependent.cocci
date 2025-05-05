@__METAFUNCTION__0 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., __TYPE__ i, ..., t3 b, ...) {
  <+...
  if (b) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__0.f;
p << __METAFUNCTION__0.p;
t << __METAFUNCTION__0.t2;
rt << __METAFUNCTION__0.t1;
b << __METAFUNCTION__0.b;

@@
print(f">{f},__PYTHONTYPE__, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

@__METAFUNCTION__1 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., __TYPE__ i, ...) {
  <+...
  if (b) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__1.f;
p << __METAFUNCTION__1.p;
t << __METAFUNCTION__1.t2;
rt << __METAFUNCTION__1.t1;
b << __METAFUNCTION__1.b;

@@
print(f">{f},__PYTHONTYPE__, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

@__METAFUNCTION__2 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., __TYPE__ i, ..., t3 b, ...) {
  <+...
  if (b->a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__2.f;
p << __METAFUNCTION__2.p;
t << __METAFUNCTION__2.t2;
rt << __METAFUNCTION__2.t1;
b << __METAFUNCTION__2.b;
a << __METAFUNCTION__2.a;

@@
print(f">{f},__PYTHONTYPE__, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

@__METAFUNCTION__3 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., __TYPE__ i, ...) {
  <+...
  if (b->a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__3.f;
p << __METAFUNCTION__3.p;
t << __METAFUNCTION__3.t2;
rt << __METAFUNCTION__3.t1;
b << __METAFUNCTION__3.b;
a << __METAFUNCTION__3.a;

@@
print(f">{f},__PYTHONTYPE__, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

@__METAFUNCTION__4 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., __TYPE__ i, ..., t3 b, ...) {
  <+...
  if (b.a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__4.f;
p << __METAFUNCTION__4.p;
t << __METAFUNCTION__4.t2;
rt << __METAFUNCTION__4.t1;
b << __METAFUNCTION__4.b;
a << __METAFUNCTION__4.a;

@@
print(f">{f},__PYTHONTYPE__, {b}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

@__METAFUNCTION__5 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., __TYPE__ i, ...) {
  <+...
  if (b.a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__5.f;
p << __METAFUNCTION__5.p;
t << __METAFUNCTION__5.t2;
rt << __METAFUNCTION__5.t1;
b << __METAFUNCTION__5.b;
a << __METAFUNCTION__5.a;

@@
print(f">{f},__PYTHONTYPE__, {b}.{a}")
print(f">{f},__PYTHONTYPE__")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

