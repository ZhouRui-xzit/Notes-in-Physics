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

## User-facing communication

- In conversation, prefer readable Unicode mathematics, such as
  `p² = −m²`, `Z_φ`, and `φ_in/out`, over LaTeX or literal Typst syntax. Show
  Typst syntax when discussing text that will be written into a `.typ` source
  file or when the exact source notation is otherwise relevant.

## Chinese-first editorial policy

### Scope and standard

- The book is being converted into Chinese-first academic QFT notes. Newly
  written or revised body text, headings, captions, theorem-style blocks, and
  exercises must read as original scholarly Chinese, not as English sentences
  with Chinese words substituted into the same order.
- Aim for the tone of a careful set of university-level physics notes: direct,
  precise, explanatory, and restrained. Prefer a clear subject and verb over
  stacked nominal phrases; prefer an explicit logical relation over a chain of
  vague connectors.
- Preserve the mathematical structure, labels, conventions, and logical
  dependencies of a chapter during an editorial rewrite unless the task also
  calls for a physics correction. Paragraphs may be reordered, merged, split,
  or rewritten whenever the derivation becomes clearer.
- The migration is incremental: untouched chapters may remain in English, but
  every rewritten chapter must be internally consistent and Chinese-first.

### Expository hierarchy

- Every chapter must begin with a genuine chapter preface immediately after
  the chapter heading. It should identify the central problem, explain why the
  chapter is needed, state the common conceptual or calculational thread, and
  show how the major sections fit together. It should not begin the first
  derivation or merely repeat the table of contents.
- Every major section should normally begin with a local introduction. This
  paragraph should pose the section's specific question, explain the obstacle
  or motivation, and indicate the route from the section's inputs to its main
  result. It must not duplicate the chapter preface.
- Subsections carry the actual derivation. Organize them as
  problem/motivation -> construction or calculation -> interpretation. A
  reader should be able to tell why a formula is being introduced before
  seeing it and what has been learned after it.
- End a substantial section by stating the result that will be used later and,
  when useful, the next unresolved question. Avoid empty summaries that only
  restate the section title.

### Paragraph and sentence craft

- Write concise, natural academic Chinese. Prefer direct statements of facts,
  conclusions, and causal relations; do not add rhetorical scaffolding merely
  to make a sentence sound emphatic.
- Give each paragraph one controlling purpose. Put the question, obstacle, or
  claim near the beginning; let the equations and reasoning resolve it; close
  with the physical or mathematical consequence.
- Rebuild translated prose at the paragraph level. Do not polish a stiff
  sentence word by word if its information order still follows English.
  Reorder causes, conditions, conclusions, and qualifications into natural
  Chinese information flow.
- Use transitions that name the actual logical relation, such as a missing
  step, a change of representation, a limiting operation, or a consequence of
  a symmetry. Avoid habitual metadiscourse such as “本节将”, “本质上”, “实际上”,
  “换句话说”, “需要注意的是”, “更准确地说”, “由此可见”, “不难发现”, “显然”,
  or “值得注意的是”. Retain such phrases only when they contribute information
  that the surrounding statements do not already supply.
- Prefer direct affirmative statements to habitual binary frames such as
  “不是……而是……”, “是……而不是……”, and “并非……而是……”. Do not manufacture a
  binary opposition merely for emphasis. Use an explicit contrast only when
  correcting a plausible misconception, marking a necessary conceptual
  boundary, or comparing mathematical alternatives. Otherwise state the
  conclusion first, place any qualification in a separate sentence, or name
  the actual causal relation. Do not stack several negative contrasts in one
  paragraph.
- State each point once. After a claim has been established, advance the
  derivation instead of paraphrasing the same conclusion in a summary sentence
  or a later paragraph. Repeat only when a genuinely new context changes its
  meaning or use.
- Keep claims appropriately qualified. State the regularization, boundary
  condition, signature, approximation order, or domain of validity where it
  matters; do not bury such conditions in a remote sentence.
- Integrate displayed equations into the prose. The preceding sentence should
  explain why the equation is needed, and the following sentence should
  interpret its content, signs, normalization, or role in the next step. Avoid
  long sequences of unexplained formulas.
- Exercises should use compact, unambiguous imperatives. State assumptions
  before the tasks, order subtasks by dependency, and make clear what is to be
  derived, checked, compared, or interpreted.

### Terminology and names

- Preserve eponymous names and standard abbreviations in English. This
  includes Lorentz, Poincare, Hermitian, Jacobian, Fourier, Feynman, Wick,
  Euclidean, Minkowski, Weyl, Dirac, Maxwell, Grassmann, Berezin, Majorana,
  Matsubara, KMS, LSZ, QED, and QCD. Do not translate these into Chinese
  personal-name forms.
- Use established Chinese terminology for the surrounding physics and
  mathematics. When several Chinese translations exist, choose one term for
  the chapter and use it consistently.
- Keep symbols and abbreviations from carrying grammatical work that should be
  expressed in prose. Explain what an object does, not only what it is called.

### Chinese punctuation and Typst source layout

- Use the ASCII period `.` for Chinese sentence endings throughout the book;
  do not use the full-width Chinese full stop `。`. Retain standard Chinese
  commas, colons, semicolons, question marks, and book-title punctuation where
  appropriate.
- In `.typ` prose, never insert a source line break inside a Chinese sentence.
  Keep each prose paragraph on one physical source line unless a displayed
  equation, list, quotation, or block environment requires structural line
  breaks. Start a new source line at a real paragraph or structural boundary,
  not for visual wrapping in the editor; Typst can turn arbitrary source
  breaks into visible spaces.
- Formula blocks, lists, tables, and code-like structures may use multiline
  layout for readability. Preserve the indentation required for list
  continuation so numbered exercise items do not restart after a displayed
  equation.

### Editorial review checklist

- Before declaring a chapter rewrite complete, verify that it has a
  chapter-level preface, that each major section has a distinct local purpose,
  and that the exposition follows the dependency order of the mathematics.
- Search the revised source for Chinese full stops, translated eponymous names,
  trailing whitespace, accidental sentence-internal line breaks, duplicated
  prose or repeated explanations, duplicated headings or exercise fields,
  habitual metadiscourse, overused binary negative contrasts, and broken list
  indentation.
- Preserve and recount headings, exercises, figures, tables, and labels against
  the pre-edit baseline. Compile `main.typ`, render every affected page, and
  inspect the chapter opening, section transitions, formulas, references,
  exercise numbering, and the transition to the next chapter.

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
