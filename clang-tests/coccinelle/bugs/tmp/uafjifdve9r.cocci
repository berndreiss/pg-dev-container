@ script:python @ @@
#cocci.set_expr_cfg()
cocci.include_match(True)
@ bug using "../../redef.iso" exists @
expression E1, E;
position p1, p2;
@@
(
free@p1(E1);
|
pfree@p1(E1);
)
...
(
str = E
|
E1@p2
)
@ script:python @
e << bug.E1; p1 << bug.p1; p2 << bug.p2;
@@
p1 = p1[0]
p2 = p2[0]
if str(e) == 'str' and p1.file == '../test.c' and \
    p1.line == '31' and p1.column == '4' and \
    p2.file == '../test.c' and p2.line == '39' \
    and p2.column == '9':
    #cocci.register_match(True, [(p1, 'Free'), (p2, 'Use')])
    print(f"{p1.file}:{p1.line}:{p1.column}: warning: Free")
    print(f"{p2.file}:{p2.line}:{p2.column}: warning: Use")
