# Repository instructions

## Physics conventions

- The entire book uses natural units `c = hbar = k_B = 1`, with `k_B` denoting
  Boltzmann's constant. Do not reintroduce explicit factors of these constants
  unless a passage is specifically explaining how to restore physical units.

## Typst mathematics

- When a slash creates a mathematical fraction whose numerator or denominator
  contains more than one token, wrap the complete numerator and denominator in
  parentheses. Write `(partial F)/(partial x_i)` and
  `(delta F)/(delta phi (x))`; do not write
  `partial F / partial x_i`. Without the grouping, Typst can construct a
  malformed or visually misleading fraction.
- Put whitespace between a variable-like mathematical object and every
  following delimited argument, regardless of whether the delimiter is
  parentheses `(...)`, brackets `[...]`, or braces `{...}`. Write
  `phi_b (y)`, `S_E [phi]`, `cal(Z)_E [J]`, and `F {x}`; do not write
  `phi_b(y)`, `S_E[phi]`, `cal(Z)_E[J]`, or `F{x}`. Follow the same rule for
  decorated symbols such as `hat(phi)_H (x)` and
  `G_E^((n)) (x_1,dots,x_n)`. Typst built-in operators and functions keep
  their established call syntax; this rule targets variable-like symbols used
  as mathematical functions or functionals.
- After editing Typst content, compile `main.typ` and inspect the affected PDF
  pages for malformed fractions, accidental function attachment, overflow, and
  unresolved references.
