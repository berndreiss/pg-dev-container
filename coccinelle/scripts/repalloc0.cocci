@repalloc@
type t1;
identifier f;
type t2;
identifier i;
position p;

@@
t1 f (..., t2 i, ...){
  <...
  repalloc0@p(i, ...)
  ...>
}

@script:python@
f << repalloc.f;
p << repalloc.p;
t << repalloc.t2;
rt << repalloc.t1;
@@
print(f">{f}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print("Use: repalloc0")
print(f"Type: {t}")
print(f"Return Type: {rt}")

