@test forall@
type t1, t2;
identifier f, i;
position p;
@@
t1 f(...) {
  ...
  if (!i){...
  pfree@p(i, ...);
  ...}
  ...
}

@script:python@
p << test.p;
@@
print(p[0].line);
