@addCompiledLexeme00 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., TheLexeme * i, ..., t3 b, ...) {
  <+...
  if (b) {... addCompiledLexeme@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << addCompiledLexeme00.f;
p << addCompiledLexeme00.p;
t << addCompiledLexeme00.t2;
rt << addCompiledLexeme00.t1;
b << addCompiledLexeme00.b;

@@
print(f">{f},TheLexeme *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme01 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., TheLexeme * i, ...) {
  <+...
  if (b) {... addCompiledLexeme@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << addCompiledLexeme01.f;
p << addCompiledLexeme01.p;
t << addCompiledLexeme01.t2;
rt << addCompiledLexeme01.t1;
b << addCompiledLexeme01.b;

@@
print(f">{f},TheLexeme *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme02 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., TheLexeme * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... addCompiledLexeme@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << addCompiledLexeme02.f;
p << addCompiledLexeme02.p;
t << addCompiledLexeme02.t2;
rt << addCompiledLexeme02.t1;
b << addCompiledLexeme02.b;
a << addCompiledLexeme02.a;

@@
print(f">{f},TheLexeme *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme03 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., TheLexeme * i, ...) {
  <+...
  if (b->a) {... addCompiledLexeme@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << addCompiledLexeme03.f;
p << addCompiledLexeme03.p;
t << addCompiledLexeme03.t2;
rt << addCompiledLexeme03.t1;
b << addCompiledLexeme03.b;
a << addCompiledLexeme03.a;

@@
print(f">{f},TheLexeme *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme04 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., TheLexeme * i, ..., t3 b, ...) {
  <+...
  if (b) {... addCompiledLexeme@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << addCompiledLexeme04.f;
p << addCompiledLexeme04.p;
t << addCompiledLexeme04.t2;
rt << addCompiledLexeme04.t1;
b << addCompiledLexeme04.b;

@@
print(f">{f},TheLexeme *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme07 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., TheLexeme * i, ...) {
  <+...
  if (b) {... addCompiledLexeme@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << addCompiledLexeme07.f;
p << addCompiledLexeme07.p;
t << addCompiledLexeme07.t2;
rt << addCompiledLexeme07.t1;
b << addCompiledLexeme07.b;

@@
print(f">{f},TheLexeme *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme08 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., TheLexeme * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... addCompiledLexeme@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << addCompiledLexeme08.f;
p << addCompiledLexeme08.p;
t << addCompiledLexeme08.t2;
rt << addCompiledLexeme08.t1;
b << addCompiledLexeme08.b;
a << addCompiledLexeme08.a;

@@
print(f">{f},TheLexeme *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme09 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., TheLexeme * i, ...) {
  <+...
  if (b->a) {... addCompiledLexeme@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << addCompiledLexeme09.f;
p << addCompiledLexeme09.p;
t << addCompiledLexeme09.t2;
rt << addCompiledLexeme09.t1;
b << addCompiledLexeme09.b;
a << addCompiledLexeme09.a;

@@
print(f">{f},TheLexeme *, {b}.{a}")
print(f">{f},TheLexeme *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme010 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., TheLexeme * i, ...) {
  <+...
  if (i->a) {... addCompiledLexeme@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << addCompiledLexeme010.f;
p << addCompiledLexeme010.p;
t << addCompiledLexeme010.t2;
rt << addCompiledLexeme010.t1;
a << addCompiledLexeme010.a;
i << addCompiledLexeme010.i;

@@
print(f">{f},TheLexeme *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@addCompiledLexeme011 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., TheLexeme * i, ...) {
  <+...
  if (i->a) {... addCompiledLexeme@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << addCompiledLexeme011.f;
p << addCompiledLexeme011.p;
t << addCompiledLexeme011.t2;
rt << addCompiledLexeme011.t1;
a << addCompiledLexeme011.a;
i << addCompiledLexeme011.i;

@@
print(f">{f},TheLexeme *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: addCompiledLexeme")
print(f"Ret. Type: {rt}")

@bms_add_member10 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b) {... bms_add_member@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_member10.f;
p << bms_add_member10.p;
t << bms_add_member10.t2;
rt << bms_add_member10.t1;
b << bms_add_member10.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member11 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b) {... bms_add_member@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_member11.f;
p << bms_add_member11.p;
t << bms_add_member11.t2;
rt << bms_add_member11.t1;
b << bms_add_member11.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member12 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... bms_add_member@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_member12.f;
p << bms_add_member12.p;
t << bms_add_member12.t2;
rt << bms_add_member12.t1;
b << bms_add_member12.b;
a << bms_add_member12.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member13 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b->a) {... bms_add_member@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_member13.f;
p << bms_add_member13.p;
t << bms_add_member13.t2;
rt << bms_add_member13.t1;
b << bms_add_member13.b;
a << bms_add_member13.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member14 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b) {... bms_add_member@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_member14.f;
p << bms_add_member14.p;
t << bms_add_member14.t2;
rt << bms_add_member14.t1;
b << bms_add_member14.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member17 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b) {... bms_add_member@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_member17.f;
p << bms_add_member17.p;
t << bms_add_member17.t2;
rt << bms_add_member17.t1;
b << bms_add_member17.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member18 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... bms_add_member@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_member18.f;
p << bms_add_member18.p;
t << bms_add_member18.t2;
rt << bms_add_member18.t1;
b << bms_add_member18.b;
a << bms_add_member18.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member19 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b->a) {... bms_add_member@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_member19.f;
p << bms_add_member19.p;
t << bms_add_member19.t2;
rt << bms_add_member19.t1;
b << bms_add_member19.b;
a << bms_add_member19.a;

@@
print(f">{f},Bitmapset *, {b}.{a}")
print(f">{f},Bitmapset *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member110 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., Bitmapset * i, ...) {
  <+...
  if (i->a) {... bms_add_member@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_member110.f;
p << bms_add_member110.p;
t << bms_add_member110.t2;
rt << bms_add_member110.t1;
a << bms_add_member110.a;
i << bms_add_member110.i;

@@
print(f">{f},Bitmapset *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_member111 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., Bitmapset * i, ...) {
  <+...
  if (i->a) {... bms_add_member@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_member111.f;
p << bms_add_member111.p;
t << bms_add_member111.t2;
rt << bms_add_member111.t1;
a << bms_add_member111.a;
i << bms_add_member111.i;

@@
print(f">{f},Bitmapset *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_member")
print(f"Ret. Type: {rt}")

@bms_add_range20 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b) {... bms_add_range@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_range20.f;
p << bms_add_range20.p;
t << bms_add_range20.t2;
rt << bms_add_range20.t1;
b << bms_add_range20.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range21 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b) {... bms_add_range@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_range21.f;
p << bms_add_range21.p;
t << bms_add_range21.t2;
rt << bms_add_range21.t1;
b << bms_add_range21.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range22 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... bms_add_range@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_range22.f;
p << bms_add_range22.p;
t << bms_add_range22.t2;
rt << bms_add_range22.t1;
b << bms_add_range22.b;
a << bms_add_range22.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range23 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b->a) {... bms_add_range@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_range23.f;
p << bms_add_range23.p;
t << bms_add_range23.t2;
rt << bms_add_range23.t1;
b << bms_add_range23.b;
a << bms_add_range23.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range24 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b) {... bms_add_range@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_range24.f;
p << bms_add_range24.p;
t << bms_add_range24.t2;
rt << bms_add_range24.t1;
b << bms_add_range24.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range27 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b) {... bms_add_range@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_range27.f;
p << bms_add_range27.p;
t << bms_add_range27.t2;
rt << bms_add_range27.t1;
b << bms_add_range27.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range28 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... bms_add_range@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_range28.f;
p << bms_add_range28.p;
t << bms_add_range28.t2;
rt << bms_add_range28.t1;
b << bms_add_range28.b;
a << bms_add_range28.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range29 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b->a) {... bms_add_range@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_range29.f;
p << bms_add_range29.p;
t << bms_add_range29.t2;
rt << bms_add_range29.t1;
b << bms_add_range29.b;
a << bms_add_range29.a;

@@
print(f">{f},Bitmapset *, {b}.{a}")
print(f">{f},Bitmapset *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range210 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., Bitmapset * i, ...) {
  <+...
  if (i->a) {... bms_add_range@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_add_range210.f;
p << bms_add_range210.p;
t << bms_add_range210.t2;
rt << bms_add_range210.t1;
a << bms_add_range210.a;
i << bms_add_range210.i;

@@
print(f">{f},Bitmapset *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_add_range211 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., Bitmapset * i, ...) {
  <+...
  if (i->a) {... bms_add_range@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_add_range211.f;
p << bms_add_range211.p;
t << bms_add_range211.t2;
rt << bms_add_range211.t1;
a << bms_add_range211.a;
i << bms_add_range211.i;

@@
print(f">{f},Bitmapset *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_add_range")
print(f"Ret. Type: {rt}")

@bms_replace_members30 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b) {... bms_replace_members@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_replace_members30.f;
p << bms_replace_members30.p;
t << bms_replace_members30.t2;
rt << bms_replace_members30.t1;
b << bms_replace_members30.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members31 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b) {... bms_replace_members@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_replace_members31.f;
p << bms_replace_members31.p;
t << bms_replace_members31.t2;
rt << bms_replace_members31.t1;
b << bms_replace_members31.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members32 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... bms_replace_members@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_replace_members32.f;
p << bms_replace_members32.p;
t << bms_replace_members32.t2;
rt << bms_replace_members32.t1;
b << bms_replace_members32.b;
a << bms_replace_members32.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members33 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b->a) {... bms_replace_members@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_replace_members33.f;
p << bms_replace_members33.p;
t << bms_replace_members33.t2;
rt << bms_replace_members33.t1;
b << bms_replace_members33.b;
a << bms_replace_members33.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members34 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b) {... bms_replace_members@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_replace_members34.f;
p << bms_replace_members34.p;
t << bms_replace_members34.t2;
rt << bms_replace_members34.t1;
b << bms_replace_members34.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members37 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b) {... bms_replace_members@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_replace_members37.f;
p << bms_replace_members37.p;
t << bms_replace_members37.t2;
rt << bms_replace_members37.t1;
b << bms_replace_members37.b;

@@
print(f">{f},Bitmapset *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members38 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., Bitmapset * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... bms_replace_members@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_replace_members38.f;
p << bms_replace_members38.p;
t << bms_replace_members38.t2;
rt << bms_replace_members38.t1;
b << bms_replace_members38.b;
a << bms_replace_members38.a;

@@
print(f">{f},Bitmapset *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members39 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., Bitmapset * i, ...) {
  <+...
  if (b->a) {... bms_replace_members@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_replace_members39.f;
p << bms_replace_members39.p;
t << bms_replace_members39.t2;
rt << bms_replace_members39.t1;
b << bms_replace_members39.b;
a << bms_replace_members39.a;

@@
print(f">{f},Bitmapset *, {b}.{a}")
print(f">{f},Bitmapset *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members310 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., Bitmapset * i, ...) {
  <+...
  if (i->a) {... bms_replace_members@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << bms_replace_members310.f;
p << bms_replace_members310.p;
t << bms_replace_members310.t2;
rt << bms_replace_members310.t1;
a << bms_replace_members310.a;
i << bms_replace_members310.i;

@@
print(f">{f},Bitmapset *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@bms_replace_members311 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., Bitmapset * i, ...) {
  <+...
  if (i->a) {... bms_replace_members@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << bms_replace_members311.f;
p << bms_replace_members311.p;
t << bms_replace_members311.t2;
rt << bms_replace_members311.t1;
a << bms_replace_members311.a;
i << bms_replace_members311.i;

@@
print(f">{f},Bitmapset *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: bms_replace_members")
print(f"Ret. Type: {rt}")

@brin_copy_tuple40 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., BrinTuple * i, ..., t3 b, ...) {
  <+...
  if (b) {... brin_copy_tuple@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << brin_copy_tuple40.f;
p << brin_copy_tuple40.p;
t << brin_copy_tuple40.t2;
rt << brin_copy_tuple40.t1;
b << brin_copy_tuple40.b;

@@
print(f">{f},BrinTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple41 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., BrinTuple * i, ...) {
  <+...
  if (b) {... brin_copy_tuple@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << brin_copy_tuple41.f;
p << brin_copy_tuple41.p;
t << brin_copy_tuple41.t2;
rt << brin_copy_tuple41.t1;
b << brin_copy_tuple41.b;

@@
print(f">{f},BrinTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple42 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., BrinTuple * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... brin_copy_tuple@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << brin_copy_tuple42.f;
p << brin_copy_tuple42.p;
t << brin_copy_tuple42.t2;
rt << brin_copy_tuple42.t1;
b << brin_copy_tuple42.b;
a << brin_copy_tuple42.a;

@@
print(f">{f},BrinTuple *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple43 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., BrinTuple * i, ...) {
  <+...
  if (b->a) {... brin_copy_tuple@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << brin_copy_tuple43.f;
p << brin_copy_tuple43.p;
t << brin_copy_tuple43.t2;
rt << brin_copy_tuple43.t1;
b << brin_copy_tuple43.b;
a << brin_copy_tuple43.a;

@@
print(f">{f},BrinTuple *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple44 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., BrinTuple * i, ..., t3 b, ...) {
  <+...
  if (b) {... brin_copy_tuple@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << brin_copy_tuple44.f;
p << brin_copy_tuple44.p;
t << brin_copy_tuple44.t2;
rt << brin_copy_tuple44.t1;
b << brin_copy_tuple44.b;

@@
print(f">{f},BrinTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple47 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., BrinTuple * i, ...) {
  <+...
  if (b) {... brin_copy_tuple@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << brin_copy_tuple47.f;
p << brin_copy_tuple47.p;
t << brin_copy_tuple47.t2;
rt << brin_copy_tuple47.t1;
b << brin_copy_tuple47.b;

@@
print(f">{f},BrinTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple48 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., BrinTuple * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... brin_copy_tuple@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << brin_copy_tuple48.f;
p << brin_copy_tuple48.p;
t << brin_copy_tuple48.t2;
rt << brin_copy_tuple48.t1;
b << brin_copy_tuple48.b;
a << brin_copy_tuple48.a;

@@
print(f">{f},BrinTuple *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple49 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., BrinTuple * i, ...) {
  <+...
  if (b->a) {... brin_copy_tuple@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << brin_copy_tuple49.f;
p << brin_copy_tuple49.p;
t << brin_copy_tuple49.t2;
rt << brin_copy_tuple49.t1;
b << brin_copy_tuple49.b;
a << brin_copy_tuple49.a;

@@
print(f">{f},BrinTuple *, {b}.{a}")
print(f">{f},BrinTuple *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple410 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., BrinTuple * i, ...) {
  <+...
  if (i->a) {... brin_copy_tuple@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << brin_copy_tuple410.f;
p << brin_copy_tuple410.p;
t << brin_copy_tuple410.t2;
rt << brin_copy_tuple410.t1;
a << brin_copy_tuple410.a;
i << brin_copy_tuple410.i;

@@
print(f">{f},BrinTuple *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@brin_copy_tuple411 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., BrinTuple * i, ...) {
  <+...
  if (i->a) {... brin_copy_tuple@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << brin_copy_tuple411.f;
p << brin_copy_tuple411.p;
t << brin_copy_tuple411.t2;
rt << brin_copy_tuple411.t1;
a << brin_copy_tuple411.a;
i << brin_copy_tuple411.i;

@@
print(f">{f},BrinTuple *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: brin_copy_tuple")
print(f"Ret. Type: {rt}")

@core_yyrealloc50 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... core_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << core_yyrealloc50.f;
p << core_yyrealloc50.p;
t << core_yyrealloc50.t2;
rt << core_yyrealloc50.t1;
b << core_yyrealloc50.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc51 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... core_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << core_yyrealloc51.f;
p << core_yyrealloc51.p;
t << core_yyrealloc51.t2;
rt << core_yyrealloc51.t1;
b << core_yyrealloc51.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc52 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... core_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << core_yyrealloc52.f;
p << core_yyrealloc52.p;
t << core_yyrealloc52.t2;
rt << core_yyrealloc52.t1;
b << core_yyrealloc52.b;
a << core_yyrealloc52.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc53 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... core_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << core_yyrealloc53.f;
p << core_yyrealloc53.p;
t << core_yyrealloc53.t2;
rt << core_yyrealloc53.t1;
b << core_yyrealloc53.b;
a << core_yyrealloc53.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc54 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... core_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << core_yyrealloc54.f;
p << core_yyrealloc54.p;
t << core_yyrealloc54.t2;
rt << core_yyrealloc54.t1;
b << core_yyrealloc54.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc57 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... core_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << core_yyrealloc57.f;
p << core_yyrealloc57.p;
t << core_yyrealloc57.t2;
rt << core_yyrealloc57.t1;
b << core_yyrealloc57.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc58 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... core_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << core_yyrealloc58.f;
p << core_yyrealloc58.p;
t << core_yyrealloc58.t2;
rt << core_yyrealloc58.t1;
b << core_yyrealloc58.b;
a << core_yyrealloc58.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc59 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... core_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << core_yyrealloc59.f;
p << core_yyrealloc59.p;
t << core_yyrealloc59.t2;
rt << core_yyrealloc59.t1;
b << core_yyrealloc59.b;
a << core_yyrealloc59.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc510 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... core_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << core_yyrealloc510.f;
p << core_yyrealloc510.p;
t << core_yyrealloc510.t2;
rt << core_yyrealloc510.t1;
a << core_yyrealloc510.a;
i << core_yyrealloc510.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc511 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... core_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << core_yyrealloc511.f;
p << core_yyrealloc511.p;
t << core_yyrealloc511.t2;
rt << core_yyrealloc511.t1;
a << core_yyrealloc511.a;
i << core_yyrealloc511.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc512 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... core_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << core_yyrealloc512.f;
p << core_yyrealloc512.p;
t << core_yyrealloc512.t2;
rt << core_yyrealloc512.t1;
a << core_yyrealloc512.a;
i << core_yyrealloc512.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@core_yyrealloc513 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... core_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << core_yyrealloc513.f;
p << core_yyrealloc513.p;
t << core_yyrealloc513.t2;
rt << core_yyrealloc513.t1;
a << core_yyrealloc513.a;
i << core_yyrealloc513.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: core_yyrealloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc60 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... ecpg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << ecpg_realloc60.f;
p << ecpg_realloc60.p;
t << ecpg_realloc60.t2;
rt << ecpg_realloc60.t1;
b << ecpg_realloc60.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc61 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... ecpg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << ecpg_realloc61.f;
p << ecpg_realloc61.p;
t << ecpg_realloc61.t2;
rt << ecpg_realloc61.t1;
b << ecpg_realloc61.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc62 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... ecpg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << ecpg_realloc62.f;
p << ecpg_realloc62.p;
t << ecpg_realloc62.t2;
rt << ecpg_realloc62.t1;
b << ecpg_realloc62.b;
a << ecpg_realloc62.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc63 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... ecpg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << ecpg_realloc63.f;
p << ecpg_realloc63.p;
t << ecpg_realloc63.t2;
rt << ecpg_realloc63.t1;
b << ecpg_realloc63.b;
a << ecpg_realloc63.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc64 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... ecpg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << ecpg_realloc64.f;
p << ecpg_realloc64.p;
t << ecpg_realloc64.t2;
rt << ecpg_realloc64.t1;
b << ecpg_realloc64.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc67 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... ecpg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << ecpg_realloc67.f;
p << ecpg_realloc67.p;
t << ecpg_realloc67.t2;
rt << ecpg_realloc67.t1;
b << ecpg_realloc67.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc68 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... ecpg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << ecpg_realloc68.f;
p << ecpg_realloc68.p;
t << ecpg_realloc68.t2;
rt << ecpg_realloc68.t1;
b << ecpg_realloc68.b;
a << ecpg_realloc68.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc69 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... ecpg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << ecpg_realloc69.f;
p << ecpg_realloc69.p;
t << ecpg_realloc69.t2;
rt << ecpg_realloc69.t1;
b << ecpg_realloc69.b;
a << ecpg_realloc69.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc610 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... ecpg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << ecpg_realloc610.f;
p << ecpg_realloc610.p;
t << ecpg_realloc610.t2;
rt << ecpg_realloc610.t1;
a << ecpg_realloc610.a;
i << ecpg_realloc610.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc611 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... ecpg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << ecpg_realloc611.f;
p << ecpg_realloc611.p;
t << ecpg_realloc611.t2;
rt << ecpg_realloc611.t1;
a << ecpg_realloc611.a;
i << ecpg_realloc611.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc612 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... ecpg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << ecpg_realloc612.f;
p << ecpg_realloc612.p;
t << ecpg_realloc612.t2;
rt << ecpg_realloc612.t1;
a << ecpg_realloc612.a;
i << ecpg_realloc612.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@ecpg_realloc613 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... ecpg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << ecpg_realloc613.f;
p << ecpg_realloc613.p;
t << ecpg_realloc613.t2;
rt << ecpg_realloc613.t1;
a << ecpg_realloc613.a;
i << ecpg_realloc613.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: ecpg_realloc")
print(f"Ret. Type: {rt}")

@erealloc70 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... erealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << erealloc70.f;
p << erealloc70.p;
t << erealloc70.t2;
rt << erealloc70.t1;
b << erealloc70.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc71 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... erealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << erealloc71.f;
p << erealloc71.p;
t << erealloc71.t2;
rt << erealloc71.t1;
b << erealloc71.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc72 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... erealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << erealloc72.f;
p << erealloc72.p;
t << erealloc72.t2;
rt << erealloc72.t1;
b << erealloc72.b;
a << erealloc72.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc73 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... erealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << erealloc73.f;
p << erealloc73.p;
t << erealloc73.t2;
rt << erealloc73.t1;
b << erealloc73.b;
a << erealloc73.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc74 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... erealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << erealloc74.f;
p << erealloc74.p;
t << erealloc74.t2;
rt << erealloc74.t1;
b << erealloc74.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc77 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... erealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << erealloc77.f;
p << erealloc77.p;
t << erealloc77.t2;
rt << erealloc77.t1;
b << erealloc77.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc78 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... erealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << erealloc78.f;
p << erealloc78.p;
t << erealloc78.t2;
rt << erealloc78.t1;
b << erealloc78.b;
a << erealloc78.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc79 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... erealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << erealloc79.f;
p << erealloc79.p;
t << erealloc79.t2;
rt << erealloc79.t1;
b << erealloc79.b;
a << erealloc79.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc710 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... erealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << erealloc710.f;
p << erealloc710.p;
t << erealloc710.t2;
rt << erealloc710.t1;
a << erealloc710.a;
i << erealloc710.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc711 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... erealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << erealloc711.f;
p << erealloc711.p;
t << erealloc711.t2;
rt << erealloc711.t1;
a << erealloc711.a;
i << erealloc711.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc712 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... erealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << erealloc712.f;
p << erealloc712.p;
t << erealloc712.t2;
rt << erealloc712.t1;
a << erealloc712.a;
i << erealloc712.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@erealloc713 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... erealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << erealloc713.f;
p << erealloc713.p;
t << erealloc713.t2;
rt << erealloc713.t1;
a << erealloc713.a;
i << erealloc713.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: erealloc")
print(f"Ret. Type: {rt}")

@gistjoinvector80 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., IndexTuple * i, ..., t3 b, ...) {
  <+...
  if (b) {... gistjoinvector@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << gistjoinvector80.f;
p << gistjoinvector80.p;
t << gistjoinvector80.t2;
rt << gistjoinvector80.t1;
b << gistjoinvector80.b;

@@
print(f">{f},IndexTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector81 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., IndexTuple * i, ...) {
  <+...
  if (b) {... gistjoinvector@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << gistjoinvector81.f;
p << gistjoinvector81.p;
t << gistjoinvector81.t2;
rt << gistjoinvector81.t1;
b << gistjoinvector81.b;

@@
print(f">{f},IndexTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector82 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., IndexTuple * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... gistjoinvector@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << gistjoinvector82.f;
p << gistjoinvector82.p;
t << gistjoinvector82.t2;
rt << gistjoinvector82.t1;
b << gistjoinvector82.b;
a << gistjoinvector82.a;

@@
print(f">{f},IndexTuple *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector83 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., IndexTuple * i, ...) {
  <+...
  if (b->a) {... gistjoinvector@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << gistjoinvector83.f;
p << gistjoinvector83.p;
t << gistjoinvector83.t2;
rt << gistjoinvector83.t1;
b << gistjoinvector83.b;
a << gistjoinvector83.a;

@@
print(f">{f},IndexTuple *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector84 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., IndexTuple * i, ..., t3 b, ...) {
  <+...
  if (b) {... gistjoinvector@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << gistjoinvector84.f;
p << gistjoinvector84.p;
t << gistjoinvector84.t2;
rt << gistjoinvector84.t1;
b << gistjoinvector84.b;

@@
print(f">{f},IndexTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector87 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., IndexTuple * i, ...) {
  <+...
  if (b) {... gistjoinvector@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << gistjoinvector87.f;
p << gistjoinvector87.p;
t << gistjoinvector87.t2;
rt << gistjoinvector87.t1;
b << gistjoinvector87.b;

@@
print(f">{f},IndexTuple *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector88 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., IndexTuple * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... gistjoinvector@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << gistjoinvector88.f;
p << gistjoinvector88.p;
t << gistjoinvector88.t2;
rt << gistjoinvector88.t1;
b << gistjoinvector88.b;
a << gistjoinvector88.a;

@@
print(f">{f},IndexTuple *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector89 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., IndexTuple * i, ...) {
  <+...
  if (b->a) {... gistjoinvector@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << gistjoinvector89.f;
p << gistjoinvector89.p;
t << gistjoinvector89.t2;
rt << gistjoinvector89.t1;
b << gistjoinvector89.b;
a << gistjoinvector89.a;

@@
print(f">{f},IndexTuple *, {b}.{a}")
print(f">{f},IndexTuple *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector810 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., IndexTuple * i, ...) {
  <+...
  if (i->a) {... gistjoinvector@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << gistjoinvector810.f;
p << gistjoinvector810.p;
t << gistjoinvector810.t2;
rt << gistjoinvector810.t1;
a << gistjoinvector810.a;
i << gistjoinvector810.i;

@@
print(f">{f},IndexTuple *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@gistjoinvector811 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., IndexTuple * i, ...) {
  <+...
  if (i->a) {... gistjoinvector@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << gistjoinvector811.f;
p << gistjoinvector811.p;
t << gistjoinvector811.t2;
rt << gistjoinvector811.t1;
a << gistjoinvector811.a;
i << gistjoinvector811.i;

@@
print(f">{f},IndexTuple *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: gistjoinvector")
print(f"Ret. Type: {rt}")

@growalloc90 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... growalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << growalloc90.f;
p << growalloc90.p;
t << growalloc90.t2;
rt << growalloc90.t1;
b << growalloc90.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc91 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... growalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << growalloc91.f;
p << growalloc91.p;
t << growalloc91.t2;
rt << growalloc91.t1;
b << growalloc91.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc92 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... growalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << growalloc92.f;
p << growalloc92.p;
t << growalloc92.t2;
rt << growalloc92.t1;
b << growalloc92.b;
a << growalloc92.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc93 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... growalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << growalloc93.f;
p << growalloc93.p;
t << growalloc93.t2;
rt << growalloc93.t1;
b << growalloc93.b;
a << growalloc93.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc94 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... growalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << growalloc94.f;
p << growalloc94.p;
t << growalloc94.t2;
rt << growalloc94.t1;
b << growalloc94.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc97 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... growalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << growalloc97.f;
p << growalloc97.p;
t << growalloc97.t2;
rt << growalloc97.t1;
b << growalloc97.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc98 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... growalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << growalloc98.f;
p << growalloc98.p;
t << growalloc98.t2;
rt << growalloc98.t1;
b << growalloc98.b;
a << growalloc98.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc99 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... growalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << growalloc99.f;
p << growalloc99.p;
t << growalloc99.t2;
rt << growalloc99.t1;
b << growalloc99.b;
a << growalloc99.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc910 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... growalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << growalloc910.f;
p << growalloc910.p;
t << growalloc910.t2;
rt << growalloc910.t1;
a << growalloc910.a;
i << growalloc910.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc911 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... growalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << growalloc911.f;
p << growalloc911.p;
t << growalloc911.t2;
rt << growalloc911.t1;
a << growalloc911.a;
i << growalloc911.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc912 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... growalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << growalloc912.f;
p << growalloc912.p;
t << growalloc912.t2;
rt << growalloc912.t1;
a << growalloc912.a;
i << growalloc912.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@growalloc913 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... growalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << growalloc913.f;
p << growalloc913.p;
t << growalloc913.t2;
rt << growalloc913.t1;
a << growalloc913.a;
i << growalloc913.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: growalloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc100 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc100.f;
p << jsonpath_yyrealloc100.p;
t << jsonpath_yyrealloc100.t2;
rt << jsonpath_yyrealloc100.t1;
b << jsonpath_yyrealloc100.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc101 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc101.f;
p << jsonpath_yyrealloc101.p;
t << jsonpath_yyrealloc101.t2;
rt << jsonpath_yyrealloc101.t1;
b << jsonpath_yyrealloc101.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc102 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc102.f;
p << jsonpath_yyrealloc102.p;
t << jsonpath_yyrealloc102.t2;
rt << jsonpath_yyrealloc102.t1;
b << jsonpath_yyrealloc102.b;
a << jsonpath_yyrealloc102.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc103 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc103.f;
p << jsonpath_yyrealloc103.p;
t << jsonpath_yyrealloc103.t2;
rt << jsonpath_yyrealloc103.t1;
b << jsonpath_yyrealloc103.b;
a << jsonpath_yyrealloc103.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc104 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc104.f;
p << jsonpath_yyrealloc104.p;
t << jsonpath_yyrealloc104.t2;
rt << jsonpath_yyrealloc104.t1;
b << jsonpath_yyrealloc104.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc107 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc107.f;
p << jsonpath_yyrealloc107.p;
t << jsonpath_yyrealloc107.t2;
rt << jsonpath_yyrealloc107.t1;
b << jsonpath_yyrealloc107.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc108 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc108.f;
p << jsonpath_yyrealloc108.p;
t << jsonpath_yyrealloc108.t2;
rt << jsonpath_yyrealloc108.t1;
b << jsonpath_yyrealloc108.b;
a << jsonpath_yyrealloc108.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc109 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc109.f;
p << jsonpath_yyrealloc109.p;
t << jsonpath_yyrealloc109.t2;
rt << jsonpath_yyrealloc109.t1;
b << jsonpath_yyrealloc109.b;
a << jsonpath_yyrealloc109.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc1010 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc1010.f;
p << jsonpath_yyrealloc1010.p;
t << jsonpath_yyrealloc1010.t2;
rt << jsonpath_yyrealloc1010.t1;
a << jsonpath_yyrealloc1010.a;
i << jsonpath_yyrealloc1010.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc1011 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc1011.f;
p << jsonpath_yyrealloc1011.p;
t << jsonpath_yyrealloc1011.t2;
rt << jsonpath_yyrealloc1011.t1;
a << jsonpath_yyrealloc1011.a;
i << jsonpath_yyrealloc1011.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc1012 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc1012.f;
p << jsonpath_yyrealloc1012.p;
t << jsonpath_yyrealloc1012.t2;
rt << jsonpath_yyrealloc1012.t1;
a << jsonpath_yyrealloc1012.a;
i << jsonpath_yyrealloc1012.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@jsonpath_yyrealloc1013 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... jsonpath_yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << jsonpath_yyrealloc1013.f;
p << jsonpath_yyrealloc1013.p;
t << jsonpath_yyrealloc1013.t2;
rt << jsonpath_yyrealloc1013.t1;
a << jsonpath_yyrealloc1013.a;
i << jsonpath_yyrealloc1013.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: jsonpath_yyrealloc")
print(f"Ret. Type: {rt}")

@pg_realloc110 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... pg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << pg_realloc110.f;
p << pg_realloc110.p;
t << pg_realloc110.t2;
rt << pg_realloc110.t1;
b << pg_realloc110.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc111 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... pg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << pg_realloc111.f;
p << pg_realloc111.p;
t << pg_realloc111.t2;
rt << pg_realloc111.t1;
b << pg_realloc111.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc112 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... pg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << pg_realloc112.f;
p << pg_realloc112.p;
t << pg_realloc112.t2;
rt << pg_realloc112.t1;
b << pg_realloc112.b;
a << pg_realloc112.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc113 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... pg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << pg_realloc113.f;
p << pg_realloc113.p;
t << pg_realloc113.t2;
rt << pg_realloc113.t1;
b << pg_realloc113.b;
a << pg_realloc113.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc114 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... pg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << pg_realloc114.f;
p << pg_realloc114.p;
t << pg_realloc114.t2;
rt << pg_realloc114.t1;
b << pg_realloc114.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc117 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... pg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << pg_realloc117.f;
p << pg_realloc117.p;
t << pg_realloc117.t2;
rt << pg_realloc117.t1;
b << pg_realloc117.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc118 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... pg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << pg_realloc118.f;
p << pg_realloc118.p;
t << pg_realloc118.t2;
rt << pg_realloc118.t1;
b << pg_realloc118.b;
a << pg_realloc118.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc119 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... pg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << pg_realloc119.f;
p << pg_realloc119.p;
t << pg_realloc119.t2;
rt << pg_realloc119.t1;
b << pg_realloc119.b;
a << pg_realloc119.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc1110 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... pg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << pg_realloc1110.f;
p << pg_realloc1110.p;
t << pg_realloc1110.t2;
rt << pg_realloc1110.t1;
a << pg_realloc1110.a;
i << pg_realloc1110.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc1111 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... pg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << pg_realloc1111.f;
p << pg_realloc1111.p;
t << pg_realloc1111.t2;
rt << pg_realloc1111.t1;
a << pg_realloc1111.a;
i << pg_realloc1111.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc1112 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... pg_realloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << pg_realloc1112.f;
p << pg_realloc1112.p;
t << pg_realloc1112.t2;
rt << pg_realloc1112.t1;
a << pg_realloc1112.a;
i << pg_realloc1112.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@pg_realloc1113 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... pg_realloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << pg_realloc1113.f;
p << pg_realloc1113.p;
t << pg_realloc1113.t2;
rt << pg_realloc1113.t1;
a << pg_realloc1113.a;
i << pg_realloc1113.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: pg_realloc")
print(f"Ret. Type: {rt}")

@repalloc0120 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... repalloc0@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc0120.f;
p << repalloc0120.p;
t << repalloc0120.t2;
rt << repalloc0120.t1;
b << repalloc0120.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0121 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... repalloc0@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc0121.f;
p << repalloc0121.p;
t << repalloc0121.t2;
rt << repalloc0121.t1;
b << repalloc0121.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0122 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... repalloc0@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc0122.f;
p << repalloc0122.p;
t << repalloc0122.t2;
rt << repalloc0122.t1;
b << repalloc0122.b;
a << repalloc0122.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0123 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... repalloc0@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc0123.f;
p << repalloc0123.p;
t << repalloc0123.t2;
rt << repalloc0123.t1;
b << repalloc0123.b;
a << repalloc0123.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0124 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... repalloc0@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc0124.f;
p << repalloc0124.p;
t << repalloc0124.t2;
rt << repalloc0124.t1;
b << repalloc0124.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0127 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... repalloc0@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc0127.f;
p << repalloc0127.p;
t << repalloc0127.t2;
rt << repalloc0127.t1;
b << repalloc0127.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0128 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... repalloc0@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc0128.f;
p << repalloc0128.p;
t << repalloc0128.t2;
rt << repalloc0128.t1;
b << repalloc0128.b;
a << repalloc0128.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc0129 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... repalloc0@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc0129.f;
p << repalloc0129.p;
t << repalloc0129.t2;
rt << repalloc0129.t1;
b << repalloc0129.b;
a << repalloc0129.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc01210 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... repalloc0@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc01210.f;
p << repalloc01210.p;
t << repalloc01210.t2;
rt << repalloc01210.t1;
a << repalloc01210.a;
i << repalloc01210.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc01211 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... repalloc0@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc01211.f;
p << repalloc01211.p;
t << repalloc01211.t2;
rt << repalloc01211.t1;
a << repalloc01211.a;
i << repalloc01211.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc01212 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... repalloc0@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc01212.f;
p << repalloc01212.p;
t << repalloc01212.t2;
rt << repalloc01212.t1;
a << repalloc01212.a;
i << repalloc01212.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc01213 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... repalloc0@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc01213.f;
p << repalloc01213.p;
t << repalloc01213.t2;
rt << repalloc01213.t1;
a << repalloc01213.a;
i << repalloc01213.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc0")
print(f"Ret. Type: {rt}")

@repalloc130 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc130.f;
p << repalloc130.p;
t << repalloc130.t2;
rt << repalloc130.t1;
b << repalloc130.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc131 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc131.f;
p << repalloc131.p;
t << repalloc131.t2;
rt << repalloc131.t1;
b << repalloc131.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc132 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc132.f;
p << repalloc132.p;
t << repalloc132.t2;
rt << repalloc132.t1;
b << repalloc132.b;
a << repalloc132.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc133 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc133.f;
p << repalloc133.p;
t << repalloc133.t2;
rt << repalloc133.t1;
b << repalloc133.b;
a << repalloc133.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc134 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc134.f;
p << repalloc134.p;
t << repalloc134.t2;
rt << repalloc134.t1;
b << repalloc134.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc137 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc137.f;
p << repalloc137.p;
t << repalloc137.t2;
rt << repalloc137.t1;
b << repalloc137.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc138 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc138.f;
p << repalloc138.p;
t << repalloc138.t2;
rt << repalloc138.t1;
b << repalloc138.b;
a << repalloc138.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc139 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc139.f;
p << repalloc139.p;
t << repalloc139.t2;
rt << repalloc139.t1;
b << repalloc139.b;
a << repalloc139.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc1310 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc1310.f;
p << repalloc1310.p;
t << repalloc1310.t2;
rt << repalloc1310.t1;
a << repalloc1310.a;
i << repalloc1310.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc1311 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc1311.f;
p << repalloc1311.p;
t << repalloc1311.t2;
rt << repalloc1311.t1;
a << repalloc1311.a;
i << repalloc1311.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc1312 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << repalloc1312.f;
p << repalloc1312.p;
t << repalloc1312.t2;
rt << repalloc1312.t1;
a << repalloc1312.a;
i << repalloc1312.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@repalloc1313 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << repalloc1313.f;
p << repalloc1313.p;
t << repalloc1313.t2;
rt << repalloc1313.t1;
a << repalloc1313.a;
i << repalloc1313.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: repalloc")
print(f"Ret. Type: {rt}")

@resize_intArrayType140 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., ArrayType * i, ..., t3 b, ...) {
  <+...
  if (b) {... resize_intArrayType@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << resize_intArrayType140.f;
p << resize_intArrayType140.p;
t << resize_intArrayType140.t2;
rt << resize_intArrayType140.t1;
b << resize_intArrayType140.b;

@@
print(f">{f},ArrayType *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType141 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., ArrayType * i, ...) {
  <+...
  if (b) {... resize_intArrayType@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << resize_intArrayType141.f;
p << resize_intArrayType141.p;
t << resize_intArrayType141.t2;
rt << resize_intArrayType141.t1;
b << resize_intArrayType141.b;

@@
print(f">{f},ArrayType *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType142 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., ArrayType * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... resize_intArrayType@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << resize_intArrayType142.f;
p << resize_intArrayType142.p;
t << resize_intArrayType142.t2;
rt << resize_intArrayType142.t1;
b << resize_intArrayType142.b;
a << resize_intArrayType142.a;

@@
print(f">{f},ArrayType *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType143 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., ArrayType * i, ...) {
  <+...
  if (b->a) {... resize_intArrayType@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << resize_intArrayType143.f;
p << resize_intArrayType143.p;
t << resize_intArrayType143.t2;
rt << resize_intArrayType143.t1;
b << resize_intArrayType143.b;
a << resize_intArrayType143.a;

@@
print(f">{f},ArrayType *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType144 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., ArrayType * i, ..., t3 b, ...) {
  <+...
  if (b) {... resize_intArrayType@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << resize_intArrayType144.f;
p << resize_intArrayType144.p;
t << resize_intArrayType144.t2;
rt << resize_intArrayType144.t1;
b << resize_intArrayType144.b;

@@
print(f">{f},ArrayType *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType147 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., ArrayType * i, ...) {
  <+...
  if (b) {... resize_intArrayType@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << resize_intArrayType147.f;
p << resize_intArrayType147.p;
t << resize_intArrayType147.t2;
rt << resize_intArrayType147.t1;
b << resize_intArrayType147.b;

@@
print(f">{f},ArrayType *, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType148 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., ArrayType * i, ..., t3 b, ...) {
  <+...
  if (b->a) {... resize_intArrayType@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << resize_intArrayType148.f;
p << resize_intArrayType148.p;
t << resize_intArrayType148.t2;
rt << resize_intArrayType148.t1;
b << resize_intArrayType148.b;
a << resize_intArrayType148.a;

@@
print(f">{f},ArrayType *, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType149 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., ArrayType * i, ...) {
  <+...
  if (b->a) {... resize_intArrayType@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << resize_intArrayType149.f;
p << resize_intArrayType149.p;
t << resize_intArrayType149.t2;
rt << resize_intArrayType149.t1;
b << resize_intArrayType149.b;
a << resize_intArrayType149.a;

@@
print(f">{f},ArrayType *, {b}.{a}")
print(f">{f},ArrayType *")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType1410 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., ArrayType * i, ...) {
  <+...
  if (i->a) {... resize_intArrayType@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << resize_intArrayType1410.f;
p << resize_intArrayType1410.p;
t << resize_intArrayType1410.t2;
rt << resize_intArrayType1410.t1;
a << resize_intArrayType1410.a;
i << resize_intArrayType1410.i;

@@
print(f">{f},ArrayType *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@resize_intArrayType1411 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., ArrayType * i, ...) {
  <+...
  if (i->a) {... resize_intArrayType@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << resize_intArrayType1411.f;
p << resize_intArrayType1411.p;
t << resize_intArrayType1411.t2;
rt << resize_intArrayType1411.t1;
a << resize_intArrayType1411.a;
i << resize_intArrayType1411.i;

@@
print(f">{f},ArrayType *, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: resize_intArrayType")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem150 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., SetConstraintState i, ..., t3 b, ...) {
  <+...
  if (b) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem150.f;
p << SetConstraintStateAddItem150.p;
t << SetConstraintStateAddItem150.t2;
rt << SetConstraintStateAddItem150.t1;
b << SetConstraintStateAddItem150.b;

@@
print(f">{f},SetConstraintState, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem151 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., SetConstraintState i, ...) {
  <+...
  if (b) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem151.f;
p << SetConstraintStateAddItem151.p;
t << SetConstraintStateAddItem151.t2;
rt << SetConstraintStateAddItem151.t1;
b << SetConstraintStateAddItem151.b;

@@
print(f">{f},SetConstraintState, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem152 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., SetConstraintState i, ..., t3 b, ...) {
  <+...
  if (b->a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem152.f;
p << SetConstraintStateAddItem152.p;
t << SetConstraintStateAddItem152.t2;
rt << SetConstraintStateAddItem152.t1;
b << SetConstraintStateAddItem152.b;
a << SetConstraintStateAddItem152.a;

@@
print(f">{f},SetConstraintState, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem153 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., SetConstraintState i, ...) {
  <+...
  if (b->a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem153.f;
p << SetConstraintStateAddItem153.p;
t << SetConstraintStateAddItem153.t2;
rt << SetConstraintStateAddItem153.t1;
b << SetConstraintStateAddItem153.b;
a << SetConstraintStateAddItem153.a;

@@
print(f">{f},SetConstraintState, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem154 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., SetConstraintState i, ..., t3 b, ...) {
  <+...
  if (b) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem154.f;
p << SetConstraintStateAddItem154.p;
t << SetConstraintStateAddItem154.t2;
rt << SetConstraintStateAddItem154.t1;
b << SetConstraintStateAddItem154.b;

@@
print(f">{f},SetConstraintState, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem157 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., SetConstraintState i, ...) {
  <+...
  if (b) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem157.f;
p << SetConstraintStateAddItem157.p;
t << SetConstraintStateAddItem157.t2;
rt << SetConstraintStateAddItem157.t1;
b << SetConstraintStateAddItem157.b;

@@
print(f">{f},SetConstraintState, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem158 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., SetConstraintState i, ..., t3 b, ...) {
  <+...
  if (b->a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem158.f;
p << SetConstraintStateAddItem158.p;
t << SetConstraintStateAddItem158.t2;
rt << SetConstraintStateAddItem158.t1;
b << SetConstraintStateAddItem158.b;
a << SetConstraintStateAddItem158.a;

@@
print(f">{f},SetConstraintState, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem159 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., SetConstraintState i, ...) {
  <+...
  if (b->a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem159.f;
p << SetConstraintStateAddItem159.p;
t << SetConstraintStateAddItem159.t2;
rt << SetConstraintStateAddItem159.t1;
b << SetConstraintStateAddItem159.b;
a << SetConstraintStateAddItem159.a;

@@
print(f">{f},SetConstraintState, {b}.{a}")
print(f">{f},SetConstraintState")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem1510 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., SetConstraintState i, ...) {
  <+...
  if (i->a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem1510.f;
p << SetConstraintStateAddItem1510.p;
t << SetConstraintStateAddItem1510.t2;
rt << SetConstraintStateAddItem1510.t1;
a << SetConstraintStateAddItem1510.a;
i << SetConstraintStateAddItem1510.i;

@@
print(f">{f},SetConstraintState, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem1511 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., SetConstraintState i, ...) {
  <+...
  if (i->a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem1511.f;
p << SetConstraintStateAddItem1511.p;
t << SetConstraintStateAddItem1511.t2;
rt << SetConstraintStateAddItem1511.t1;
a << SetConstraintStateAddItem1511.a;
i << SetConstraintStateAddItem1511.i;

@@
print(f">{f},SetConstraintState, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem1512 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., SetConstraintState i, ...) {
  <+...
  if (i.a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem1512.f;
p << SetConstraintStateAddItem1512.p;
t << SetConstraintStateAddItem1512.t2;
rt << SetConstraintStateAddItem1512.t1;
a << SetConstraintStateAddItem1512.a;
i << SetConstraintStateAddItem1512.i;

@@
print(f">{f},SetConstraintState, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SetConstraintStateAddItem1513 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., SetConstraintState i, ...) {
  <+...
  if (i.a) {... SetConstraintStateAddItem@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SetConstraintStateAddItem1513.f;
p << SetConstraintStateAddItem1513.p;
t << SetConstraintStateAddItem1513.t2;
rt << SetConstraintStateAddItem1513.t1;
a << SetConstraintStateAddItem1513.a;
i << SetConstraintStateAddItem1513.i;

@@
print(f">{f},SetConstraintState, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SetConstraintStateAddItem")
print(f"Ret. Type: {rt}")

@SPI_repalloc160 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... SPI_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SPI_repalloc160.f;
p << SPI_repalloc160.p;
t << SPI_repalloc160.t2;
rt << SPI_repalloc160.t1;
b << SPI_repalloc160.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc161 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... SPI_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SPI_repalloc161.f;
p << SPI_repalloc161.p;
t << SPI_repalloc161.t2;
rt << SPI_repalloc161.t1;
b << SPI_repalloc161.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc162 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... SPI_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SPI_repalloc162.f;
p << SPI_repalloc162.p;
t << SPI_repalloc162.t2;
rt << SPI_repalloc162.t1;
b << SPI_repalloc162.b;
a << SPI_repalloc162.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc163 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... SPI_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SPI_repalloc163.f;
p << SPI_repalloc163.p;
t << SPI_repalloc163.t2;
rt << SPI_repalloc163.t1;
b << SPI_repalloc163.b;
a << SPI_repalloc163.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc164 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... SPI_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SPI_repalloc164.f;
p << SPI_repalloc164.p;
t << SPI_repalloc164.t2;
rt << SPI_repalloc164.t1;
b << SPI_repalloc164.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc167 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... SPI_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SPI_repalloc167.f;
p << SPI_repalloc167.p;
t << SPI_repalloc167.t2;
rt << SPI_repalloc167.t1;
b << SPI_repalloc167.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc168 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... SPI_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SPI_repalloc168.f;
p << SPI_repalloc168.p;
t << SPI_repalloc168.t2;
rt << SPI_repalloc168.t1;
b << SPI_repalloc168.b;
a << SPI_repalloc168.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc169 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... SPI_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SPI_repalloc169.f;
p << SPI_repalloc169.p;
t << SPI_repalloc169.t2;
rt << SPI_repalloc169.t1;
b << SPI_repalloc169.b;
a << SPI_repalloc169.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc1610 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... SPI_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SPI_repalloc1610.f;
p << SPI_repalloc1610.p;
t << SPI_repalloc1610.t2;
rt << SPI_repalloc1610.t1;
a << SPI_repalloc1610.a;
i << SPI_repalloc1610.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc1611 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... SPI_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SPI_repalloc1611.f;
p << SPI_repalloc1611.p;
t << SPI_repalloc1611.t2;
rt << SPI_repalloc1611.t1;
a << SPI_repalloc1611.a;
i << SPI_repalloc1611.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc1612 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... SPI_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << SPI_repalloc1612.f;
p << SPI_repalloc1612.p;
t << SPI_repalloc1612.t2;
rt << SPI_repalloc1612.t1;
a << SPI_repalloc1612.a;
i << SPI_repalloc1612.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@SPI_repalloc1613 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... SPI_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << SPI_repalloc1613.f;
p << SPI_repalloc1613.p;
t << SPI_repalloc1613.t2;
rt << SPI_repalloc1613.t1;
a << SPI_repalloc1613.a;
i << SPI_repalloc1613.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: SPI_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc170 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... xml_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << xml_repalloc170.f;
p << xml_repalloc170.p;
t << xml_repalloc170.t2;
rt << xml_repalloc170.t1;
b << xml_repalloc170.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc171 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... xml_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << xml_repalloc171.f;
p << xml_repalloc171.p;
t << xml_repalloc171.t2;
rt << xml_repalloc171.t1;
b << xml_repalloc171.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc172 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... xml_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << xml_repalloc172.f;
p << xml_repalloc172.p;
t << xml_repalloc172.t2;
rt << xml_repalloc172.t1;
b << xml_repalloc172.b;
a << xml_repalloc172.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc173 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... xml_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << xml_repalloc173.f;
p << xml_repalloc173.p;
t << xml_repalloc173.t2;
rt << xml_repalloc173.t1;
b << xml_repalloc173.b;
a << xml_repalloc173.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc174 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... xml_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << xml_repalloc174.f;
p << xml_repalloc174.p;
t << xml_repalloc174.t2;
rt << xml_repalloc174.t1;
b << xml_repalloc174.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc177 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... xml_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << xml_repalloc177.f;
p << xml_repalloc177.p;
t << xml_repalloc177.t2;
rt << xml_repalloc177.t1;
b << xml_repalloc177.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc178 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... xml_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << xml_repalloc178.f;
p << xml_repalloc178.p;
t << xml_repalloc178.t2;
rt << xml_repalloc178.t1;
b << xml_repalloc178.b;
a << xml_repalloc178.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc179 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... xml_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << xml_repalloc179.f;
p << xml_repalloc179.p;
t << xml_repalloc179.t2;
rt << xml_repalloc179.t1;
b << xml_repalloc179.b;
a << xml_repalloc179.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc1710 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... xml_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << xml_repalloc1710.f;
p << xml_repalloc1710.p;
t << xml_repalloc1710.t2;
rt << xml_repalloc1710.t1;
a << xml_repalloc1710.a;
i << xml_repalloc1710.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc1711 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... xml_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << xml_repalloc1711.f;
p << xml_repalloc1711.p;
t << xml_repalloc1711.t2;
rt << xml_repalloc1711.t1;
a << xml_repalloc1711.a;
i << xml_repalloc1711.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc1712 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... xml_repalloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << xml_repalloc1712.f;
p << xml_repalloc1712.p;
t << xml_repalloc1712.t2;
rt << xml_repalloc1712.t1;
a << xml_repalloc1712.a;
i << xml_repalloc1712.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@xml_repalloc1713 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... xml_repalloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << xml_repalloc1713.f;
p << xml_repalloc1713.p;
t << xml_repalloc1713.t2;
rt << xml_repalloc1713.t1;
a << xml_repalloc1713.a;
i << xml_repalloc1713.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: xml_repalloc")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack180 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b) {... yyensure_buffer_stack@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack180.f;
p << yyensure_buffer_stack180.p;
t << yyensure_buffer_stack180.t2;
rt << yyensure_buffer_stack180.t1;
b << yyensure_buffer_stack180.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack181 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b) {... yyensure_buffer_stack@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack181.f;
p << yyensure_buffer_stack181.p;
t << yyensure_buffer_stack181.t2;
rt << yyensure_buffer_stack181.t1;
b << yyensure_buffer_stack181.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack182 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b->a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack182.f;
p << yyensure_buffer_stack182.p;
t << yyensure_buffer_stack182.t2;
rt << yyensure_buffer_stack182.t1;
b << yyensure_buffer_stack182.b;
a << yyensure_buffer_stack182.a;

@@
print(f">{f},yyscan_t, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack183 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b->a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack183.f;
p << yyensure_buffer_stack183.p;
t << yyensure_buffer_stack183.t2;
rt << yyensure_buffer_stack183.t1;
b << yyensure_buffer_stack183.b;
a << yyensure_buffer_stack183.a;

@@
print(f">{f},yyscan_t, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack184 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b) {... yyensure_buffer_stack@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack184.f;
p << yyensure_buffer_stack184.p;
t << yyensure_buffer_stack184.t2;
rt << yyensure_buffer_stack184.t1;
b << yyensure_buffer_stack184.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack187 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b) {... yyensure_buffer_stack@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack187.f;
p << yyensure_buffer_stack187.p;
t << yyensure_buffer_stack187.t2;
rt << yyensure_buffer_stack187.t1;
b << yyensure_buffer_stack187.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack188 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b->a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack188.f;
p << yyensure_buffer_stack188.p;
t << yyensure_buffer_stack188.t2;
rt << yyensure_buffer_stack188.t1;
b << yyensure_buffer_stack188.b;
a << yyensure_buffer_stack188.a;

@@
print(f">{f},yyscan_t, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack189 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b->a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack189.f;
p << yyensure_buffer_stack189.p;
t << yyensure_buffer_stack189.t2;
rt << yyensure_buffer_stack189.t1;
b << yyensure_buffer_stack189.b;
a << yyensure_buffer_stack189.a;

@@
print(f">{f},yyscan_t, {b}.{a}")
print(f">{f},yyscan_t")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack1810 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i->a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack1810.f;
p << yyensure_buffer_stack1810.p;
t << yyensure_buffer_stack1810.t2;
rt << yyensure_buffer_stack1810.t1;
a << yyensure_buffer_stack1810.a;
i << yyensure_buffer_stack1810.i;

@@
print(f">{f},yyscan_t, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack1811 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i->a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack1811.f;
p << yyensure_buffer_stack1811.p;
t << yyensure_buffer_stack1811.t2;
rt << yyensure_buffer_stack1811.t1;
a << yyensure_buffer_stack1811.a;
i << yyensure_buffer_stack1811.i;

@@
print(f">{f},yyscan_t, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack1812 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i.a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack1812.f;
p << yyensure_buffer_stack1812.p;
t << yyensure_buffer_stack1812.t2;
rt << yyensure_buffer_stack1812.t1;
a << yyensure_buffer_stack1812.a;
i << yyensure_buffer_stack1812.i;

@@
print(f">{f},yyscan_t, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yyensure_buffer_stack1813 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i.a) {... yyensure_buffer_stack@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyensure_buffer_stack1813.f;
p << yyensure_buffer_stack1813.p;
t << yyensure_buffer_stack1813.t2;
rt << yyensure_buffer_stack1813.t1;
a << yyensure_buffer_stack1813.a;
i << yyensure_buffer_stack1813.i;

@@
print(f">{f},yyscan_t, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyensure_buffer_stack")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer190 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b) {... yy_get_next_buffer@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yy_get_next_buffer190.f;
p << yy_get_next_buffer190.p;
t << yy_get_next_buffer190.t2;
rt << yy_get_next_buffer190.t1;
b << yy_get_next_buffer190.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer191 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b) {... yy_get_next_buffer@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yy_get_next_buffer191.f;
p << yy_get_next_buffer191.p;
t << yy_get_next_buffer191.t2;
rt << yy_get_next_buffer191.t1;
b << yy_get_next_buffer191.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer192 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b->a) {... yy_get_next_buffer@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yy_get_next_buffer192.f;
p << yy_get_next_buffer192.p;
t << yy_get_next_buffer192.t2;
rt << yy_get_next_buffer192.t1;
b << yy_get_next_buffer192.b;
a << yy_get_next_buffer192.a;

@@
print(f">{f},yyscan_t, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer193 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b->a) {... yy_get_next_buffer@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yy_get_next_buffer193.f;
p << yy_get_next_buffer193.p;
t << yy_get_next_buffer193.t2;
rt << yy_get_next_buffer193.t1;
b << yy_get_next_buffer193.b;
a << yy_get_next_buffer193.a;

@@
print(f">{f},yyscan_t, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer194 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b) {... yy_get_next_buffer@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yy_get_next_buffer194.f;
p << yy_get_next_buffer194.p;
t << yy_get_next_buffer194.t2;
rt << yy_get_next_buffer194.t1;
b << yy_get_next_buffer194.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer197 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b) {... yy_get_next_buffer@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yy_get_next_buffer197.f;
p << yy_get_next_buffer197.p;
t << yy_get_next_buffer197.t2;
rt << yy_get_next_buffer197.t1;
b << yy_get_next_buffer197.b;

@@
print(f">{f},yyscan_t, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer198 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., yyscan_t i, ..., t3 b, ...) {
  <+...
  if (b->a) {... yy_get_next_buffer@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yy_get_next_buffer198.f;
p << yy_get_next_buffer198.p;
t << yy_get_next_buffer198.t2;
rt << yy_get_next_buffer198.t1;
b << yy_get_next_buffer198.b;
a << yy_get_next_buffer198.a;

@@
print(f">{f},yyscan_t, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer199 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., yyscan_t i, ...) {
  <+...
  if (b->a) {... yy_get_next_buffer@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yy_get_next_buffer199.f;
p << yy_get_next_buffer199.p;
t << yy_get_next_buffer199.t2;
rt << yy_get_next_buffer199.t1;
b << yy_get_next_buffer199.b;
a << yy_get_next_buffer199.a;

@@
print(f">{f},yyscan_t, {b}.{a}")
print(f">{f},yyscan_t")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer1910 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i->a) {... yy_get_next_buffer@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yy_get_next_buffer1910.f;
p << yy_get_next_buffer1910.p;
t << yy_get_next_buffer1910.t2;
rt << yy_get_next_buffer1910.t1;
a << yy_get_next_buffer1910.a;
i << yy_get_next_buffer1910.i;

@@
print(f">{f},yyscan_t, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer1911 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i->a) {... yy_get_next_buffer@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yy_get_next_buffer1911.f;
p << yy_get_next_buffer1911.p;
t << yy_get_next_buffer1911.t2;
rt << yy_get_next_buffer1911.t1;
a << yy_get_next_buffer1911.a;
i << yy_get_next_buffer1911.i;

@@
print(f">{f},yyscan_t, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer1912 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i.a) {... yy_get_next_buffer@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yy_get_next_buffer1912.f;
p << yy_get_next_buffer1912.p;
t << yy_get_next_buffer1912.t2;
rt << yy_get_next_buffer1912.t1;
a << yy_get_next_buffer1912.a;
i << yy_get_next_buffer1912.i;

@@
print(f">{f},yyscan_t, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yy_get_next_buffer1913 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., yyscan_t i, ...) {
  <+...
  if (i.a) {... yy_get_next_buffer@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yy_get_next_buffer1913.f;
p << yy_get_next_buffer1913.p;
t << yy_get_next_buffer1913.t2;
rt << yy_get_next_buffer1913.t1;
a << yy_get_next_buffer1913.a;
i << yy_get_next_buffer1913.i;

@@
print(f">{f},yyscan_t, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yy_get_next_buffer")
print(f"Ret. Type: {rt}")

@yyrealloc200 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyrealloc200.f;
p << yyrealloc200.p;
t << yyrealloc200.t2;
rt << yyrealloc200.t1;
b << yyrealloc200.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc201 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyrealloc201.f;
p << yyrealloc201.p;
t << yyrealloc201.t2;
rt << yyrealloc201.t1;
b << yyrealloc201.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc202 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyrealloc202.f;
p << yyrealloc202.p;
t << yyrealloc202.t2;
rt << yyrealloc202.t1;
b << yyrealloc202.b;
a << yyrealloc202.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc203 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyrealloc203.f;
p << yyrealloc203.p;
t << yyrealloc203.t2;
rt << yyrealloc203.t1;
b << yyrealloc203.b;
a << yyrealloc203.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc204 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b) {... yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyrealloc204.f;
p << yyrealloc204.p;
t << yyrealloc204.t2;
rt << yyrealloc204.t1;
b << yyrealloc204.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc207 exists@
type t1, t2, t3;
identifier f, i, b;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b) {... yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyrealloc207.f;
p << yyrealloc207.p;
t << yyrealloc207.t2;
rt << yyrealloc207.t1;
b << yyrealloc207.b;

@@
print(f">{f},{t}, {b}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc208 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t2 i, ..., t3 b, ...) {
  <+...
  if (b->a) {... yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyrealloc208.f;
p << yyrealloc208.p;
t << yyrealloc208.t2;
rt << yyrealloc208.t1;
b << yyrealloc208.b;
a << yyrealloc208.a;

@@
print(f">{f},{t}, {b}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc209 exists@
type t1, t2, t3;
identifier f, i, b, a;
position p;

@@
t1 f(..., t3 b, ..., t2 i, ...) {
  <+...
  if (b->a) {... yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyrealloc209.f;
p << yyrealloc209.p;
t << yyrealloc209.t2;
rt << yyrealloc209.t1;
b << yyrealloc209.b;
a << yyrealloc209.a;

@@
print(f">{f},{t}, {b}.{a}")
print(f">{f},{t}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc2010 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyrealloc2010.f;
p << yyrealloc2010.p;
t << yyrealloc2010.t2;
rt << yyrealloc2010.t1;
a << yyrealloc2010.a;
i << yyrealloc2010.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc2011 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i->a) {... yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyrealloc2011.f;
p << yyrealloc2011.p;
t << yyrealloc2011.t2;
rt << yyrealloc2011.t1;
a << yyrealloc2011.a;
i << yyrealloc2011.i;

@@
print(f">{f},{t}, {i}->{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc2012 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... yyrealloc@p(..., i, ...) ...}
  ...+>
}

@script:python@
f << yyrealloc2012.f;
p << yyrealloc2012.p;
t << yyrealloc2012.t2;
rt << yyrealloc2012.t1;
a << yyrealloc2012.a;
i << yyrealloc2012.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

@yyrealloc2013 exists@
type t1, t2;
identifier f, i, a;
position p;

@@
t1 f(..., t2 i, ...) {
  <+...
  if (i.a) {... yyrealloc@p(..., i, ...) ...}
  else{...}
  ...+>
}

@script:python@
f << yyrealloc2013.f;
p << yyrealloc2013.p;
t << yyrealloc2013.t2;
rt << yyrealloc2013.t1;
a << yyrealloc2013.a;
i << yyrealloc2013.i;

@@
print(f">{f},{t}, {i}.{a}")
print(p[0].file + ":" + p[0].line + ":" + p[0].column)
print(f"Used: yyrealloc")
print(f"Ret. Type: {rt}")

