@test@
expression E;
position p;
constant c;
@@

pfree@p(E, c);

@script:python@
e << test.E;
p << test.p;
c << test.c;
@@
print(f"Expression: {c}");
