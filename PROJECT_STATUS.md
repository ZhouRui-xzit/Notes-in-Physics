# QFT-for-Calculators Handoff

Last updated: 2026-07-22

## Session startup

1. Read `AGENTS.md` and this file.
2. Inspect `git status`, the relevant diff, and the current chapter source.
3. Compile `main.typ` before assuming the last working state is reproducible.
4. Treat Git and these repository documents as authoritative; conversation
   history is disposable context.

## Current milestone

Develop Chapter 2, *Free Quantum Fields*, using the mostly-plus metric and the
global passive transformation convention recorded in `AGENTS.md`.

## Confirmed Chapter 2 outline

1. **2.1 Lorentz Symmetry and Relativistic Fields**
   - Passive Lorentz and Poincare transformations.
   - Finite-dimensional component representations versus unitary
     one-particle Poincare representations.
2. **2.2 The Real Scalar Field**
   - Canonical commutators, invariant mass-shell modes, Fock space,
     second quantization, one-particle states, and microcausality.
3. **2.3 Complex Scalar Field**
   - Lorentz representation `1 direct-sum 1`, independent particle and
     antiparticle modes, global `U(1)` charge, and the gauge-connection bridge.
4. **2.4 The Massless Vector Field**
   - The potential as the Lorentz vector representation `(1/2,1/2)`.
   - Gauge redundancy, Maxwell dynamics, constraints, transverse modes, and
     physical helicities `+1` and `-1`.
   - The field strength as `(1,0) direct-sum (0,1)` and causality of
     gauge-invariant observables.
5. **2.5 Weyl and Dirac Spinor Representations**
   - Construct the conjugate Weyl representations from the two commuting
     complex `su(2)` algebras.
   - Form the Dirac direct sum, exponentiate its finite passive
     representation, and derive the chiral gamma matrices and projectors.
6. **2.6 The Dirac Equation and Its Solutions**
   - Dirac adjoint and bilinears; free action, equation, and conserved current.
   - Plane waves, rest spinors and standard boosts, normalization and spin
     sums, and the massless chirality-helicity limit.
7. **2.7 Quantization of the Dirac Field**
   - Canonical anticommutators, particle and antiparticle modes, fermionic Fock
     space, Hamiltonian, charge, one-particle states, and microcausality.
8. **2.8 Propagators from Path Integrals**
9. **2.9 Exercises**

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

## Next work

Perform a complete Chapter 2 editorial and physics pass, then checkpoint the
chapter before developing Section 3.1, the imaginary-time formalism.

## Open decisions

- No open structural decisions remain for Chapter 2.

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
- `tmp/pdfs/` contains generated PDF review images and extracted text and is
  not part of the checkpoint.
