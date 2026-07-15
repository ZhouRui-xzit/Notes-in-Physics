# QFT-for-Calculators Handoff

Last updated: 2026-07-15

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
5. **2.5 Dirac Spinors and the Dirac Equation**
   - `(1/2,0) direct-sum (0,1/2)`, gamma matrices, Dirac adjoint, bilinears,
     and the free Dirac Lagrangian.
   - Solve rest-frame spinors first, then obtain general-momentum spinors with
     a standard Lorentz boost; derive normalization and spin sums.
6. **2.6 Quantization of the Dirac Field**
   - Canonical anticommutators, particle and antiparticle modes, fermionic Fock
     space, Hamiltonian, charge, one-particle states, and microcausality.
7. **2.7 Propagators from Path Integrals**
8. **2.8 Exercises**

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
- Exercises cover Lorentz algebra and finite passive transformations, scalar
  Hamiltonians, complex-scalar charge, and gauging the scalar phase symmetry.

## Next work

Implement Section 2.4, the massless vector field. The central distinction is:

- `A^mu` is a covariant field in `(1/2,1/2)` with four components.
- Physical massless spin-one states are Poincare representations with only
  helicities `+1` and `-1`.
- Equations of motion plus gauge equivalence remove the nonphysical
  polarizations.

Keep the global `U(1)` symmetry of the complex scalar conceptually distinct
from local gauge redundancy. The Maxwell kinetic term makes the connection
dynamical; local covariance alone does not.

After the vector section, split the Dirac material into the two sections in
the confirmed outline rather than compressing gamma-matrix algebra, classical
solutions, and quantization into one section.

## Open decisions

- Fix the momentum-slash convention before writing the Dirac solutions. With
  `p dot x = -omega t + bold(p) dot bold(x)` and
  `{gamma^mu,gamma^nu} = -2 eta^(mu nu)`, the proposed definition
  `slash(p) := -gamma^mu p_mu` preserves the familiar equations
  `(slash(p)-m)u=0` and `(slash(p)+m)v=0`; this proposal is not yet a final
  project convention.
- Decide how much constrained Hamiltonian analysis for the Maxwell and Dirac
  fields belongs in the main text. Detailed algebra should normally go in
  Section 2.8 exercises, while representation content and physical-state
  interpretation remain in the main text.

## Verification state

- `main.typ` compiled successfully after the scalar-QED covariance exercise
  was added.
- The affected Chapter 2 body and exercise pages were visually inspected for
  overflow, malformed equations, and unresolved references.
- `tmp/` contains generated PDF review images and is not part of the
  checkpoint.
