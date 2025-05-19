@ bug exists @
expression E; position p1, p2;
@@
(
free@p1(E);
|
pfree@p1(E);
)
...
E@p2
@ script:python @
e << bug.E; p1 << bug.p1; p2 << bug.p2;
@@
from tempfile import mkstemp
from os import write, close
template = open('bugs/useafterfree.templ', 'r')
content = ''.join(template.readlines())
template.close()
subexpr = [e]
redef = [str(x) + " = E" for x in subexpr]
p1 = p1[0] # only use principal location
p2 = p2[0] # ditto
content = content.replace('[EXPR]', str(e))
content = content.replace('[REDEF]', '\n|\n '.join(redef))
content = content.replace('[P1:FILE]', p1.file)
content = content.replace('[P1:LINE]', p1.line)
content = content.replace('[P1:COLUMN]', p1.column)
content = content.replace('[P2:FILE]', p2.file)
content = content.replace('[P2:LINE]', p2.line)
content = content.replace('[P2:COLUMN]', p2.column)
f, p = mkstemp('.cocci', 'uaf', 'bugs/tmp')
write(f, content.encode('utf-8'))
close(f)
scr = open('bugs/useafterfree.bug', 'a')
#scr.write('-cocci_file %s %s\n' % (p, p1.file)) # batch file
scr.write('%s\n' % p) # batch file
scr.close()
