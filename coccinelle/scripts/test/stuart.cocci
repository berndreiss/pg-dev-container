@ bug exists @ expression E, E2; position p1, p2; @@
(
kfree@p1(E)
|
free@p1(E)
)
...
(
E = E2
|
E@p2
)

@script:python@
p << bug.p2;
@@
print(f"User after free {p[0].line}")
