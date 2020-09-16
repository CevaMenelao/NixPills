{ a, b ? 3, trueMsg ? "Yes", falseMsg ? "No" }:
if a>b
  then builtins.trace trueMsg true
  else builtins.trace falseMsg false
