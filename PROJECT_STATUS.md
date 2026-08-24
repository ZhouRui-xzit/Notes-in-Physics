# QFT-for-Calculators Handoff

Last updated: 2026-08-24

## Session startup

1. Read `AGENTS.md` and this file.
2. Inspect `git status`, the relevant diff, and the current chapter source.
3. Compile `main.typ` before assuming the last working state is reproducible.
4. Treat Git and these repository documents as authoritative; conversation
   history is disposable context.

## Current milestone

Chapter 3, *Free Fields at Finite Temperature*, is complete.  Chapter 4,
*From Correlation Functions to Scattering Amplitudes*, is underway.  Sections
4.1 and 4.2 now carry the calculation from normalized perturbative
correlators through connected functions, full-propagator amputation, and 1PI
proper vertices.

## Confirmed Chapter 3 outline

1. **3.1 The Imaginary-Time Formalism**
   - Thermal trace, Euclidean-time circle, KMS condition, thermal generating
     functionals, thermodynamics, and the zero-temperature limit.
2. **3.2 Matsubara Frequencies**
   - Fourier analysis for periodic bosons and antiperiodic fermions, thermal
     delta functions, sum-integrals, and the zero-temperature limit.
3. **3.3 Thermodynamics of Free Scalar Fields**
   - Real-scalar functional determinant and pressure, the complex scalar
     grand canonical Euclidean kernel, and sourced thermal propagators.
4. **3.4 Thermodynamics of a Free Dirac Field**
   - Grand canonical Grassmann determinant, finite-density pressure and
     charge, and the sourced thermal propagator.
5. **3.5 Thermodynamics of a Free Photon Field**
   - Physical transverse functional determinant, blackbody thermodynamics,
     and the radiation-gauge thermal propagator.
6. **3.6 Matsubara Sums and Contour Methods**
   - Bosonic and fermionic thermal kernels, contour derivations of the sums
     used in Sections 3.3 and 3.4, determinant log-sums, and thermal moments.

## Completed

- Chapter 1 was corrected to the mostly-plus metric and `t = -i tau` Wick
  rotation.
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
  workflow based on LuaLaTeX and `dvisvgm`.
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

## Next work

Develop Section 4.3, *One-Particle Poles and Field Normalization*, beginning
with the exact two-point function and relating its pole location and residue
to the physical mass and asymptotic field.  Then use that result in the LSZ
reduction formula of Section 4.4.

## Open decisions

- The remaining Chapter 4 headings are provisional until Sections 4.3--4.5
  are developed in detail.

## Verification state

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
