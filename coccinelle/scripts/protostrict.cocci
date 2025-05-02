@__METAFUNCTION__ forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., __TYPE__ i, ...) {
  ...
  when != if(...){ ... return ...;}
  __FUNCTION__@p(..., i, ...)
  <... when any
  __FUNCTION__(..., i, ...)
  ...>
}


@script:python@
f << __METAFUNCTION__.f;
p << __METAFUNCTION__.p;
t << __METAFUNCTION__.t2;
rt << __METAFUNCTION__.t1;

@@
print(f">{f},__PYTHONTYPE__")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: __FUNCTION__")
print(f"Ret. Type: {rt}")

