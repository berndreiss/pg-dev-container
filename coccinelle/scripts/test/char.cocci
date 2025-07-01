@pfree forall@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., t2 i, ...) {
  ...
  free@p(i)
  ...
}

@script:python@
f << pfree.f;
p << pfree.p;
rt << pfree.t1;

@@
print(f">{f}")
#print(p[0].file + ":" + p[0].line + ":" + p[0].column);
#print("Use: pfree")
#print("Type: char *")
#print(f"Return Type: {rt}")

