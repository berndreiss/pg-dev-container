@test@
expression E;
position p;
@@

printf@p(E);

@script:python@
e << test.E;
p << test.p;
@@
print(f"Expression: {e}");
