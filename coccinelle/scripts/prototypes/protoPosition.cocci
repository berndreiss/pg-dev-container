@pos exists@
parameter list params;
identifier f;

@@
 f (params) {
  ...
}
@script:python@
params << pos.params;
f << pos.f;
@@
if f == "__FUNCTION__":
  counter = 0
  for param in params:
    type = " ".join(param.split()[:-1])
    if type == "__TYPE__":
      print(f"__FUNCTION__:{counter}")
    counter += 1
