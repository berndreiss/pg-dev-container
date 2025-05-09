@__METAFUNCTION__12 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., __TYPE__ i, ...) {
  <+...
  if (i.a) {... __FUNCTION__@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << __METAFUNCTION__12.f;
p << __METAFUNCTION__12.p;
t << __METAFUNCTION__12.t2;
rt << __METAFUNCTION__12.t1;
a << __METAFUNCTION__12.a;
i << __METAFUNCTION__12.i;

@@
print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f", {i}.{a}")
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

@__METAFUNCTION__13 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., __TYPE__ i, ...) {
  <+...
  if (i.a) {... __FUNCTION__@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << __METAFUNCTION__13.f;
p << __METAFUNCTION__13.p;
t << __METAFUNCTION__13.t2;
rt << __METAFUNCTION__13.t1;
a << __METAFUNCTION__13.a;
i << __METAFUNCTION__13.i;

@@
print(f">{f},__PYTHONTYPE__, " + p[0].file + ":" + p[0].line + ":" + p[0].column + f", {i}.{a}")
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

