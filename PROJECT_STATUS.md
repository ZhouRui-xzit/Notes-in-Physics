# QFT-for-Calculators Handoff

Last updated: 2026-08-31

## Session startup

1. Read `AGENTS.md` and this file.
2. Inspect `git status`, the relevant diff, and the current chapter source.
3. Compile `main.typ` before assuming the last working state is reproducible.
4. Treat Git and these repository documents as authoritative; conversation
   history is disposable context.

## Current milestone

The Chinese rewrite and focused concision pass of Chapter 4, *From Correlation
Functions to Scattering Amplitudes*, are complete and visually verified.
Two pre-existing mathematical notation issues are recorded below for separate
review; this editorial pass does not certify the chapter's physics. The next editorial milestone is
Chapter 5.  The book is explicitly transitioning from an English manuscript into Chinese-first academic QFT
notes: revised prose must read as native scholarly Chinese rather than as a
sentence-level translation, while eponymous names and standard abbreviations
remain in English.  Each chapter's derivational structure, equation labels,
mostly-plus convention, passive-transformation convention, and exercise
coverage are to be preserved.

Chapters 1--4 and all of their exercises are now Chinese-first.  Chapter 4
Sections 4.1--4.7 carry the calculation from normalized perturbative correlators
through connected functions, full-propagator amputation, 1PI proper vertices,
the exact two-point spectral representation, the in/out scattering operator,
the conversion of invariant amplitudes into rates and cross sections, and the
LSZ relation between scattering matrix elements and pole-normalized amputated
correlators, through to the momentum-space Feynman rules for constructing the
amplitude.  Chapter 5, *phi^4 Theory at Zero Temperature*, is now underway.
Its main line uses dimensional regularization and
`overline(upright("MS"))`, computes the two-point function through
`O(lambda^2)` before the four-point function, and extracts the pole mass and
LSZ residue from the minimally subtracted propagator.

The Chinese-first editorial migration is the active book-wide direction.  The
shared book template uses Noto Sans CJK SC for body text, strong emphasis, and
headings, with LXGW WenKai reserved for the semantic emphasis environment.
Chapters 1--4 have
been rewritten in polished academic Chinese; eponymous terms and abbreviations
such as Wick, Feynman, Fourier, Jacobian, Matsubara, and KMS remain in English.

## Confirmed Chapter 3 outline

1. **3.1 虚时间形式**
   - Thermal trace, Euclidean-time circle, KMS condition, thermal generating
     functionals, thermodynamics, and the zero-temperature limit.
2. **3.2 Matsubara 频率**
   - Fourier analysis for periodic bosons and antiperiodic fermions, thermal
     delta functions, sum-integrals, and the zero-temperature limit.
3. **3.3 自由标量场的热力学**
   - Real-scalar functional determinant and pressure, the complex scalar
     grand canonical Euclidean kernel, and sourced thermal propagators.
4. **3.4 自由 Dirac 场的热力学**
   - Grand canonical Grassmann determinant, finite-density pressure and
     charge, and the sourced thermal propagator.
5. **3.5 自由光子场的热力学**
   - Physical transverse functional determinant, blackbody thermodynamics,
     and the radiation-gauge thermal propagator.
6. **3.6 Matsubara 求和与围道方法**
   - Bosonic and fermionic thermal kernels, contour derivations of the sums
     used in Sections 3.3 and 3.4, determinant log-sums, and thermal moments.

## Confirmed Chapter 4 outline

1. **4.1 微扰关联函数**
   - Normalized perturbative correlators and Wick topologies through
     `O(lambda^2)`.
2. **4.2 连通函数、截肢函数与 1PI 函数**
   - Connected generators, full-propagator amputation, and effective-action
     vertices.
3. **4.3 单粒子极点与场归一化**
   - Källén--Lehmann representation, pole mass, and residue.
4. **4.4 S-matrix 与散射算符**
   - Asymptotic states, unitarity, the Dyson series, and Poincaré invariance.
5. **4.5 衰变率与散射截面**
   - Invariant phase space, decay rates, collision flux, and two-body
     kinematics.
6. **4.6 LSZ 约化公式**
   - Operator reduction, simultaneous Green-function poles, and external-state
     factors.
7. **4.7 散射振幅的 Feynman 规则**
   - Momentum-space rules, symmetry factors, and one-loop `phi^4` scattering.
8. **4.8 习题**
   - Effective-action/1PI proof, Dyson-series derivation, and fixed-target
     two-to-two kinematics.

## Completed

- `AGENTS.md` now defines the Chinese-first editorial standard as an
  executable workflow rather than a general preference. It distinguishes the
  roles of chapter prefaces, major-section introductions, and derivational
  subsections; requires problem/motivation -> calculation -> interpretation
  structure; records paragraph-level rewriting, formula integration,
  terminology, ASCII-period, one-source-line-per-prose-paragraph, list
  indentation, concise affirmative phrasing in place of habitual binary
  contrasts, restraint with metadiscourse, non-repetition of established
  points, and final editorial QA rules.
- Chapter 1 was corrected to the mostly-plus metric and `t = -i tau` Wick
  rotation.
- Chapter 1 was rewritten in Chinese with its derivational structure,
  equations, labels, natural-unit convention, mostly-plus metric, and Wick
  rotation preserved.  Its headings and ten exercises are localized, while
  eponymous technical terms remain in English.
- Chapter 1 received a second editorial pass guided by the prose rhythm of the
  two supplied Chinese QFT references.  Sections now move from a concrete
  calculational problem to motivation, derivation, and physical interpretation
  instead of reading like a translated outline.  The chapter opening now has a
  genuine chapter-level preface that states the common Gaussian/propagator
  thread and previews the progression from mechanics to fields; Section 1.1
  has a separate local introduction motivated specifically by the transition
  amplitude, operator noncommutativity, and time slicing.  Chinese prose uses ASCII
  periods, and sentences are kept on single source lines so Typst does not
  introduce spaces at editorial line breaks.  All 44 headings, ten exercises,
  and 142 labels are preserved.
- Chapter 2 and all sixteen exercises were rewritten in idiomatic academic
  Chinese, then received a second editorial pass under the chapter/section
  hierarchy now recorded in `AGENTS.md`.  The chapter opening states the
  common representation--action--mode--Fock-space--propagator route, while
  Sections 2.1--2.8 now have distinct local introductions organized around
  their own calculational problems.  Transitions follow the sequence
  problem/motivation -> derivation -> interpretation rather than English
  source order.  Chinese prose uses ASCII periods and one source line per
  paragraph; the stray English prose fragment was removed.  All 48 headings,
  sixteen exercises, and 229 labels are preserved, and eponymous names and
  abbreviations remain in English.
- Chapters 1 and 2 received a focused concision pass on binary negative
  contrasts. Habitual “不是……而是……” and “是……而不是……” frames were replaced
  by direct conclusions, causal statements, or separate qualifications;
  contrasts were retained only where they exclude a real misconception or
  compare mathematical alternatives. The pass preserves Chapter 1's 44
  headings, ten exercises, and 142 labels, and Chapter 2's 48 headings,
  sixteen exercises, and 229 labels.
- Chapter 3 was rewritten in idiomatic academic Chinese.  All six sections,
  47 chapter and section headings, and 151 equation and figure labels are preserved; its
  Matsubara contour legend and caption are localized while eponymous names and
  abbreviations remain in English.
- Chapter 3 received a focused concision pass under the current editorial
  standard. A new chapter preface now states the common
  trace--boundary-condition--Matsubara--Gaussian-kernel thread, while Section
  3.1 has a separate local introduction. Habitual binary contrasts and
  metadiscourse were replaced by direct factual or causal statements;
  repeated summaries of the trace-log/inverse-kernel relation were reduced.
  All prose paragraphs and the contour caption now occupy one source line, so
  editorial wrapping cannot introduce spaces into Chinese text. All 47
  headings, one figure, and 151 labels are preserved.
- Chapter 4 and its three exercises were rewritten in idiomatic academic
  Chinese.  All 38 headings and 144 equation, figure, table, and exercise
  labels are preserved.  Captions, tables, theorem-style exercise blocks, and
  the internal annotations of all three Feynman diagram sets are localized;
  eponymous names and abbreviations remain in English.
- Chapter 4 received the current Chinese concision pass. Its chapter preface
  now connects local-field correlators with particle scattering, while each
  major section has a distinct local introduction. Repeated transitions,
  rhetorical binary contrasts, and metadiscourse were reduced; the stray
  English editing fragment was removed. Body paragraphs, captions, and
  exercise prose occupy single source lines and use ASCII periods. All 38
  headings, three exercises, four figures, two tables, and 144 unique labels
  remain, with mathematical structure and exercise coverage preserved.
- The shared typography is Chinese-first: body text, strong emphasis, and all
  heading levels use Noto Sans CJK SC; semantic emphasis uses LXGW WenKai
  without synthetic slanting; display mathematics remains STIX Two Math.
  `tests/typography.typ` is the standalone visual regression fixture.
- Section 2.1 develops Lorentz/Poincare symmetry, field representations, and
  the passive quantum transformation `U^(-1) hat(Psi) U`.
- Section 2.2 develops the real scalar field with the invariant measure
  `tilde(dd(k)) = dd(k,[3]) / ((2 pi)^3 2 omega_k)`.
- Section 2.3 develops the complex scalar as two trivial Lorentz
  representations, its two oscillator families, invariant one-particle
  states, global `U(1)` charge, microcausality, and the covariant-derivative
  construction leading to scalar QED.
- Section 2.4 develops the Maxwell connection in `(1/2,1/2)`, the
  gauge-invariant field strength in `(1,0) direct-sum (0,1)`, the Maxwell and
  Bianchi equations, canonical constraints, the physical polarization
  quotient `k^perp / span(k)`, derived transverse and covariant completeness
  projectors, radiation-gauge quantization, physical helicities `+1` and
  `-1`, and field-strength microcausality.
- Exercises cover Lorentz algebra and finite passive transformations, scalar
  Hamiltonians, complex-scalar charge, gauging the scalar phase symmetry, and
  two complementary Maxwell problems: classical gauge redundancy, kinetic
  zero modes, and constraint counting in one; explicit photon polarizations,
  standard Lorentz transformations, and the equivalence of the transverse
  canonical and ladder algebras in the other.
- Section 2.5 constructs `(1/2,0)` and `(0,1/2)` from the complexified
  Lorentz algebra, shows explicitly that they are conjugate and have opposite
  boost generators, forms their Dirac direct sum, verifies the covariant
  Lorentz-generator algebra, and exponentiates the finite passive spinor
  representation.  In the Srednicki chiral basis it derives the Clifford
  algebra, recovers `Sigma_D` from gamma-matrix commutators, proves finite
  gamma covariance, introduces `gamma^5` and the chiral projectors, and fixes
  `slashed(a) = a_mu gamma^mu`.
- The two spinor exercises cover the detailed Weyl conjugation and double
  cover in one problem, then contrast the Weyl direct sum producing the Dirac
  representation with the tensor product producing the classical vector
  representation in the other.
- Section 2.6 derives the Dirac adjoint and bilinear transformation laws, the
  free Minkowski action, Dirac and adjoint equations, the conserved vector
  current, Hamiltonian form, and the first-order canonical constraints.  It
  solves the momentum-space equations at rest and obtains arbitrary-momentum
  spinors by the passive standard boost, then derives covariant and equal-time
  normalizations, spin sums, rank-two energy projectors, the axial-current
  divergence, and the massless chirality-helicity relation.
- Two Section 2.6 exercises develop the adjoint, bilinears, currents, and
  first-order Hamiltonian structure in one problem, then independently derive
  the boosted spinors, normalization, spin sums, projectors, and massless
  limit in the other.
- Section 2.7 quantizes the Dirac field with covariantly normalized particle
  and antiparticle modes, derives the ladder CAR from the equal-time field
  algebra, and shows how fermionic statistics gives positive energy and
  positive Fock-space norm.  It constructs the normal-ordered four-momentum
  and charge, the antisymmetric Fock space and invariant one-particle states,
  and derives fermionic microcausality from the Pauli--Jordan distribution,
  including commutativity of even local bilinears at spacelike separation.
- Two Section 2.7 exercises derive the inverse mode projections, oscillator
  algebra, Hamiltonian and charge in one problem, then carry out the graded
  second-class constraint analysis and the covariant locality calculation in
  the other.
- Section 2.8 specializes the Gaussian machinery of Chapter 1 to the free
  fields constructed in Chapter 2.  It derives the real- and complex-scalar
  Feynman functions, fixes the covariant photon propagator after gauge fixing,
  evaluates the Grassmann-source Dirac functional, matches the resulting
  spinor propagator to the operator mode expansion, and records the Euclidean
  continuation in the mostly-plus convention.
- Two Section 2.8 exercises develop the scalar and Dirac contour integrals,
  source-derivative signs, and equal-time contact terms in one problem, then
  derive the general covariant photon propagator, conserved-current and
  field-strength gauge independence, and the Abelian Faddeev--Popov
  determinant in the other.
- Section 3.1 defines the canonical thermal state and imaginary-time
  evolution, derives the thermal circle and bosonic/fermionic boundary
  conditions from the trace, relates them to the operator KMS condition, and
  constructs normalized thermal generating functionals.  It distinguishes
  correlator normalization from the thermodynamic partition function and
  closes with the thermodynamic derivatives and zero-temperature limit.
- Section 3.2 derives bosonic and fermionic Matsubara frequencies from their
  thermal boundary conditions.  It proves orthogonality and completeness in a
  finite periodic spatial box, defines the periodic and antiperiodic thermal
  delta kernels, takes the spatial thermodynamic limit, and fixes the
  `integral_(P_B)` and `integral_(P_F)` sum-integral conventions.  It also
  records frequency conservation, the bosonic zero mode, the fermionic
  thermal gap, and the continuous Euclidean-frequency limit as `T -> 0`.
- Section 3.3 gives the first complete thermal free-field calculation.  It
  starts from the periodic Euclidean path integral, diagonalizes the
  real-scalar kernel in the finite-box Matsubara basis, evaluates its
  trace-log, separates the vacuum term, and derives the pressure, energy
  density, and massless limit.  It then derives the complex scalar's
  chemical-potential Euclidean kernel from the phase-space path integral,
  evaluates its determinant, and obtains the grand potential, pressure,
  charge density, stability bound, and condensation boundary.  The sourced
  Gaussian finally relates the same kernels to the real and charged thermal
  propagators, including the two orientations at nonzero chemical potential.
- Section 3.4 makes the grand canonical thermodynamics of one free Dirac
  field its main line.  Starting from the conserved vector `U(1)` charge, it
  derives the chemical-potential Euclidean Grassmann kernel in conventions
  compatible with Chapter 2, evaluates its fermionic Matsubara determinant,
  and obtains the pressure, charge density, energy density, zero-temperature
  Fermi surface, and massless finite-density limits.  A final sourced
  Gaussian treats the thermal propagator as the inverse of the same shifted
  kernel and checks antiperiodicity and the canonical endpoint jump.
- Section 3.5 provisionally treats the photon as a free massless spin-one
  field on the reduced radiation-gauge space.  The transverse projector
  derives the two physical helicities, the periodic determinant gives the
  blackbody pressure, energy density, entropy, and Planck spectrum, and the
  inverse kernel gives the transverse thermal propagator.  It also explains
  why an equilibrium photon gas has zero chemical potential and defers a
  full covariant gauge-fixed treatment.
- Section 3.6 derives the bosonic sum in Equation 3.3.8 and the shifted
  fermionic sum in Equation 3.4.14 by a unified contour method.  It introduces
  thermal kernels whose poles and residues reproduce the two Matsubara
  lattices, tracks the chemical-potential shift through the physical poles,
  and integrates the convergent propagator sums back to the determinant
  log-sums.  A CeTZ contour diagram displays the thermal and physical poles,
  and a final set of Bose/Fermi moments recovers the massless coefficients.
- Section 4.1 distinguishes the unnormalized sourced path integral `Z_M[J]`
  from the normalized functional `cal(Z)_M[J]=Z_M[J]/Z_M[0]`, writes the
  interaction solely as an `S_int` functional differential operator, and
  explains why the denominator cancels only source-free vacuum-bubble
  components.  It then uses regulated bare `phi^4` theory as a perturbative
  calculation: the two-point function records all Wick topologies and
  symmetry factors through second order, while the four-point function retains
  all source-attached disconnected pairings alongside the contact graph, four
  external-leg tadpole insertions, and three one-loop fish channels.  A final
  transition defers connected generators, amputation, and 1PI organization to
  Section 4.2.
- Section 4.1 now illustrates the five two-point topologies through
  `O(lambda^2)` and representative four-point leg and fish topologies.  The
  diagrams have maintainable `tikz-feynman` sources in `Feynman/`, are
  exported as SVG assets for Typst, and use a reproducible VS Code/Makefile
  workflow based on XeLaTeX and `dvisvgm`, allowing their Chinese annotations
  to use Noto Sans SC.
- Section 4.2 uses `W_M[J]=-i log cal(Z)_M[J]` to extract connected functions
  and applies the decomposition explicitly to the Section 4.1 four-point
  result.  It defines amputation with the inverse full propagator, separates
  that operation from the internal bridge criterion for 1PR/1PI graphs, and
  introduces the Minkowski effective action and its proper vertices.  The
  exact four-point reconstruction shows how full external propagators, 1PI
  kernels, and possible 1PR kernels fit together.  Its proof exercise derives
  the inverse-propagator identity, the three- and four-point proper-vertex
  expansions, and the general bridge decomposition proving that derivatives
  of the effective action generate amputated 1PI vertices.

- Section 4.3 now starts directly from the exact time-ordered two-point
  function in the unbroken `phi arrow.r -phi` vacuum; it does not introduce a
  shifted field or a vacuum-condensate parameter.  Inserting the vacuum,
  one-particle, and multiparticle sectors gives the Wightman and
  Källén--Lehmann representations, with a CeTZ sketch of the isolated pole and
  continuum.  The 1PI two-point kernel then fixes the pole mass and the residue
  `Z_phi`, and the regulated `phi^4` tadpole provides the first perturbative
  check.  Translation covariance and the direct Wightman-to-Feynman
  time-ordering step are written explicitly.
- Section 4.4 constructs in/out states from asymptotic fields and Møller
  operators, distinguishes the scattering operator, its matrix elements, and
  the stripped invariant amplitude.  The standard one-particle matrix element
  of the asymptotic field now motivates its introduction and fixes the
  `sqrt(Z_phi)` matching to the exact field.  Asymptotic completeness gives a
  direct proof of unitarity.  Interaction-picture evolution then produces the
  Dyson series, while scalar transformation of the local interaction density
  together with microcausality proves Poincaré invariance in the passive
  convention.
- Section 4.5 derives the Lorentz-invariant one- and multiparticle phase-space
  measures, including identical-particle and discrete-state bookkeeping.  A
  finite-volume, finite-time treatment of the squared momentum delta function
  gives a common transition-rate formula from which the decay and collision
  cases follow.  It treats the unstable parent as a perturbative long-lived
  state, derives time dilation and the complete two-body decay phase space,
  constructs the invariant collision flux from the Møller velocity, and
  reduces the general cross section to the mostly-plus two-to-two formulas in
  `d Omega` and `d t`.
- Section 4.6 derives LSZ from a general asymptotic expansion
  `Psi ~ u a e^(i p dot x) + v b^dagger e^(-i p dot x)`.  It obtains all four
  particle and antiparticle field--state matrix elements directly from the
  field and its conjugate.  Starting from
  `braket(beta_out,alpha_in)`, it derives the scalar reduction formula through
  the finite-time Klein--Gordon projection and the boundary differences
  `a^dagger_out-a^dagger_in` and `a_out-a_in`, separating connected reductions
  from identity and spectator terms.  It then reads the simultaneous Green-
  function poles, compares them with the full-propagator definition of the
  amputated kernel, and lists scalar, fermion, antifermion, and physical-
  photon external factors without introducing separate dual pole
  wavefunctions.  Field-component indices use the compact `hat(Psi)^a_H` and
  `u_l^a (p)` notation.
- Section 4.7 translates the LSZ result directly into stripped momentum-space
  Feynman rules.  It fixes the all-incoming momentum convention and the
  distinction between `i cal(M)` and `cal(M)`, lists pole wavefunctions and
  scalar, Dirac, and covariant-photon internal propagators, derives vertex and
  derivative-coupling factors, and organizes loop measures, closed-fermion
  signs, graph automorphisms, and Wick-contraction symmetry factors.  A
  calculation checklist and the renormalized `phi^4` two-to-two amplitude
  through one loop exhibit the three Mandelstam channels and their factor
  `1/2`.  A five-panel TikZ-Feynman figure displays the tree contact graph,
  the crossed four-point counterterm graph, and the `s`, `t`, and `u` fish
  graphs with their individual contributions to Equation 4.7.17.
- Section 5.1 starts the zero-temperature renormalization calculation in
  `d=4-2 epsilon`.  It defines the regulated bare theory, separates the
  canonical renormalized Lagrangian from its mass, field, and coupling
  counterterms, fixes the `overline(upright("MS"))` pole convention, and lists
  the dimensionally regulated momentum-space rules.  Power counting derives
  `omega=4-E` and explains why the three counterterms suffice.  The section
  distinguishes the ultraviolet field factor `Z_"ct"` from the LSZ pole
  residue `Z_phi` and gives the equations that extract `m_"phys"` and `Z_phi`
  from the finite minimally subtracted self-energy.
- The three Chapter 4 exercises prove that effective-action derivatives
  generate 1PI vertices, derive Equation 4.4.18 from the interaction-picture
  Volterra equation, and organize general two-to-two fixed-target laboratory
  kinematics in Mandelstam variables.  The last derives the
  invariant-to-laboratory energy and angle map, the compact `d sigma / d t`
  formula and endpoints, and the Jacobian returning to `d sigma / d Omega`.

## Next work

Continue the editorial migration with the Chinese rewrite of Chapter 5.  The
next physics-development milestone remains Section 5.2: evaluate the massive one-loop
tadpole in dimensional regularization, fix the leading
`overline(upright("MS"))` mass counterterm, and show that its momentum
independence leaves `Z_phi=1+O(lambda^2)`.

## Open decisions

- The Chapter 5 subtraction scheme is fixed: dimensional regularization and
  `overline(upright("MS"))` form the body-text main line.  On-shell
  renormalization is deferred to an exercise comparing its finite
  counterterms and pole-normalized field with the minimally subtracted
  parameters.
- Chapter 4 is editorially complete. Separate notation review is needed for
  two pre-existing issues in Section 4.3: the inline single-particle
  completeness relation before Equation 4.3.6 contains `ket(p)ketbra(p)`
  (an apparent extra ket), and Equation 4.3.18 uses `Pi_M` where the Taylor
  coefficient and Equation 4.3.19 indicate `Pi'_M`. Neither was changed in
  the prose-only pass.
- Chinese prose uses established Chinese technical vocabulary and idiomatic
  academic sentence structure, not literal English-to-Chinese translation.
  Eponymous names and abbreviations remain in English, including Lorentz,
  Poincare, Hermitian, Jacobian, Fourier, Feynman, Wick, Euclidean, Minkowski,
  Weyl, Dirac, Maxwell, Grassmann, Berezin, Majorana, Matsubara, LSZ, QED, and
  QCD.

## Verification state

- `tests/typography.typ` compiles successfully.  Its three-page PDF was
  rendered and visually inspected for body text, strong emphasis, the LXGW
  WenKai emphasis environment, all four heading levels, mixed Chinese/Latin
  text, theorem-style content, equation numbering, and references.  `pdffonts`
  confirms embedded Noto Sans CJK SC Regular/Bold, LXGW WenKai Regular, and
  STIX Two Math.
- `main.typ` compiles successfully after the latest Chapter 1 concision pass.
  All Chapter 1 body and exercise pages (physical pages 3--24; PDF pages 7--28)
  were rendered and visually inspected for missing
  glyphs, Chinese line breaking, paragraph indentation, formula overflow,
  malformed fractions, equation-number collisions, cross-references, heading
  hierarchy, theorem-box splitting, and the transition to Chapter 2.
  The source retains all 44 headings, ten exercises, and 142 labels, contains
  no habitual binary negative frames, no Chinese full stops, and no trailing
  whitespace.  `pdffonts` confirms
  embedded Noto Sans CJK SC, LXGW WenKai, and STIX Two Math; `git diff --check`
  reports no whitespace errors.
- `main.typ` compiles successfully after the latest Chapter 2 concision pass.
  All Chapter 2 body and exercise pages (physical pages 25--68; PDF pages
  29--72) and the transition to Chapter 3 on PDF page 73 were rendered and
  visually inspected for
  missing glyphs, Chinese line breaking, formula overflow, equation-number
  collisions, heading hierarchy, exercise-box layout, and unresolved
  references.  The source retains all 48 headings, 229 original labels, and
  sixteen exercises; it contains no habitual binary negative frames, Chinese
  full stops, or trailing whitespace.
  `pdffonts` confirms embedded Noto Sans CJK SC, LXGW WenKai, and STIX Two
  Math; `git diff --check` reports no whitespace errors.
- `main.typ` compiles successfully after the latest Chapter 3 concision pass.
  All Chapter 3 pages (physical pages 69--90; PDF pages 73--94), the Part II
  divider on PDF page 95, and the transition to Chapter 4 on PDF page 96 were
  rendered and visually
  inspected for missing glyphs, Chinese line breaking, formula overflow,
  equation-number collisions, heading hierarchy, the Matsubara contour and
  caption, and unresolved references.  The source retains all 151 original
  equation and figure labels, one figure, and all 47 chapter and section
  headings; it contains no targeted metadiscourse, habitual binary negative
  frames, Chinese full stops, or trailing whitespace.  `pdffonts` confirms
  the expected embedded fonts; `git diff --check` reports no whitespace
  errors.
- `main.typ` compiles without warnings after the Chapter 4 concision pass.
  All Chapter 4 pages (printed pages 92--118; PDF pages 96--122) and the
  transition to Chapter 5 (PDF page 123) were rendered and visually checked
  for Chinese line breaking, long formulas, references, figure captions,
  both tables, and cross-page exercise numbering. The source audit finds
  38 headings, three exercises, four figures, two tables, and 144 unique
  labels, with no duplicate headings, targeted metadiscourse, habitual
  binary negative frames, Chinese full stops, trailing whitespace, or
  sentence-internal prose wrapping. `pdffonts` confirms the expected Noto
  Sans CJK SC, LXGW WenKai, and STIX Two Math fonts. `git diff --check`
  reports no whitespace errors in the edited chapter. The two notation
  issues above remain outside this editorial verification.

- `main.typ` compiled successfully after Section 2.7 and its two exercises
  were added; `git diff --check` reports no whitespace errors.
- All Section 2.7 body pages and both new exercise pages were rendered and
  visually inspected.  The mode expansion, normal-ordered observables,
  particle/antiparticle state notation, covariant anticommutator, constraint
  brackets, cross-references, and exercise titles render without overflow or
  unresolved references.
- Section 2.5 and its two exercises were recompiled and visually rechecked.
  The double-cover formulas and long gamma-matrix and tensor-product equations
  now render with balanced delimiters and unobscured equation numbers.
- `main.typ` compiled successfully after Section 2.8 and its two exercises
  were added.  All five Section 2.8 body pages and both exercise pages were
  rendered and inspected for formula overflow, malformed fractions, source
  ordering, equation-number collisions, and unresolved references.
- `main.typ` compiled successfully after Section 3.1 was added;
  `git diff --check` reports no whitespace errors.  All four Section 3.1 pages
  were rendered and inspected for overflow, malformed integrals, thermal
  boundary-condition signs, equation-number collisions, and unresolved
  references.
- `main.typ` compiled successfully after Section 3.2 was added, and
  `git diff --check` reports no whitespace errors.  All four Section 3.2 pages
  were rendered and inspected for finite-box normalization,
  Kronecker-versus-Dirac delta notation, sum-integral factors, formula
  overflow, equation-number collisions, and unresolved references.
- `main.typ` compiled successfully after the field-theoretic Section 3.3 was
  added, and `git diff --check` reports no whitespace errors.  All six
  Section 3.3 pages, including the following outline transition, were rendered
  and inspected for determinant powers, vacuum subtraction, shifted Matsubara
  signs, chemical-potential convergence, sourced Gaussian normalization,
  malformed fractions, formula overflow, equation-number collisions, and
  unresolved references.
- `main.typ` compiled successfully after Section 3.4 was reorganized around
  grand canonical Dirac thermodynamics, and `git diff --check` reports no
  whitespace errors.  Its pages were rendered and inspected for the
  Minkowski-to-Euclidean gamma continuation, the sign of the chemical-
  potential shift, Grassmann determinant and spin factors, particle and
  antiparticle Fermi--Dirac weights, finite-density limits, long spinor
  numerators, antiperiodic endpoint signs, malformed fractions, overflow,
  equation-number collisions, and unresolved references.
- `main.typ` compiled successfully after Section 3.5 was added, and
  `git diff --check` reports no whitespace errors.  All three Section 3.5
  pages and the transition to Section 3.6 were rendered and inspected for
  transverse-projector indices, determinant powers, helicity factors,
  homogeneous-mode notation, malformed fractions, overflow, equation-number
  collisions, and unresolved references.
- `main.typ` compiled successfully after Section 3.6 was added, and
  `git diff --check` reports no whitespace errors.  All four Section 3.6
  pages were rendered and inspected for contour orientation, thermal-kernel
  residues, chemical-potential signs, bosonic and fermionic reflection
  identities, long fractions, figure labels, cross-references to Equations
  3.3.8 and 3.4.14, overflow, and unresolved references.
- `main.typ` compiled successfully after the Section 4.1 normalization and
  perturbative reorganization.  Physical pages 94--96 were rendered and
  inspected for the normalized
  functional fraction, source-argument attachment, interaction-operator
  notation, disconnected pair partitions, second-order symmetry factors,
  long-equation wrapping, overflow, and unresolved references;
  `git diff --check` reports no whitespace errors.
- `main.typ` compiled successfully after Section 4.2 was added, and
  `git diff --check` reports no whitespace errors.  Physical pages 96--99
  were rendered and inspected for connected-function factors, full-propagator
  amputation, the 1PR/1PI distinction, effective-action signs, long-equation
  wrapping, equation-number collisions, and unresolved references.
- `main.typ` compiled successfully after Section 4.3 was added and then
  simplified to use the direct two-point correlator.  Physical pages 99--102
  were rendered and visually inspected for the complete-state insertion,
  positive-energy shell measure, spectral-density figure, Källén--Lehmann
  denominators, pole expansion, equation labels, and visible overflow;
  `git diff --check` reports no whitespace errors.
- `main.typ` compiled successfully after Section 4.4 was added, and
  `git diff --check` reports no whitespace errors.  Physical pages 102--106
  were rendered and visually inspected for asymptotic-state notation,
  momentum-delta normalization, Møller-operator unitarity, the Dyson-series
  factors and line wrapping, passive Poincaré transformations,
  microcausality, equation-number collisions, and unresolved references.
- `main.typ` compiled successfully after Section 4.5 was added, and
  `git diff --check` reports no whitespace errors.  Physical pages 106--111
  were rendered and visually inspected for invariant-measure factors, the
  regularized squared delta function, box-state normalization, decay-width
  and time-dilation factors, the two-body delta-function Jacobian, Källén
  functions and thresholds, Møller flux, mostly-plus Mandelstam signs,
  identical-particle factors, spin sums and averages, formula wrapping,
  equation-number collisions, and unresolved references.
- `main.typ` compiled successfully after Section 4.6 was reorganized around
  the in--out ladder-operator derivation.  Physical pages 111--116 (PDF pages
  114--119) were rendered and visually inspected for the general asymptotic
  expansion, finite-time creation operator, mostly-plus wave-operator sign,
  boundary differences, spectator-term separation, time ordering,
  simultaneous-pole denominators, residue factors, spinor and photon
  external-state tables, formula wrapping, equation-number collisions, and
  unresolved references.
- `main.typ` compiled successfully after Section 4.7 was added, and
  `git diff --check` reports no whitespace errors.  Physical pages 115--120
  (PDF pages 118--123) were rendered at 180 PPI and visually inspected for the
  external-state table, mostly-plus scalar, spinor, and photon propagators,
  vertex factorials, loop-counting and automorphism formulas, the practical
  rule list, the `phi^4` one-loop channel sum, and the five associated
  TikZ-Feynman diagrams.  The crossed counterterm vertex, external momentum
  labels, channel pairings, contribution labels, equation numbers, overflow,
  and references were checked; the exercise section begins cleanly on the
  following page.
- `main.typ` compiled successfully after the Chapter 5 introduction and
  Section 5.1 were added.  Physical pages 124--127 (PDF pages 127--130) were
  rendered at 180 PPI and visually inspected for the barred MS and epsilon
  notation, mostly-plus bare and counterterm Lagrangians, field-versus-pole
  normalization symbols, long counterterm expansions, momentum-space rule
  alignment, power-counting identities, pole equations, equation numbers,
  overflow, and unresolved references.  PDF page 131 was also checked to
  confirm the clean transition into the still-empty Section 5.2--5.6
  skeleton.
- `main.typ` compiled successfully after the Dyson-series and fixed-target
  scattering exercises were added.  Physical pages 112--114 were rendered
  and visually inspected for nested-integral limits, time-ordering factors,
  Mandelstam-to-laboratory kinematics, invariant `t` endpoints, recoil
  Jacobians, long formula wrapping, equation-number collisions, and unresolved
  references;
  `git diff --check` reports no whitespace errors.
- The Section 4.2 effective-action proof exercise was compiled and visually
  inspected on physical page 100.  Its inverse-Hessian identity, explicit
  three- and four-point formulas, bridge-decomposition argument, cross-
  references, and one-page layout render correctly.
- `make -C Feynman all` regenerated both Chapter 4 SVG diagrams, and
  `main.typ` compiled successfully with the exported assets.  Book pages
  95--96 were rendered at 180 PPI and inspected for missing tadpole loops,
  distinguishable parallel propagators, external-label collisions, figure
  overflow, and unresolved references; `git diff --check` reports no
  whitespace errors.
- Generated page-review images are kept outside the repository and are not
  part of the checkpoint.
