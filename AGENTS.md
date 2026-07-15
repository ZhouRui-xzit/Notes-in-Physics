# Repository instructions

## Session handoff

- At the start of a new session, read `PROJECT_STATUS.md` before planning or
  editing. Then inspect `git status`, the relevant diff, and the source files
  named in the current milestone. Treat the repository records as authoritative
  rather than relying on memory from an earlier conversation.
- After completing a meaningful section or changing the book outline, update
  `PROJECT_STATUS.md`. Keep it concise: record the current milestone, completed
  work, next steps, open decisions, and the latest verification state. Use Git
  history for detailed change history rather than copying conversation logs.

## Physics conventions

- The entire book uses natural units `c = hbar = k_B = 1`, with `k_B` denoting
  Boltzmann's constant. Do not reintroduce explicit factors of these constants
  unless a passage is specifically explaining how to restore physical units.
- Use the mostly-plus Minkowski metric
  `tensor(eta,-mu,-nu) = diag(-1,+1,+1,+1)`. Consequently,
  `x^2 = -t^2 + bold(x)^2`, `p^2 = -m^2` on the massive shell, and
  `partial^2 = -partial_t^2 + nabla^2`. Do not switch metric signatures within
  a derivation.
- Use the Wick rotation `t = -i tau`, so the Minkowski weight `e^(i S_M)`
  continues to the Euclidean weight `e^(-S_E)`. State explicitly whether an
  action, kinetic operator, or correlator is Minkowskian or Euclidean whenever
  its signs could otherwise be ambiguous.
- Use passive Lorentz and Poincare transformations throughout the book. For
  `x' = Lambda x + b`, write
  `tensor(Psi',-a) (x')
  = tensor(D (Lambda),-a,+b) tensor(Psi,-b) (x)`, or equivalently
  `tensor(Psi',-a) (x)
  = tensor(D (Lambda),-a,+b)
  tensor(Psi,-b) (Lambda^(-1) (x-b))`. After quantization define the same
  passive transformation by
  `tensor(hat(Psi'),-a) (x)
  := U (Lambda,b)^(-1) tensor(hat(Psi),-a) (x) U (Lambda,b)`.
  Do not switch to the active `U tensor(hat(Psi)) U^(-1)` convention within a
  derivation unless the contrast is explicit and both conventions are related
  carefully.
- With the mostly-plus metric, use the Clifford convention
  `[tensor(gamma,+mu),tensor(gamma,+nu)]_+
  = -2 tensor(eta,+mu,+nu)`. Thus `(tensor(gamma,+0))^2 = 1`,
  `(tensor(gamma,+i))^2 = -1`, the familiar Dirac operator is
  `i tensor(gamma,+mu) tensor(partial,-mu) - m`, and the spinor Lorentz
  generators are
  `tensor(Sigma_D,+mu,+nu)
  = -i/4 [tensor(gamma,+mu),tensor(gamma,+nu)]`. Keep these signs together; do
  not mix them with the alternative `+2 tensor(eta,+mu,+nu)` convention.

## Typst mathematics

- Use Physica's abstract-index helper for indexed tensors:
  `tensor(symbol, +upper, -lower)`. A leading `+` creates an upper index and a
  leading `-` creates a lower index; argument order is preserved. For example,
  write `tensor(Lambda,+mu,-nu)`, `tensor(eta,-mu,-nu)`,
  `tensor(Sigma_D,+mu,+nu)`, and `tensor(partial,-mu)` instead of manually
  attaching mixed or multiple indices with `^` and `_`. Powers and descriptive
  labels such as `p^2`, `S_E`, or `Sigma_D` are not abstract indices and remain
  ordinary superscripts or subscripts.

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
