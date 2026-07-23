#import "../../lib.typ":*

= Free Quantum Fields

Chapter 1 reduced a regulated free field theory to a Gaussian problem: identify
its quadratic operator, invert that operator with the required boundary
condition, and use sources to generate correlation functions.  What was not
yet explained is why different fields carry different indices and why their
quadratic operators have the forms they do.  The missing input is spacetime
symmetry.

This chapter constructs the standard free relativistic fields in increasing
order of structure.  We begin with the Lorentz and Poincare transformations
common to every field.  The real scalar then provides the basic mode expansion
and Fock-space construction.  A complex scalar adds an internal charge, and a
massless vector field introduces gauge redundancy and physical helicity.  The
Dirac field is then treated in three stages: first its Weyl and Dirac
representations, next its classical equation and plane-wave solutions, and
finally its fermionic quantization.  The final section returns to the path
integral and derives the propagators from the corresponding quadratic
operators.

For each field the calculation will follow the same pattern:

+ specify the Lorentz representation carried by its component index;
+ construct a local quadratic action that is a Lorentz scalar;
+ solve the free equation in momentum space and identify its independent
  modes;
+ quantize those modes and compute the two-point function.

The representation tells us what kind of field we are studying; the quadratic
operator tells us how that field propagates.

== Lorentz Symmetry and Relativistic Fields

A relativistic field is not merely a collection of functions with labels
attached.  Its component labels must transform in a definite way when two
inertial observers use different coordinates.  This section develops the
minimal group theory needed to state that requirement and to turn it into a
constraint on a free action.

=== Minkowski spacetime and the Poincare group

We use the mostly-plus convention fixed in @eq:mostly-plus-metric.  For two
four-vectors,

$
  tensor(eta,-mu,-nu) = upright("diag") (-1,+1,+1,+1),
  quad
  x dot y := tensor(eta,-mu,-nu) tensor(x,+mu) tensor(y,+nu),
  quad
  x^2 = -t^2 + bold(x)^2.
$ <eq:chapter-two-minkowski-convention>

A Lorentz transformation is a real linear map

$
  tensor(x',+mu) = tensor(Lambda,+mu,-nu) tensor(x,+nu)
$ <eq:lorentz-coordinate-transformation>

that preserves this inner product.  In components and matrix notation, the
condition is

$
  tensor(eta,-rho,-sigma)
  tensor(Lambda,+rho,-mu)
  tensor(Lambda,+sigma,-nu)
  = tensor(eta,-mu,-nu),
  quad arrow.l.r quad
  Lambda^T eta Lambda = eta.
$ <eq:lorentz-metric-condition>

Taking determinants shows that $det Lambda = plus.minus 1$.  The Lorentz group
also contains transformations that reverse spatial orientation or the
direction of time.  For continuous transformations generated from the
identity we restrict to the proper orthochronous component,
$upright("SO")^+ (1,3)$, characterized by $det Lambda=1$ and
$tensor(Lambda,+0,-0) >= 1$.  Parity and time reversal are discrete symmetries and will
not be needed in the calculations immediately below.

Special relativity is invariant under translations as well as Lorentz
transformations.  A Poincare transformation is therefore a pair
$g=(Lambda,b)$ acting as

$
  tensor(x',+mu)
  = tensor(Lambda,+mu,-nu) tensor(x,+nu) + tensor(b,+mu).
$ <eq:poincare-coordinate-transformation>

The composition law is

$
  (Lambda_2,b_2) (Lambda_1,b_1)
  = (Lambda_2 Lambda_1,
     b_2 + Lambda_2 b_1).
$ <eq:poincare-composition-law>

The second entry explains why the Poincare group is a semidirect rather than a
direct product: a Lorentz transformation also acts on the translation vector.

=== Infinitesimal transformations and generators

Write a Lorentz transformation close to the identity as

$
  tensor(Lambda,+mu,-nu)
  = tensor(delta,+mu,-nu)
    + tensor(omega,+mu,-nu)
    + O (omega^2).
$ <eq:infinitesimal-lorentz-transformation>

Substitution into @eq:lorentz-metric-condition gives

$
  tensor(omega,-mu,-nu)
  := tensor(eta,-mu,-rho) tensor(omega,+rho,-nu),
  quad
  tensor(omega,-mu,-nu) = -tensor(omega,-nu,-mu).
$ <eq:antisymmetric-lorentz-parameters>

Thus only six parameters are independent.  In any finite-dimensional
representation $D$, define the matrices
$tensor(Sigma,+mu,+nu)=-tensor(Sigma,+nu,+mu)$ by

$
  D (Lambda)
  = 1 - i/2
    tensor(omega,-mu,-nu) tensor(Sigma,+mu,+nu)
    + O (omega^2).
$ <eq:lorentz-representation-generators>

With the exponential convention in
@eq:lorentz-representation-generators, define the three rotation and three
boost generators by

$
  tensor(J,-i)
  := -1/2 tensor(epsilon,-i,-j,-k) tensor(Sigma,+j,+k),
  quad
  tensor(K,-i) := tensor(Sigma,+0,+i).
$ <eq:rotation-and-boost-generators>

Translations introduce four additional generators $tensor(P,+mu)$.  Their
commutators with the Lorentz generators, together with the rotation--boost
algebra, are derived in @ex:lorentz-poincare-algebra.  The point needed here is
that the generators close: successive infinitesimal spacetime transformations
are again infinitesimal Poincare transformations.  In
@ex:finite-lorentz-transformations the same generators are exponentiated to
produce a finite passive rotation and a finite passive boost.

In the mostly-plus convention the quadratic translation invariant has the
massive-shell value

$
  P^2
  = tensor(eta,-mu,-nu) tensor(P,+mu) tensor(P,+nu)
  = -m^2.
$ <eq:mostly-plus-mass-casimir>

This is the first indication that mass is a label of a Poincare
representation rather than an arbitrary frame-dependent parameter.

=== Fields as Lorentz representations

Let $V$ be a finite-dimensional representation space of the connected Lorentz
group.  A classical field of type $V$ is a representation-valued function,

$
  Psi: RR^(1,3) arrow.r V,
  quad
  x arrow.r Psi (x) = {tensor(Psi,-a) (x)}.
$ <eq:representation-valued-field>

The index $a$ labels a basis of $V$; it is not a spacetime point.  More
precisely, under the passive coordinate transformation
$x'=Lambda x+b$, covariance means

$
  tensor(Psi',-a) (x')
  = tensor(D (Lambda),-a,+b) tensor(Psi,-b) (x).
$ <eq:covariant-field-transformation>

At the same coordinate argument this becomes

$
  tensor(Psi',-a) (x)
  = tensor(D (Lambda),-a,+b)
    tensor(Psi,-b) (Lambda^(-1) (x-b)).
$ <eq:fixed-argument-field-transformation>

Equation @eq:fixed-argument-field-transformation displays the two distinct
actions of a Lorentz transformation: it moves the argument and it mixes the
components.  The value $Psi (x)$ at one point belongs to $V$, while the space
of all such functions carries the full Poincare action.

The field types used in this chapter are the basic examples.

+ A *scalar field* has $V=RR$, $D (Lambda)=1$, and
  $tensor(Sigma,+mu,+nu)=0$.  Hence

  $
    phi' (x') = phi (x).
  $ <eq:lorentz-scalar-transformation>

  A complex scalar has the same trivial Lorentz representation; its additional
  structure is an internal $U (1)$ symmetry, not another spacetime
  transformation.

+ A *vector field* has $V=RR^(1,3)$ and
  $tensor(D (Lambda),+mu,-nu)=tensor(Lambda,+mu,-nu)$.  Its intrinsic
  generators are

  $
    tensor(Sigma_V,+mu,+nu,+rho,-sigma)
    = i [
        tensor(eta,+mu,+rho) tensor(delta,+nu,-sigma)
        - tensor(eta,+nu,+rho) tensor(delta,+mu,-sigma)
      ].
  $ <eq:vector-lorentz-generators>

+ A *Dirac field* transforms as a spinor.  Strictly speaking, spinors form a
  representation of the double cover $upright("Spin")^+ (1,3)$ rather than a
  single-valued representation of $upright("SO")^+ (1,3)$.  Gamma matrices
  satisfying

  $
    [tensor(gamma,+mu),tensor(gamma,+nu)]_+
    = -2 tensor(eta,+mu,+nu)
  $ <eq:mostly-plus-clifford-algebra>

  produce the spinor generators

  $
    tensor(Sigma_D,+mu,+nu)
    = -i/4 [tensor(gamma,+mu),tensor(gamma,+nu)].
  $ <eq:dirac-lorentz-generators>

  This Clifford convention keeps $(tensor(gamma,+0))^2=1$ and
  $(tensor(gamma,+i))^2=-1$ while the spacetime metric remains mostly plus.  It
  also preserves the familiar Dirac operator
  $i tensor(gamma,+mu) tensor(partial,-mu)-m$.  The consistency of
  @eq:dirac-lorentz-generators with Lorentz covariance is derived explicitly
  in @eq:dirac-gamma-generator-commutator and
  @eq:dirac-gamma-covariance.

The scalar, vector, and spinor formulas will be derived or checked when each
field is treated in detail.  At this stage they serve as a dictionary between
an index carried by a field and the Lorentz transformation represented by that
index.

=== Orbital and intrinsic generators

The fixed-argument transformation law can also be written directly in terms
of differential operators.  Translations act on every field through

$
  tensor(P,+mu) = -i tensor(partial,+mu),
$ <eq:translation-generator-on-fields>

while the change of the spacetime argument contributes the orbital Lorentz
generator

$
  tensor(L,+mu,+nu)
  = i [
      tensor(x,+mu) tensor(partial,+nu)
      - tensor(x,+nu) tensor(partial,+mu)
    ].
$ <eq:orbital-lorentz-generator>

The total Lorentz generator acting on a field is the sum

$
  tensor(cal(M),+mu,+nu,-a,+b)
  = tensor(L,+mu,+nu) tensor(delta,-a,+b)
    + tensor(Sigma,+mu,+nu,-a,+b).
$ <eq:total-lorentz-generator-on-fields>

Expanding @eq:fixed-argument-field-transformation verifies that
@eq:translation-generator-on-fields and @eq:total-lorentz-generator-on-fields
generate the two parts of the transformation.  The explicit expansion and its
signs are left to @ex:infinitesimal-field-action.

For a scalar, only the orbital term remains.  For vectors and spinors, the
intrinsic matrix $tensor(Sigma,+mu,+nu)$ is the precise mathematical meaning
of the statement that the field carries spinorial or vectorial indices.

After quantization, $tensor(Psi,-a) (x)$ becomes an operator-valued
distribution.  We keep the same passive convention and define the transformed
operator field using the unitary Poincare representation on the Hilbert space:

$
  tensor(hat(Psi'),-a) (x)
  &:= U (Lambda,b)^(-1)
      tensor(hat(Psi),-a) (x)
      U (Lambda,b) \
  &= tensor(D (Lambda),-a,+b)
     tensor(hat(Psi),-b) (Lambda^(-1) (x-b)).
$ <eq:quantum-field-covariance>

Evaluating @eq:quantum-field-covariance at
$x'=Lambda x+b$ gives
$tensor(hat(Psi'),-a) (x')
=tensor(D (Lambda),-a,+b) tensor(hat(Psi),-b) (x)$, exactly the operator-valued
version of @eq:covariant-field-transformation.

The two representations in @eq:quantum-field-covariance must not be confused.
The finite-dimensional component representation $D (Lambda)$ is generally
not unitary because the Lorentz group is noncompact.  The representation
$U (Lambda,b)$ on physical states is unitary.  Its irreducible one-particle
sectors are labeled by mass and spin, or by helicity in the massless case.
For example, a vector potential has four Lorentz components, but a massless
spin-one particle has only two physical helicities; gauge redundancy accounts
for the difference.

=== From symmetry to free actions

For a real bosonic multiplet, a free local action has the schematic quadratic
form

$
  S_0 [Psi]
  = 1/2 integral dd(x, [4])
    tensor(Psi,-a) (x)
    tensor(K (partial),+a,+b)
    tensor(Psi,-b) (x).
$ <eq:general-quadratic-free-action>

Complex and Dirac fields use the corresponding dual field instead of a second
copy of $Psi$.  Lorentz covariance requires $K (partial)$ to map the
representation carried by $Psi$ into its dual so that every free index is
contracted.  Locality makes $K$ a differential operator, and quadraticity
ensures that different momentum modes evolve independently.

For a scalar the only invariant tensors needed at quadratic order are the
number $1$ and the metric $tensor(eta,-mu,-nu)$.  With at most two derivatives,
this gives the action already obtained in @eq:continuum-real-scalar-action,

$
  S_0 [phi]
  &= -1/2 integral dd(x, [4])
      [tensor(partial,-mu) phi (x) tensor(partial,+mu) phi (x)
       + m^2 phi (x)^2] \
  &= 1/2 integral dd(x, [4])
      phi (x) (partial^2-m^2) phi (x),
$ <eq:scalar-quadratic-kernel-mostly-plus>

where the second line follows by integration by parts.  The field equation and
momentum-space mass shell are therefore

$
  (partial^2-m^2) phi (x) = 0,
  quad
  p^2 = -m^2.
$ <eq:scalar-equation-and-mass-shell>

For spinors, the gamma matrices provide an invariant object with one Lorentz
index and two spinor indices, allowing a first-order kinetic operator.  For a
vector potential, the antisymmetric combination
$tensor(F,-mu,-nu)
=tensor(partial,-mu) tensor(A,-nu)
-tensor(partial,-nu) tensor(A,-mu)$ transforms as a tensor, while gauge
symmetry removes redundant components.  These are not isolated tricks: each
kinetic operator is dictated by the representation together with locality,
the derivative order, reality conditions, and any gauge redundancy.

The real scalar field is the simplest case because its intrinsic Lorentz
generators vanish.  We turn to it first and carry out the full mode expansion,
canonical quantization, and causality analysis.

== The Real Scalar Field

The real scalar is the simplest Lorentz representation, but it is not a
trivial quantum field theory.  Its component space is one-dimensional and
$D (Lambda)=1$, so no intrinsic index is mixed by a Lorentz transformation.
Nevertheless, the argument of the field still transforms, its normal modes
carry nonzero four-momentum, and its Hilbert space contains states with any
number of identical spin-zero particles.  This distinction between the
finite-dimensional representation carried by the field components and the
unitary Poincare representation carried by particle states is already visible
in the scalar theory.

This section follows the canonical chain

$
  upright("canonical commutators")
  arrow.r upright("normal modes")
  arrow.r upright("ladder operators")
  arrow.r upright("Fock space").
$

It then uses the same mode expansion to test relativistic causality.

=== Classical field and canonical data

For the trivial Lorentz representation, the action
@eq:scalar-quadratic-kernel-mostly-plus becomes

$
  S_0 [phi]
  = integral dd(x, [4]) cal(L)_0,
  quad
  cal(L)_0
  = 1/2 dot(phi)^2
    - 1/2 bold(nabla) phi dot bold(nabla) phi
    - 1/2 m^2 phi^2.
$ <eq:real-scalar-lagrangian>

The conjugate momentum and Hamiltonian density are therefore

$
  pi (t,bold(x))
  &= (partial cal(L)_0)/(partial dot(phi))
   = dot(phi) (t,bold(x)), \
  cal(H)_0
  &= pi dot(phi)-cal(L)_0
   = 1/2 pi^2
     + 1/2 bold(nabla) phi dot bold(nabla) phi
     + 1/2 m^2 phi^2.
$ <eq:real-scalar-canonical-data>

The signs are worth checking: with $eta=(-,+,+,+)$, the covariant equation
$(partial^2-m^2) phi=0$ is the usual Klein--Gordon equation

$
  [partial_t^2-bold(nabla)^2+m^2] phi (t,bold(x))=0.
$ <eq:klein-gordon-time-space-form>

Canonical quantization promotes the classical data on one time slice to
operator-valued distributions and imposes

$
  [hat(phi) (t,bold(x)),hat(pi) (t,bold(y))]
    &= i delta^((3)) (bold(x)-bold(y)), \
  [hat(phi) (t,bold(x)),hat(phi) (t,bold(y))]
    &= 0, \
  [hat(pi) (t,bold(x)),hat(pi) (t,bold(y))]
    &= 0.
$ <eq:real-scalar-canonical-commutators>

These relations are the continuum version of the regulated oscillator
commutators in @eq:lattice-field-commutators.  Whenever products at the same
point or factors such as $delta^((3)) (0)$ appear below, a finite box and a
spatial regulator are understood first.

=== Mode expansion on the invariant mass shell

Let

$
  tensor(k,+mu)=(omega_k,bold(k)),
  quad
  omega_k:=sqrt(bold(k)^2+m^2),
  quad
  k dot x
  := tensor(k,-mu) tensor(x,+mu)
  = -omega_k t+bold(k) dot bold(x).
$ <eq:scalar-positive-energy-shell>

The positive-energy mass-shell measure will be denoted by

$
  tilde(dd(k))
  &:= (dd(k, [3]))/((2 pi)^3 2 omega_k) \
  &= (dd(k, [4]))/((2 pi)^3)
     theta (tensor(k,+0)) delta (k^2+m^2).
$ <eq:lorentz-invariant-mass-shell-measure>

The second line explains why $tilde(dd(k))$ is Lorentz invariant even though
its first expression singles out the spatial momentum.  All momentum
integrals below run over this positive-energy mass shell.

The Hermitian field has the covariantly normalized expansion

$
  hat(phi) (x)
  = integral tilde(dd(k))
    [
      hat(a) (k) e^(i k dot x)
      + hat(a)^dagger (k) e^(-i k dot x)
    ].
$ <eq:real-scalar-mode-expansion>

The positive-frequency coefficient annihilates a quantum and the
negative-frequency coefficient creates one.  Hermiticity relates these two
parts; a real scalar does not require an independent antiparticle operator.
The equal-time relations @eq:real-scalar-canonical-commutators are equivalent
to

$
  [hat(a) (k),hat(a)^dagger (q)]
    &= 2 omega_k (2 pi)^3
       delta^((3)) (bold(k)-bold(q)), \
  [hat(a) (k),hat(a) (q)]
    &= 0,
  quad
  [hat(a)^dagger (k),hat(a)^dagger (q)]
    = 0.
$ <eq:real-scalar-ladder-commutators>

The factors $2 omega_k$ in the commutator and
$1/(2 omega_k)$ in the measure cancel when a mode is contracted.  Thus the
canonical field algebra, the invariant measure, and the normalization of the
ladder operators are one consistent choice rather than three independent
conventions.  Their explicit derivation is included in
@ex:scalar-hamiltonian-from-modes.

=== Four-momentum and second quantization

After choosing the vacuum energy as zero, the normal-ordered Hamiltonian,
number operator, and four-momentum are

$
  hat(H)_0
  &= integral tilde(dd(k))
     omega_k hat(a)^dagger (k) hat(a) (k), \
  hat(N)
  &= integral tilde(dd(k))
     hat(a)^dagger (k) hat(a) (k), \
  tensor(hat(P),+mu)
  &= integral tilde(dd(k))
     tensor(k,+mu) hat(a)^dagger (k) hat(a) (k),
  quad
  tensor(hat(P),+0)=hat(H)_0.
$ <eq:second-quantized-scalar-observables>

These are the momentum-space form of *second quantization*: the one-particle
operators $omega_k$, $1$, and $tensor(k,+mu)$ are lifted to additive
operators on a Hilbert space with variable particle number.  In particular,

$
  ket((k_1,dots,k_n))
  := hat(a)^dagger (k_1) dots
     hat(a)^dagger (k_n) ket(0)
$ <eq:scalar-fock-states>

obeys

$
  tensor(hat(P),+mu) ket((k_1,dots,k_n))
  = [sum_(r=1)^n tensor(k_r,+mu)]
    ket((k_1,dots,k_n)).
$ <eq:additive-fock-space-four-momentum>

The calculation of @eq:second-quantized-scalar-observables, including the
zero-point term before normal ordering, is left to
@ex:scalar-hamiltonian-from-modes.  Because the creation operators commute,
the Fock states are automatically symmetric under particle interchange.

=== Lorentz-invariant one-particle states

Let the invariant vacuum satisfy $hat(a) (k) ket(0)=0$, and define the
one-particle momentum eigenstate directly by

$
  ket(k):=hat(a)^dagger (k) ket(0),
  quad
  braket(k,q)
  = 2 omega_k (2 pi)^3
    delta^((3)) (bold(k)-bold(q)).
$ <eq:invariant-one-particle-normalization>

This normalization is paired with the invariant resolution of the identity
on the one-particle subspace,

$
  cal(I)_1
  = integral tilde(dd(k)) ketbra(k).
$ <eq:one-particle-invariant-completeness>

A normalizable one-particle wave packet is therefore

$
  ket(f)=integral tilde(dd(k)) f (k) ket(k),
  quad
  braket(f,f)=integral tilde(dd(k)) abs(f (k))^2.
$ <eq:one-particle-invariant-wave-packet>

For $b=0$, comparison of @eq:real-scalar-mode-expansion with the passive
operator law @eq:quantum-field-covariance gives

$
  U (Lambda)^(-1) hat(a) (k) U (Lambda)
  = hat(a) (Lambda^(-1) k).
$ <eq:passive-scalar-mode-transformation>

Consequently $U (Lambda) ket(k)=ket(Lambda k)$ when the vacuum is invariant.
The field operator still obeys the passive convention
@eq:quantum-field-covariance; the last equation identifies the one-particle
subspace as the positive-energy, mass-$m$, spin-zero representation of the
Poincare group.

The field--state matrix element is the positive-frequency Klein--Gordon
wavefunction

$
  mel(0,hat(phi) (x),k)=e^(i k dot x),
  quad
  (partial^2-m^2) mel(0,hat(phi) (x),k)=0.
$ <eq:scalar-one-particle-wavefunction>

For a wave packet $ket(f)$, the corresponding matrix element is a superposition
with the same invariant measure.  The field operator itself is not a
single-particle wavefunction: it contains both creation and annihilation
parts and maps between sectors with different particle number.

=== Field commutators and relativistic causality

The equal-time commutators are not by themselves enough for a relativistic
theory; observers disagree about simultaneity.  Using
@eq:real-scalar-mode-expansion, the commutator at arbitrary points is

$
  [hat(phi) (x),hat(phi) (y)]
  &= i Delta (x-y) \
  &= integral tilde(dd(k))
    [
      e^(i k dot (x-y))-e^(-i k dot (x-y))
    ].
$ <eq:pauli-jordan-commutator>

The right-hand side is a Lorentz scalar and depends only on the separation.
If $z=x-y$ is spacelike, then $z^2>0$ in the mostly-plus convention.  A
Lorentz frame exists in which $z^0=0$.  In that frame the two terms in
@eq:pauli-jordan-commutator cancel after
$bold(k) arrow.r -bold(k)$, and therefore

$
  [hat(phi) (x),hat(phi) (y)]=0
  quad "for" quad
  (x-y)^2>0.
$ <eq:scalar-microcausality>

This is *microcausality*: local measurements at spacelike separation are
compatible and cannot be used to transmit a signal faster than light.  It is
important that causality constrains the commutator, not the correlation
function.  The vacuum two-point function

$
  mel(0,hat(phi) (x) hat(phi) (y),0)
  = integral tilde(dd(k)) e^(i k dot (x-y))
$ <eq:scalar-wightman-function>

is generally nonzero at spacelike separation.  Vacuum fluctuations can be
correlated without allowing a controllable spacelike influence; the two
operator orderings agree there precisely because their difference is
@eq:scalar-microcausality.

== Complex Scalar Field

A complex scalar does not introduce a new Lorentz spin.  Instead, it removes
the reality condition that identified the positive- and negative-frequency
parts of the real field.  This produces two independent families of quanta
and, at the same time, an internal phase symmetry that distinguishes them.

=== Two trivial Lorentz representations

Write the complex field in terms of two real fields,

$
  phi (x)=1/sqrt(2) [phi_1 (x)+i phi_2 (x)],
  quad
  phi^dagger (x)=1/sqrt(2) [phi_1 (x)-i phi_2 (x)].
$ <eq:complex-field-real-components>

Both real components are Lorentz scalars.  Equivalently, the pair

$
  Phi (x):=mat(phi (x);phi^dagger (x))
$

transforms passively as

$
  Phi' (x)
  = Phi (Lambda^(-1) x),
  quad
  D_L (Lambda)
  = mat(1,0;0,1)
  = bold(1) "⊕" bold(1).
$ <eq:complex-scalar-lorentz-representation>

Thus the complex scalar is a direct sum of two trivial one-dimensional
Lorentz representations.  The two-dimensional space in
@eq:complex-scalar-lorentz-representation is an internal multiplicity space,
not a spinor or vector representation.

The free action is

$
  S_0 [phi,phi^dagger]
  &= -integral dd(x, [4])
     [
       tensor(partial,-mu) phi^dagger
       tensor(partial,+mu) phi
       +m^2 phi^dagger phi
     ] \
  &= -1/2 integral dd(x, [4])
     sum_(A=1)^2
     [
       tensor(partial,-mu) phi_A
       tensor(partial,+mu) phi_A
       +m^2 phi_A^2
     ].
$ <eq:free-complex-scalar-action>

The second line makes the direct sum explicit.  Variation with respect to
$phi$ and $phi^dagger$ independently gives

$
  (partial^2-m^2) phi (x)=0,
  quad
  (partial^2-m^2) phi^dagger (x)=0.
$ <eq:complex-scalar-equations-of-motion>

=== Canonical data and two oscillator families

In time--space form the Lagrangian density is

$
  cal(L)_0
  = dot(phi)^dagger dot(phi)
    -bold(nabla) phi^dagger dot bold(nabla) phi
    -m^2 phi^dagger phi.
$

Treating $phi$ and $phi^dagger$ as independent canonical coordinates gives

$
  pi
  := (partial cal(L)_0)/(partial dot(phi))
  = dot(phi)^dagger,
  quad
  pi^dagger
  := (partial cal(L)_0)/(partial dot(phi)^dagger)
  = dot(phi).
$ <eq:complex-scalar-canonical-momenta>

The nonvanishing equal-time commutators are

$
  [hat(phi) (t,bold(x)),hat(pi) (t,bold(y))]
    &= i delta^((3)) (bold(x)-bold(y)), \
  [hat(phi)^dagger (t,bold(x)),hat(pi)^dagger (t,bold(y))]
    &= i delta^((3)) (bold(x)-bold(y)).
$ <eq:complex-scalar-canonical-commutators>

All other equal-time commutators vanish.  Using the invariant measure
@eq:lorentz-invariant-mass-shell-measure, the fields expand as

$
  hat(phi) (x)
  &= integral tilde(dd(k))
     [
       hat(a) (k)e^(i k dot x)
       +hat(b)^dagger (k)e^(-i k dot x)
     ], \
  hat(phi)^dagger (x)
  &= integral tilde(dd(k))
     [
       hat(b) (k)e^(i k dot x)
       +hat(a)^dagger (k)e^(-i k dot x)
     ].
$ <eq:complex-scalar-mode-expansion>

Hermitian conjugation relates the two displayed fields, but it does not
identify $hat(a)$ with $hat(b)$.  This is precisely where the complex field
differs from the real scalar.  The canonical algebra requires

$
  [hat(a) (k),hat(a)^dagger (q)]
  &=[hat(b) (k),hat(b)^dagger (q)] \
  &=2 omega_k (2 pi)^3
    delta^((3)) (bold(k)-bold(q)),
$ <eq:complex-scalar-ladder-commutators>

with all mixed commutators and all annihilator--annihilator commutators equal
to zero.  Imposing the real condition afterward would identify the two
families, $hat(b) (k)=hat(a) (k)$, and recover
@eq:real-scalar-mode-expansion.

After normal ordering, the energy and four-momentum are

$
  hat(H)_0
  &= integral tilde(dd(k)) omega_k
     [
       hat(a)^dagger (k)hat(a) (k)
       +hat(b)^dagger (k)hat(b) (k)
     ], \
  tensor(hat(P),+mu)
  &= integral tilde(dd(k)) tensor(k,+mu)
     [
       hat(a)^dagger (k)hat(a) (k)
       +hat(b)^dagger (k)hat(b) (k)
     ].
$ <eq:complex-scalar-second-quantized-momentum>

The two species therefore have the same dispersion relation and contribute
with the same sign to energy and momentum.  Their explicit Hamiltonian and
charge-operator derivations are collected in @ex:complex-scalar-charge.

=== Particle, antiparticle, and invariant states

Let both annihilation operators kill the Poincare-invariant vacuum.  Define

$
  ket((k,+)):=hat(a)^dagger (k)ket(0),
  quad
  ket((k,-)):=hat(b)^dagger (k)ket(0).
$ <eq:complex-scalar-one-particle-states>

Their invariant normalization is

$
  braket((k,+),(q,+))
  &=braket((k,-),(q,-)) \
  &=2 omega_k (2 pi)^3
    delta^((3)) (bold(k)-bold(q)), \
  braket((k,+),(q,-))&=0.
$ <eq:complex-scalar-one-particle-normalization>

Both states belong to the same mass-$m$, spin-zero Poincare representation;
an additional internal quantum number distinguishes them.  The field
matrix elements make the roles of the two creation operators transparent:

$
  mel(0,hat(phi) (x),(k,+))
  &=e^(i k dot x), \
  mel(0,hat(phi)^dagger (x),(k,-))
  &=e^(i k dot x).
$ <eq:complex-scalar-one-particle-wavefunctions>

Thus $hat(phi)$ annihilates the $+$ particle and creates the $-$ particle,
while $hat(phi)^dagger$ does the reverse.  Calling the two sectors particle
and antiparticle anticipates the conserved charge that now distinguishes
them.

=== Global $U (1)$ symmetry and the charge operator

The free action is invariant under the constant internal transformation

$
  phi' (x)=e^(-i alpha)phi (x),
  quad
  phi'^dagger (x)=e^(i alpha)phi^dagger (x).
$ <eq:complex-scalar-global-u1>

On the pair $Phi$, this is the internal representation
$R (alpha)=upright("diag") (e^(-i alpha),e^(i alpha))$.  In the real basis
$(phi_1,phi_2)$ it is an ordinary $upright("SO") (2)$ rotation.  This transformation must
not be confused with the Lorentz representation
@eq:complex-scalar-lorentz-representation: Lorentz transformations act on the
spacetime argument, whereas $U (1)$ rotates the internal multiplicity space.

With the phase convention in @eq:complex-scalar-global-u1, the conserved
Noether current is

$
  tensor(j,+mu)
  =-i [
    phi^dagger tensor(partial,+mu) phi
    -(tensor(partial,+mu) phi^dagger)phi
  ],
  quad
  tensor(partial,-mu) tensor(j,+mu)=0.
$ <eq:complex-scalar-noether-current>

Because $tensor(partial,+0)=-partial_t$ in the mostly-plus convention, the
charge density and conserved charge are

$
  tensor(j,+0)
  &=i [phi^dagger pi^dagger-pi phi], \
  hat(Q)
  &:=integral dd(x, [3]) tensor(hat(j),+0) \
  &=integral tilde(dd(k))
    [
      hat(a)^dagger (k)hat(a) (k)
      -hat(b)^dagger (k)hat(b) (k)
    ].
$ <eq:complex-scalar-charge-operator>

The vacuum contribution cancels between the two species.  The relative minus
sign, rather than a difference in mass or energy, is what distinguishes
particle from antiparticle.  In particular,

$
  hat(Q)ket((k,+))=+ket((k,+)),
  quad
  hat(Q)ket((k,-))=-ket((k,-)).
$ <eq:complex-scalar-charge-eigenstates>

At the operator level,

$
  [hat(Q),hat(phi) (x)]=-hat(phi) (x),
  quad
  U (alpha):=e^(-i alpha hat(Q)),
  quad
  U (alpha)^(-1)hat(phi) (x)U (alpha)
  =e^(-i alpha)hat(phi) (x).
$ <eq:charge-generates-global-u1>

This uses the same $U^(-1)hat(phi)U$ order as the passive convention adopted
for spacetime transformations, although the present transformation is
internal and does not move the argument $x$.

=== Microcausality and charge flow

The only nontrivial field commutator at separated points is

$
  [hat(phi) (x),hat(phi)^dagger (y)]
  &=i Delta (x-y) \
  &=integral tilde(dd(k))
    [e^(i k dot (x-y))-e^(-i k dot (x-y))].
$ <eq:complex-scalar-field-commutator>

Consequently

$
  [hat(phi) (x),hat(phi)^dagger (y)]=0
  quad "when" quad
  (x-y)^2>0,
$ <eq:complex-scalar-microcausality>

while $[hat(phi) (x),hat(phi) (y)]=0$ identically.  The charged field is not
itself Hermitian, but locality still requires it to commute with its adjoint
at spacelike separation.

=== From a global phase to a gauge connection

The constant phase symmetry has a conserved Noether charge.  If one formally
allows the phase parameter to depend on position, then

$
  phi' (x)=e^(-i q alpha (x))phi (x)
  quad arrow.r quad
  tensor(partial,-mu)phi' (x)
  =e^(-i q alpha (x))
   [
     tensor(partial,-mu)phi (x)
     -i q tensor(partial,-mu)alpha (x)phi (x)
   ].
$ <eq:local-phase-derivative-obstruction>

The extra derivative of $alpha$ prevents the free kinetic term from being
locally invariant.  Introduce a connection $tensor(A,-mu)$ and define

$
  tensor(D,-mu)
  &:=tensor(partial,-mu)+i q tensor(A,-mu), \
  tensor(A',-mu)
  &:=tensor(A,-mu)+tensor(partial,-mu)alpha, \
  tensor(D',-mu)phi'
  &=e^(-i q alpha)tensor(D,-mu)phi.
$ <eq:scalar-gauge-covariant-derivative>

Define

$
  tensor(F,-mu,-nu)
  :=tensor(partial,-mu)tensor(A,-nu)
    -tensor(partial,-nu)tensor(A,-mu).
$

Then

$
  tensor(F',-mu,-nu)&=tensor(F,-mu,-nu), \
  (tensor(D',-mu)phi')^dagger tensor(D',+mu)phi'
  &=(tensor(D,-mu)phi)^dagger tensor(D,+mu)phi.
$ <eq:scalar-gauge-invariant-building-blocks>

The covariant derivative therefore produces a local $U (1)$-invariant
Lorentz scalar.  If the connection is also made dynamical, the simplest local
Lagrangian is

$
  cal(L)_("scalar QED")
  =-(tensor(D,-mu)phi)^dagger tensor(D,+mu)phi
   -m^2 phi^dagger phi
   -1/4 tensor(F,-mu,-nu)tensor(F,+mu,+nu).
$ <eq:scalar-electrodynamics-preview>

The Maxwell term supplies dynamics for the connection; local covariance by
itself does not.  A term $m_A^2 tensor(A,-mu)tensor(A,+mu)$ is not invariant
under @eq:scalar-gauge-covariant-derivative, so an unbroken gauge connection
with no additional compensating field is naturally massless.  This observation
provides the bridge from charged scalar matter to the massless vector field,
where gauge redundancy and the two physical helicities must be treated in
their own right.  The detailed verification and the interaction terms hidden
inside the covariant derivative are worked out in
@ex:gauging-complex-scalar.

== The Massless Vector Field

Section 2.3 introduced a connection because a position-dependent phase cannot
be differentiated covariantly by $tensor(partial,-mu)$ alone.  That
construction fixed how $tensor(A,-mu)$ transforms and couples to charged
matter, but it did not yet determine which parts of the connection are
physical, whether they propagate, or which particles they create.  We now
make the connection dynamical and answer those questions for the free Maxwell
field.

=== From a connection to gauge-invariant curvature

Under a passive Lorentz transformation $x'=Lambda x+b$, the connection is a
Lorentz covector,

$
  tensor(A',-mu) (x')
  = tensor(Lambda,-mu,+nu) tensor(A,-nu) (x).
$ <eq:maxwell-potential-lorentz-transformation>

Its complexified component space is the vector representation
$(1/2,1/2)$.  This spacetime transformation is distinct from the local
$U (1)$ gauge transformation inherited from
@eq:scalar-gauge-covariant-derivative,

$
  tensor(A,-mu) (x)
  arrow.r
  tensor(A,-mu) (x)+tensor(partial,-mu) alpha (x).
$ <eq:maxwell-gauge-equivalence>

The gauge transformation does not relate observations made in different
frames.  It relates different connection variables used to describe the same
local physical configuration.  In particular, the antisymmetric curvature

$
  tensor(F,-mu,-nu)
  :=tensor(partial,-mu) tensor(A,-nu)
    -tensor(partial,-nu) tensor(A,-mu)
$ <eq:maxwell-field-strength>

is unchanged by @eq:maxwell-gauge-equivalence.  On Minkowski spacetime, with
the usual boundary conditions, equal field strengths imply locally that two
potentials differ by a pure gauge.  Thus $tensor(F,-mu,-nu)$ captures the
local gauge-invariant information, while $tensor(A,-mu)$ remains the useful
connection variable for coupling, canonical quantization, and perturbation
theory.

The three representation-theoretic layers should be kept separate:

$
  tensor(A,-mu)
  &in (1/2,1/2), \
  tensor(F,-mu,-nu)
  &in (1,0) "⊕" (0,1), \
  cal(H)_"1 particle"
  &=cal(H)_(lambda=+1) "⊕" cal(H)_(lambda=-1).
$ <eq:maxwell-three-representation-layers>

The first two lines are finite-dimensional Lorentz representations carried by
local field components.  The last line is a unitary massless Poincare
representation carried by physical states.  Gauge equivalence and the field
equations are needed to pass from the first two descriptions to the last.

=== Lorentz content of the field strength

The antisymmetric tensor representation is obtained from the antisymmetric
part of two vector representations.  After complexification,

$
  "∧"^2 (1/2,1/2)
  = (1,0) "⊕" (0,1).
$ <eq:two-form-lorentz-decomposition>

To display the two irreducible pieces, fix the orientation by
$tensor(epsilon,+0,+1,+2,+3)=+1$ and define the Lorentzian Hodge dual

$
  tensor(tilde(F),-mu,-nu)
  :=1/2 tensor(epsilon,-mu,-nu,-rho,-sigma)
       tensor(F,+rho,+sigma).
$ <eq:maxwell-hodge-dual>

On two-forms the mostly-plus Lorentzian metric gives
$tilde(tilde(F))=-F$.  The complex combinations

$
  tensor(F^(plus.minus),-mu,-nu)
  :=1/2 [
    tensor(F,-mu,-nu)
    minus.plus i tensor(tilde(F),-mu,-nu)
  ]
$ <eq:maxwell-self-dual-field-strengths>

therefore satisfy

$
  tensor(tilde(F^(plus.minus)),-mu,-nu)
  = plus.minus i tensor(F^(plus.minus),-mu,-nu).
$ <eq:maxwell-self-duality-eigenvalues>

The two eigenspaces transform as $(1,0)$ and $(0,1)$.  For a real Maxwell
field they are complex conjugates rather than independent real fields.  This
six-component Lorentz representation is not yet the two-dimensional physical
polarization space: the Bianchi identity and the Maxwell equations still
have to be imposed.

=== Maxwell dynamics and classical constraints

The simplest local gauge-invariant action with two derivatives is

$
  S_M [A]
  =-1/4 integral dd(x,[4])
    tensor(F,-mu,-nu) tensor(F,+mu,+nu).
$ <eq:free-maxwell-action>

Its sign is fixed so that the transverse modes have positive kinetic energy
with the mostly-plus metric.  Varying the connection and integrating by parts
gives

$
  tensor(partial,-mu) tensor(F,+mu,+nu)=0.
$ <eq:vacuum-maxwell-equation>

Because the field strength was defined as the curl of a potential, it also
obeys the Bianchi identity

$
  tensor(partial,-rho) tensor(F,-mu,-nu)
  +tensor(partial,-mu) tensor(F,-nu,-rho)
  +tensor(partial,-nu) tensor(F,-rho,-mu)
  =0,
$ <eq:maxwell-bianchi-identity>

or equivalently
$tensor(partial,-mu) tensor(tilde(F),+mu,+nu)=0$.  The equation of motion and
the Bianchi identity treat the two pieces in
@eq:maxwell-self-dual-field-strengths symmetrically.

The redundancy is already visible in the quadratic kinetic operator.  Up to
a boundary term,

$
  S_M [A]
  =1/2 integral dd(x,[4])
    tensor(A,-mu)
    [
      tensor(eta,+mu,+nu) partial^2
      -tensor(partial,+mu) tensor(partial,+nu)
    ]
    tensor(A,-nu).
$ <eq:maxwell-degenerate-kinetic-operator>

Acting on $tensor(partial,-nu)alpha$ makes the expression in square brackets
vanish.  The Maxwell kinetic operator therefore has gauge _zero modes_ and
cannot be _inverted_ until a gauge condition is chosen.

The same fact appears in the canonical data.  Taking the lower components
$tensor(A,-mu)$ as coordinates, their conjugate momenta are

$
  tensor(Pi,+mu)
  :=(partial cal(L)_M)/
    (partial (tensor(partial,-0) tensor(A,-mu)))
  =-tensor(F,+0,+mu).
$ <eq:maxwell-canonical-momenta>

Antisymmetry immediately gives the primary constraint
$tensor(Pi,+0)=0$.  The time component $tensor(A,-0)$ has no independent
velocity and acts as a Lagrange multiplier.  Preserving the primary
constraint yields Gauss's law,

$
  tensor(partial,-i) tensor(Pi,+i)=0.
$ <eq:maxwell-gauss-constraint>

Thus the four components of $tensor(A,-mu)$ are not four independent
oscillators.  The two first-class constraints, together with the gauge
directions they generate, remove two canonical pairs and leave two physical
configuration-space degrees of freedom.  The detailed classical calculation
is developed in @ex:maxwell-gauge-redundancy.

=== Transverse modes and canonical quantization

For the free field, impose radiation gauge,

$
  tensor(A,-0)=0,
  quad
  tensor(partial,+i) tensor(A,-i)=0.
$ <eq:maxwell-radiation-gauge>

With suitable falloff conditions this fixes the gauge freedom relevant for
propagating radiation.  The remaining spatial field is transverse and obeys

$
  partial^2 tensor(A,-i) (x)=0.
$ <eq:transverse-maxwell-wave-equation>

Set $omega_k=abs(bold(k))$ and use the massless specialization of the
invariant measure @eq:lorentz-invariant-mass-shell-measure.  Before choosing
polarization vectors, it is useful to separate what follows from the field
equations from what is merely a basis convention.  For a fixed nonzero null
momentum, the Maxwell equation and gauge equivalence require

$
  k dot epsilon=0,
  quad
  tensor(epsilon,-mu)
  "∼"
  tensor(epsilon,-mu)+beta tensor(k,-mu).
$ <eq:maxwell-polarization-quotient-data>

Because $k^2=0$, the gauge direction $tensor(k,-mu)$ itself lies in the
three-dimensional space $k^perp$ of transverse four-vectors.  The physical
polarization space at momentum $k$ is therefore the quotient

$
  cal(P)_k
  :=k^perp/(upright("span") (k)),
  quad
  upright("dim") cal(P)_k=3-1=2.
$ <eq:maxwell-physical-polarization-space>

The quotient removes the null direction and inherits a positive-definite
inner product.  This is easiest to see in the radiation-gauge representative:
$tensor(epsilon,-0)=0$ reduces $k dot epsilon=0$ to
$bold(k) dot bold(epsilon)=0$.  The representatives then form the ordinary
two-dimensional Euclidean plane perpendicular to $bold(k)$.

Choose any real orthonormal basis $bold(e)_1 (k),bold(e)_2 (k)$ of this plane,

$
  bold(k) dot bold(e)_a (k)&=0, \
  bold(e)_a (k) dot bold(e)_b (k)&=delta_(a b),
  quad a,b=1,2.
$ <eq:maxwell-linear-polarization-basis>

A circular basis is obtained by the unitary change of basis

$
  bold(epsilon) (k,plus.minus 1)
  :=1/sqrt(2) [
    bold(e)_1 (k) plus.minus i bold(e)_2 (k)
  ],
$ <eq:maxwell-circular-polarization-basis>

with the signs assigned so that $lambda$ agrees with the helicity eigenvalue
in @eq:maxwell-momentum-and-helicity-eigenvalues.  The resulting four-vector
representatives satisfy

$
  tensor(epsilon,-0) (k,lambda)&=0, \
  tensor(k,+i) tensor(epsilon,-i) (k,lambda)&=0, \
  tensor(epsilon,+i)^* (k,lambda)
    tensor(epsilon,-i) (k,lambda')
    &=delta_(lambda lambda'),
  quad lambda,lambda'=plus.minus 1.
$ <eq:maxwell-polarization-conditions>

The first condition in @eq:maxwell-polarization-conditions selects the
radiation-gauge representative, and the second expresses transversality.  The
third is a normalization convention for the basis, not another equation of
motion.  A rescaling of $tensor(epsilon,-i) (k,lambda)$ can be compensated by
the inverse rescaling of $hat(a)_lambda (k)$; the canonical commutator fixes
their relative normalization.

Completeness is now a consequence rather than an additional assumption.  For
an arbitrary spatial vector $tensor(v,-i)$, its transverse projection can be
written either with the geometric projector or by expanding in the
orthonormal polarization basis:

$
  tensor(v^T,-i)
  &=[
      tensor(delta,-i,-j)
      -(tensor(k,-i) tensor(k,-j))/(bold(k)^2)
    ]tensor(v,+j) \
  &=sum_(lambda=plus.minus 1)
    tensor(epsilon,-i) (k,lambda)
    tensor(epsilon,-j)^* (k,lambda)
    tensor(v,+j).
$ <eq:maxwell-two-forms-of-transverse-projection>

Since the equality holds for every $tensor(v,-i)$, the two kernels must be
equal.  Hence

$
  sum_(lambda=plus.minus 1)
    tensor(epsilon,-i) (k,lambda)
    tensor(epsilon,-j)^* (k,lambda)
  =tensor(delta,-i,-j)
   -(tensor(k,-i) tensor(k,-j))/(bold(k)^2).
$ <eq:maxwell-transverse-polarization-completeness>

This spatial formula is tied to radiation gauge.  A covariant representative
of the same physical projector requires a reference vector $tensor(n,+mu)$
with $k dot n != 0$.  Choosing $n dot epsilon=0$ gives

$
  sum_(lambda=plus.minus 1)
    tensor(epsilon,-mu) (k,lambda)
    tensor(epsilon,-nu)^* (k,lambda)
  =tensor(eta,-mu,-nu)
   -(
      tensor(k,-mu) tensor(n,-nu)
      +tensor(n,-mu) tensor(k,-nu)
    )/(k dot n)
   +(n^2 tensor(k,-mu) tensor(k,-nu))/((k dot n)^2).
$ <eq:maxwell-covariant-polarization-projector>

Changing $tensor(n,+mu)$ changes this expression only by terms containing
$tensor(k,-mu)$ or $tensor(k,-nu)$.  Such terms are gauge dependent and drop
out after forming $tensor(F,-mu,-nu)$ or contracting with a conserved current.
For the time direction used in radiation gauge,
@eq:maxwell-covariant-polarization-projector reduces to
@eq:maxwell-transverse-polarization-completeness.

The operator field has the mode expansion

$
  tensor(hat(A),-i) (x)
  =sum_(lambda=plus.minus 1) integral tilde(dd(k))
   [
     tensor(epsilon,-i) (k,lambda)
       hat(a)_lambda (k)e^(i k dot x)
     +tensor(epsilon,-i)^* (k,lambda)
       hat(a)^dagger_lambda (k)e^(-i k dot x)
   ].
$ <eq:maxwell-transverse-mode-expansion>

This is the scalar expansion @eq:real-scalar-mode-expansion with one crucial
addition: the polarization vector intertwines the covariant field index with
the helicity label of the oscillator.  The two transverse polarizations
replace the single scalar oscillator at each momentum.

The reduced equal-time canonical algebra is

$
  [tensor(hat(A),-i) (t,bold(x)),
   tensor(hat(Pi),-j) (t,bold(y))]
  =i tensor(delta^T,-i,-j) (bold(x)-bold(y)),
$ <eq:maxwell-transverse-canonical-commutator>

where the transverse delta distribution is

$
  tensor(delta^T,-i,-j) (bold(x))
  :=integral (dd(k,[3]))/((2 pi)^3)
    [
      tensor(delta,-i,-j)
      -(tensor(k,-i) tensor(k,-j))/(bold(k)^2)
    ]e^(i bold(k) dot bold(x)).
$ <eq:maxwell-transverse-delta>

The projector is the canonical remnant of solving Gauss's law and removing
the longitudinal gauge direction.  Equations
@eq:maxwell-transverse-mode-expansion and
@eq:maxwell-transverse-canonical-commutator are equivalent to

$
  [hat(a)_lambda (k),hat(a)^dagger_(lambda') (q)]
  =2 omega_k (2 pi)^3 delta_(lambda lambda')
    delta^((3)) (bold(k)-bold(q)),
$ <eq:maxwell-ladder-commutators>

with all annihilator--annihilator and creator--creator commutators equal to
zero.  The explicit construction of the polarization vectors and both
directions of this canonical-equivalence calculation are given in
@ex:maxwell-polarizations-and-canonical-algebra.  After normal ordering, the
four-momentum is

$
  tensor(hat(P),+mu)
  =sum_(lambda=plus.minus 1) integral tilde(dd(k))
    tensor(k,+mu)
    hat(a)^dagger_lambda (k)hat(a)_lambda (k).
$ <eq:maxwell-second-quantized-momentum>

Both physical polarizations have positive energy
$tensor(k,+0)=omega_k=abs(bold(k))$.

=== One-particle states and helicity

Define the one-particle states

$
  ket((k,lambda))
  :=hat(a)^dagger_lambda (k)ket(0),
  quad lambda=plus.minus 1.
$ <eq:maxwell-one-particle-states>

They have invariant normalization

$
  braket((k,lambda),(q,lambda'))
  =2 omega_k (2 pi)^3 delta_(lambda lambda')
    delta^((3)) (bold(k)-bold(q)),
$ <eq:maxwell-one-particle-normalization>

and satisfy

$
  tensor(hat(P),+mu) ket((k,lambda))
  &=tensor(k,+mu) ket((k,lambda)), \
  (hat(bold(k)) dot bold(J)) ket((k,lambda))
  &=lambda ket((k,lambda)),
$ <eq:maxwell-momentum-and-helicity-eigenvalues>

where $hat(bold(k)):=bold(k)/abs(bold(k))$.  Thus the physical one-particle
space is the direct sum of the two massless helicity representations, not the
four-dimensional vector representation carried by the potential.

This distinction can also be seen directly in a plane wave.  Its
gauge-invariant amplitude is

$
  tensor(f,-mu,-nu) (k,lambda)
  =i [
    tensor(k,-mu) tensor(epsilon,-nu) (k,lambda)
    -tensor(k,-nu) tensor(epsilon,-mu) (k,lambda)
  ].
$ <eq:maxwell-plane-wave-field-strength>

Changing the polarization representative by
$tensor(epsilon,-mu) arrow.r tensor(epsilon,-mu)+beta tensor(k,-mu)$ leaves
@eq:maxwell-plane-wave-field-strength unchanged.  Under a Lorentz
transformation, a chosen transverse polarization generally transforms into
the standard polarization at the transformed momentum plus precisely such a
multiple of $tensor(k,-mu)$.  The additional term is a gauge transformation,
while the remaining little-group phase is the helicity transformation.  The
field strength therefore transforms without the gauge ambiguity and its two
self-dual sectors furnish the two helicities on shell.

=== Gauge-invariant locality

Radiation gauge makes the positive physical Hilbert space transparent, but
the transverse projector in @eq:maxwell-transverse-delta is spatially
nonlocal.  The gauge-dependent potential is therefore not the right object on
which to formulate a gauge-independent locality statement.  Local
observables are built from $tensor(F,-mu,-nu)$.

Let $Delta_0 (x-y)$ denote the massless Pauli--Jordan distribution, normalized
as in @eq:pauli-jordan-commutator with $m=0$.  Direct substitution of the
transverse mode expansion gives

$
  [tensor(hat(F),-mu,-nu) (x),
   tensor(hat(F),-rho,-sigma) (y)]
  =i [
    tensor(eta,-nu,-rho)
      tensor(partial,-mu) tensor(partial,-sigma)
    +tensor(eta,-mu,-sigma)
      tensor(partial,-nu) tensor(partial,-rho)
    -tensor(eta,-nu,-sigma)
      tensor(partial,-mu) tensor(partial,-rho)
    -tensor(eta,-mu,-rho)
      tensor(partial,-nu) tensor(partial,-sigma)
  ] Delta_0 (x-y),
$ <eq:maxwell-field-strength-commutator>

where all derivatives act on $x-y$.  Since the Pauli--Jordan distribution and
its derivatives vanish at spacelike separation,

$
  [tensor(hat(F),-mu,-nu) (x),
   tensor(hat(F),-rho,-sigma) (y)]
  =0
  quad "when" quad (x-y)^2>0.
$ <eq:maxwell-field-strength-microcausality>

The local curvature therefore satisfies microcausality even though a
particular gauge potential can display nonlocal projectors.  This completes
the chain begun in Section 2.3: local phase covariance introduces a
connection, its curvature supplies local gauge-invariant observables, and
quantization produces precisely the two helicities of a massless spin-one
particle.

== Weyl and Dirac Spinor Representations

The Maxwell field showed that four Lorentz-vector components need not
describe four physical modes: gauge equivalence and the equations leave two
helicities.  A Dirac spinor also has four components, but for a different
reason.  Its component space is the direct sum of two inequivalent
two-dimensional Lorentz representations.  There is no gauge equivalence
among these four components; the Dirac equation introduced in the next
section will instead relate them on shell.

Spinors are most naturally representations of
$upright("Spin")^+ (1,3)$, the double cover of the proper orthochronous
Lorentz group.  We first construct the two Weyl representations directly from
the Lorentz algebra, combine them into a Dirac representation, and only then
introduce gamma matrices.  This order makes clear that gamma matrices realize
an already determined representation rather than supplying it by fiat.

=== The two Weyl representations

Begin with the rotation--boost algebra derived in
@ex:lorentz-poincare-algebra.  Over the complex numbers define

$
  tensor(cal(A),-i)
  :=1/2 [tensor(J,-i)-i tensor(K,-i)],
  quad
  tensor(cal(B),-i)
  :=1/2 [tensor(J,-i)+i tensor(K,-i)].
$ <eq:weyl-su2-generators>

Substitution of the Lorentz commutators gives

$
  [tensor(cal(A),-i),tensor(cal(A),-j)]
    &=i tensor(epsilon,-i,-j,+k) tensor(cal(A),-k), \
  [tensor(cal(B),-i),tensor(cal(B),-j)]
    &=i tensor(epsilon,-i,-j,+k) tensor(cal(B),-k), \
  [tensor(cal(A),-i),tensor(cal(B),-j)]&=0.
$ <eq:complex-lorentz-algebra-split>

The complexified Lorentz algebra is therefore two commuting copies of
$upright("su") (2)$.  Its finite-dimensional irreducible representations can be labelled
by a pair $(j_A,j_B)$.  For the fundamental two-dimensional representation
use the Pauli matrices

$
  tensor(sigma,-1)&=mat(0,1;1,0),
  quad
  tensor(sigma,-2)=mat(0,-i;i,0),
  quad
  tensor(sigma,-3)=mat(1,0;0,-1), \
  tensor(sigma,-i)tensor(sigma,-j)
    &=tensor(delta,-i,-j)1_2
      +i tensor(epsilon,-i,-j,+k)tensor(sigma,-k).
$ <eq:pauli-matrix-algebra>

There are two inequivalent ways to let only one of the two $upright("su") (2)$ factors
act.  With the passive convention of this chapter, we call them

$
  tensor(J_L,-i)&=1/2 tensor(sigma,-i),
  &tensor(K_L,-i)&=+i/2 tensor(sigma,-i),
  &quad (1/2,0), \
  tensor(J_R,-i)&=1/2 tensor(sigma,-i),
  &tensor(K_R,-i)&=-i/2 tensor(sigma,-i),
  &quad (0,1/2).
$ <eq:left-right-weyl-generators>

Indeed, the first line has $tensor(cal(A),-i)=tensor(sigma,-i)/2$ and
$tensor(cal(B),-i)=0$, while the second line has the opposite assignment.
Both spinors transform identically under spatial rotations, but their boost
generators have opposite signs.  For a passive rotation with angle vector
$bold(theta)$ and a passive boost with rapidity vector $bold(chi)$,

$
  D_L (R (bold(theta)))
    &=D_R (R (bold(theta)))
      =e^(i bold(theta) dot bold(sigma)/2), \
  D_L (B (bold(chi)))
    &=e^(+bold(chi) dot bold(sigma)/2),
  &D_R (B (bold(chi)))
    &=e^(-bold(chi) dot bold(sigma)/2).
$ <eq:finite-weyl-transformations>

The boost matrices are Hermitian rather than unitary.  This is not a defect:
the noncompact Lorentz group has no nontrivial finite-dimensional unitary
representations.  Unitarity will instead belong to the action of Poincare
transformations on the quantum Hilbert space.

The two Weyl representations are complex conjugates after the spinor index is
converted with the invariant antisymmetric matrix

$
  epsilon_s:=i tensor(sigma,-2)=mat(0,1;-1,0),
  quad
  epsilon_s tensor(sigma,-i)^* epsilon_s^(-1)
  =-tensor(sigma,-i).
$ <eq:weyl-invariant-epsilon>

Consequently, if $psi_L$ is a left-handed Weyl spinor, then

$
  psi_L^c:=epsilon_s psi_L^*
$ <eq:weyl-conjugate-spinor>

transforms in the right-handed representation, and conversely.  The detailed
index form of this statement, including dotted and undotted indices, is left
to @ex:weyl-representation-properties.

=== The Dirac representation as a direct sum

A proper orthochronous Lorentz transformation never mixes the two Weyl
spaces.  To keep both of them, arrange the fields in the chiral order

$
  Psi:=mat(psi_L;psi_R),
  quad
  V_D=(1/2,0) "⊕" (0,1/2).
$ <eq:dirac-spinor-direct-sum>

The rotation and boost generators on this four-dimensional space are the
block direct sums

$
  tensor(J_D,-i)
  &=mat(
    tensor(sigma,-i)/2,0;
    0,tensor(sigma,-i)/2
  ), \
  tensor(K_D,-i)
  &=mat(
    +i tensor(sigma,-i)/2,0;
    0,-i tensor(sigma,-i)/2
  ).
$ <eq:dirac-block-generators>

Equivalently, define the six antisymmetric matrices

$
  tensor(Sigma_D,+0,+i):=tensor(K_D,-i),
  quad
  tensor(Sigma_D,+i,+j)
  :=-tensor(epsilon,+i,+j,+k)tensor(J_D,-k).
$ <eq:dirac-generators-from-blocks>

Because a commutator of block-diagonal matrices is computed block by block,
the Weyl algebra immediately gives

$
  [tensor(Sigma_D,+mu,+nu),tensor(Sigma_D,+rho,+sigma)]
  =i [
    tensor(eta,+mu,+sigma)tensor(Sigma_D,+nu,+rho)
    +tensor(eta,+nu,+rho)tensor(Sigma_D,+mu,+sigma)
    -tensor(eta,+mu,+rho)tensor(Sigma_D,+nu,+sigma)
    -tensor(eta,+nu,+sigma)tensor(Sigma_D,+mu,+rho)
  ].
$ <eq:dirac-generator-lorentz-algebra>

Thus the direct sum really is a representation of the Lorentz algebra.  Its
four components are representation coordinates, not four independent
one-particle polarizations.  The on-shell reduction to two spin states for
each frequency sign is dynamical and will follow from the Dirac equation in
the next section.

The direct sum is also the smallest spinor space on which parity can act
without leaving the representation space: spatial inversion exchanges the
left- and right-handed summands.  This observation motivates the Dirac
spinor, although parity itself lies outside
$upright("SO")^+ (1,3)$ and is not used in the construction above.

=== Finite Dirac transformations

Exponentiating the matrices in @eq:dirac-generators-from-blocks defines the
finite Dirac representation

$
  D (Lambda)
  :=e^(-i/2 tensor(omega,-mu,-nu)
              tensor(Sigma_D,+mu,+nu))
  =mat(D_L (Lambda),0;0,D_R (Lambda)).
$ <eq:finite-dirac-representation>

For rotations and boosts this becomes

$
  D (R (bold(theta)))
    &=mat(
      e^(i bold(theta) dot bold(sigma)/2),0;
      0,e^(i bold(theta) dot bold(sigma)/2)
    ), \
  D (B (bold(chi)))
    &=mat(
      e^(+bold(chi) dot bold(sigma)/2),0;
      0,e^(-bold(chi) dot bold(sigma)/2)
    ).
$ <eq:finite-dirac-rotations-and-boosts>

The classical Dirac field obeys the same passive rule as every other field in
@eq:covariant-field-transformation:

$
  Psi' (x')=D (Lambda)Psi (x),
  quad
  Psi' (x)=D (Lambda)
    Psi (Lambda^(-1) (x-b)).
$ <eq:passive-dirac-field-transformation>

The algebra relation @eq:dirac-generator-lorentz-algebra ensures that these
matrices reproduce composition in a neighborhood of the identity.  Globally,
however, a $2 pi$ spatial rotation gives

$
  D (R (2 pi hat(bold(n))))=-1_4,
  quad
  D (R (4 pi hat(bold(n))))=1_4.
$ <eq:spinor-double-cover-rotation>

The sign after a full turn is why $D$ is a single-valued representation of
$upright("Spin")^+ (1,3)$ but only a double-valued representation of
$upright("SO")^+ (1,3)$.  It cannot be seen in a classical Lorentz vector and
is the first genuinely spinorial feature of the construction.

=== Gamma matrices and chiral projectors

The direct-sum generators are already sufficient to transform a spinor.  To
write a first-order Lorentz-covariant differential equation we additionally
need numerical matrices that carry one vector index and map one Weyl summand
to the other.  Following the Srednicki convention, introduce

$
  tensor(sigma,+mu):=(1_2,tensor(sigma,-i)),
  quad
  tensor(overline(sigma),+mu):=(1_2,-tensor(sigma,-i)).
$ <eq:srednicki-sigma-four-vectors>

The Pauli algebra implies

$
  tensor(sigma,+mu)tensor(overline(sigma),+nu)
  +tensor(sigma,+nu)tensor(overline(sigma),+mu)
  =-2 tensor(eta,+mu,+nu)1_2,
$ <eq:sigma-bar-sigma-identity>

and the same identity with $sigma$ and $overline(sigma)$ interchanged.  In the
chiral basis adapted to @eq:dirac-spinor-direct-sum, define

$
  tensor(gamma,+mu)
  :=mat(
    0,tensor(sigma,+mu);
    tensor(overline(sigma),+mu),0
  ).
$ <eq:chiral-gamma-matrices>

Block multiplication and @eq:sigma-bar-sigma-identity give

$
  [tensor(gamma,+mu),tensor(gamma,+nu)]_+
  =-2 tensor(eta,+mu,+nu)1_4.
$ <eq:chiral-clifford-algebra>

This realizes the mostly-plus Clifford convention stated earlier in
@eq:mostly-plus-clifford-algebra.  In particular,
$(tensor(gamma,+0))^2=1_4$ and
$(tensor(gamma,+i))^2=-1_4$.

Gamma matrices also recover, rather than replace, the generators already
constructed from the two Weyl representations.  Direct calculation, compared
with @eq:dirac-block-generators, gives

$
  -i/4 [tensor(gamma,+0),tensor(gamma,+i)]
    &=tensor(K_D,-i)
      =tensor(Sigma_D,+0,+i), \
  -i/4 [tensor(gamma,+i),tensor(gamma,+j)]
    &=-tensor(epsilon,+i,+j,+k)tensor(J_D,-k)
      =tensor(Sigma_D,+i,+j).
$ <eq:gamma-matrices-recover-dirac-generators>

Hence, in covariant notation,

$
  tensor(Sigma_D,+mu,+nu)
  =-i/4 [tensor(gamma,+mu),tensor(gamma,+nu)],
$

which is exactly @eq:dirac-lorentz-generators.  Using the Clifford algebra
once more yields the infinitesimal intertwining identity

$
  [tensor(Sigma_D,+mu,+nu),tensor(gamma,+rho)]
  =i [
    tensor(eta,+nu,+rho)tensor(gamma,+mu)
    -tensor(eta,+mu,+rho)tensor(gamma,+nu)
  ].
$ <eq:dirac-gamma-generator-commutator>

Exponentiating this relation gives its finite form,

$
  D (Lambda)^(-1)tensor(gamma,+rho)D (Lambda)
  =tensor(Lambda,+rho,-sigma)tensor(gamma,+sigma).
$ <eq:dirac-gamma-covariance>

Thus gamma matrices are not four independently transforming fields.  They
are fixed intertwiners relating the vector representation carried by
$tensor(partial,-mu)$ to the Dirac representation carried by $Psi$.

The matrix that distinguishes the two invariant Weyl summands is

$
  gamma^5
  :=i tensor(gamma,+0)tensor(gamma,+1)
       tensor(gamma,+2)tensor(gamma,+3)
  =mat(-1_2,0;0,+1_2).
$ <eq:gamma-five-chiral-basis>

It satisfies $(gamma^5)^2=1_4$,
$[gamma^5,tensor(gamma,+mu)]_+=0$, and
$[gamma^5,tensor(Sigma_D,+mu,+nu)]=0$.  Therefore

$
  P_L:=1/2 (1_4-gamma^5),
  quad
  P_R:=1/2 (1_4+gamma^5),
  quad
  psi_L=P_L Psi,
  quad
  psi_R=P_R Psi
$ <eq:chiral-projectors>

are Lorentz-invariant projections.  The off-diagonal form of
$tensor(gamma,+mu)$ is equivalently the statement that gamma matrices reverse
chirality.

Finally, fix the Srednicki momentum-slash convention used from the next
section onward:

$
  slashed(a):=tensor(a,-mu)tensor(gamma,+mu),
  quad
  slashed(a)^2=-a^2 1_4.
$ <eq:srednicki-slash-convention>

No additional minus sign is included in the definition of $slashed(a)$.
Together with $p^2=-m^2$, the last identity gives
$slashed(p)^2=m^2$ on the massive shell.

== The Dirac Equation and Its Solutions

Section 2.5 determined how a Dirac spinor transforms but did not yet choose
its dynamics.  We now construct the Lorentz-covariant dual spinor and the
first-order free action, solve the resulting equation first at rest, and use
the finite representation $D (Lambda)$ to obtain every massive plane wave.
This keeps the logical roles separate: representation theory determines how
components transform, while the equation determines which component
combinations propagate on shell.

=== Dirac adjoint and bilinears

The ordinary Hermitian norm $Psi^dagger Psi$ is not a Lorentz scalar because
the finite-dimensional boost matrices in @eq:finite-dirac-rotations-and-boosts
are not unitary.  The chiral gamma matrices instead satisfy

$
  (tensor(gamma,+mu))^dagger
    &=tensor(gamma,+0)tensor(gamma,+mu)tensor(gamma,+0), \
  (tensor(Sigma_D,+mu,+nu))^dagger
    &=tensor(gamma,+0)tensor(Sigma_D,+mu,+nu)
      tensor(gamma,+0).
$ <eq:dirac-gamma-generator-hermiticity>

The second identity and the exponential definition of $D (Lambda)$ imply the
pseudo-unitarity relation

$
  D (Lambda)^dagger tensor(gamma,+0)D (Lambda)
  =tensor(gamma,+0).
$ <eq:dirac-pseudo-unitarity>

This identifies the invariant dual.  Define the *Dirac adjoint* by

$
  overline(Psi) (x)
  :=Psi (x)^dagger tensor(gamma,+0).
$ <eq:dirac-adjoint-definition>

Using @eq:passive-dirac-field-transformation and
@eq:dirac-pseudo-unitarity gives

$
  overline(Psi') (x')
  =overline(Psi) (x)D (Lambda)^(-1).
$ <eq:dirac-adjoint-transformation>

Therefore $overline(Psi)Psi$ is a Lorentz scalar.  In the chiral basis,

$
  overline(Psi)=(psi_R^dagger,psi_L^dagger),
  quad
  overline(Psi)Psi
  =psi_R^dagger psi_L+psi_L^dagger psi_R.
$ <eq:dirac-scalar-in-chiral-components>

The scalar pairs opposite chiralities.  This is the representation-theoretic
reason that a Lorentz-invariant Dirac mass will couple the two Weyl equations.

The same transformation rule organizes the standard bilinears:

$
  overline(Psi)Psi,
  &quad i overline(Psi)gamma^5 Psi, \
  overline(Psi)tensor(gamma,+mu)Psi,
  &quad overline(Psi)tensor(gamma,+mu)gamma^5 Psi, \
  overline(Psi)tensor(Sigma_D,+mu,+nu)Psi.&
$ <eq:dirac-bilinear-list>

Under the connected Lorentz group these transform, respectively, as two
scalars, two vectors, and an antisymmetric rank-two tensor.  Parity, if added,
distinguishes the pseudoscalar and axial vector from their ordinary partners.
For example, @eq:dirac-gamma-covariance gives

$
  overline(Psi')tensor(gamma,+mu)Psi'
  =tensor(Lambda,+mu,-nu)
    overline(Psi)tensor(gamma,+nu)Psi.
$ <eq:dirac-vector-bilinear-transformation>

In particular, the time component has the positive classical form

$
  overline(Psi)tensor(gamma,+0)Psi=Psi^dagger Psi.
$ <eq:dirac-density-positive-form>

The adjoint and the transformation properties of all five bilinear types are
worked out directly in @ex:dirac-adjoint-and-currents.

=== Free action, equation, and currents

The local quadratic Minkowski action with one derivative is

$
  S_D [overline(Psi),Psi]
  :=integral dd(x,[4]) cal(L)_D,
  quad
  cal(L)_D
  :=overline(Psi)
    [i tensor(gamma,+mu)tensor(partial,-mu)-m]Psi.
$ <eq:free-dirac-action>

Its Lorentz invariance follows from
@eq:dirac-adjoint-transformation,
@eq:dirac-gamma-covariance, and the invariance of $dd(x,[4])$.  The action is
real with the usual boundary conditions: Hermitian conjugation of the kinetic
term changes it only by the total derivative
$-i tensor(partial,-mu)
[overline(Psi)tensor(gamma,+mu)Psi]$.

For the variational problem treat $Psi$ and $overline(Psi)$ as independent.
Variation with respect to $overline(Psi)$ gives the Dirac equation,

$
  [i tensor(gamma,+mu)tensor(partial,-mu)-m]Psi (x)=0,
$ <eq:free-dirac-equation>

while variation with respect to $Psi$, followed by one integration by parts,
gives the adjoint equation

$
  i [tensor(partial,-mu)overline(Psi) (x)]
    tensor(gamma,+mu)
  +m overline(Psi) (x)=0.
$ <eq:adjoint-dirac-equation>

Writing @eq:free-dirac-equation in its two Weyl blocks makes the role of the
mass explicit:

$
  i tensor(sigma,+mu)tensor(partial,-mu)psi_R-m psi_L&=0, \
  i tensor(overline(sigma),+mu)tensor(partial,-mu)psi_L-m psi_R&=0.
$ <eq:coupled-weyl-equations>

At $m=0$ the two equations decouple.  For $m!=0$, propagation continually
relates the two chiral summands, so a massive Dirac solution cannot in general
have a definite chirality.

Multiplication of @eq:free-dirac-equation by the conjugate first-order
operator gives

$
  [i tensor(gamma,+mu)tensor(partial,-mu)+m]
  [i tensor(gamma,+nu)tensor(partial,-nu)-m]
  =partial^2-m^2.
$ <eq:dirac-operator-square>

Every component therefore obeys

$
  (partial^2-m^2)Psi (x)=0.
$ <eq:dirac-implies-klein-gordon>

The first-order equation contains more information than this Klein--Gordon
equation: it selects the allowed relations among the four components for each
momentum.

The action also has the global phase symmetry

$
  Psi (x) arrow.r e^(-i alpha)Psi (x),
  quad
  overline(Psi) (x) arrow.r
    overline(Psi) (x)e^(+i alpha).
$ <eq:dirac-global-phase-symmetry>

Noether's theorem gives

$
  tensor(j,+mu)
  :=overline(Psi)tensor(gamma,+mu)Psi,
  quad
  tensor(partial,-mu)tensor(j,+mu)=0.
$ <eq:dirac-noether-current>

The conservation law also follows immediately by combining
@eq:free-dirac-equation with @eq:adjoint-dirac-equation.  Equation
@eq:dirac-density-positive-form shows that $tensor(j,+0)=Psi^dagger Psi$ for a
classical solution.  After quantization the normal-ordered integral of this
current measures particle number minus antiparticle number, as developed in
Section 2.7.

For time evolution, set

$
  tensor(alpha,+i)
  :=tensor(gamma,+0)tensor(gamma,+i),
  quad
  beta:=tensor(gamma,+0).
$ <eq:dirac-alpha-beta-matrices>

Multiplying the Dirac equation by $tensor(gamma,+0)$ gives

$
  i partial_t Psi
  =cal(H)_D Psi,
  quad
  cal(H)_D
  :=-i tensor(alpha,+i)tensor(partial,-i)+beta m,
$ <eq:dirac-hamiltonian-equation>

and the corresponding Hamiltonian density is
$cal(H)=Psi^dagger cal(H)_D Psi$.  Since the Lagrangian is first order in
$partial_t Psi$, its canonical momenta are schematically

$
  Pi_Psi=i Psi^dagger,
  quad
  Pi_(overline(Psi))=0.
$ <eq:dirac-first-order-canonical-momenta>

These are constraints rather than independent definitions of two velocities.
The graded canonical analysis is not needed to solve the classical equation;
its quantum consequence is the fermionic equal-time anticommutator introduced
in Section 2.7.

=== Plane waves and standard boosts

Let

$
  tensor(p,+mu)=(E_p,bold(p)),
  quad
  E_p:=sqrt(bold(p)^2+m^2),
  quad
  p dot x=-E_p t+bold(p) dot bold(x).
$ <eq:dirac-positive-energy-shell>

With the Srednicki slash convention @eq:srednicki-slash-convention, take the
two plane-wave forms

$
  Psi_p^((+)) (x)&=u (p)e^(i p dot x), \
  Psi_p^((-)) (x)&=v (p)e^(-i p dot x).
$ <eq:dirac-positive-negative-frequency-waves>

Substitution into @eq:free-dirac-equation gives

$
  [slashed(p)+m]u (p)&=0, \
  [-slashed(p)+m]v (p)&=0.
$ <eq:dirac-momentum-space-equations>

The relative signs follow from differentiating the two exponentials; they are
not an independent convention.  On shell,

$
  [slashed(p)-m][slashed(p)+m]
  =[-slashed(p)-m][-slashed(p)+m]=0,
$ <eq:dirac-on-shell-factorization>

because $slashed(p)^2=m^2$.  Each of the two matrices in
@eq:dirac-momentum-space-equations has a two-dimensional kernel.  The two
$u$ solutions and two $v$ solutions exhaust the four independent plane-wave
solutions for a fixed positive-energy momentum label $p$.

This statement is clearest in the rest frame.  For
$tensor(p_*,+mu)=(m,bold(0))$, one has
$slashed(p_*)=-m tensor(gamma,+0)$, so

$
  tensor(gamma,+0)u_s (p_*)&=+u_s (p_*), \
  tensor(gamma,+0)v_s (p_*)&=-v_s (p_*),
  quad s=1,2.
$ <eq:rest-dirac-spinor-eigenvalue-equations>

Choose two orthonormal bases of two-component spinors,

$
  xi_s^dagger xi_(s')=delta_(s s'),
  &quad sum_(s=1)^2 xi_s xi_s^dagger=1_2, \
  eta_s^dagger eta_(s')=delta_(s s'),
  &quad sum_(s=1)^2 eta_s eta_s^dagger=1_2.
$ <eq:two-spinor-basis-completeness>

A convenient rest-frame normalization is

$
  u_s (p_*)=sqrt(m)mat(xi_s;xi_s),
  quad
  v_s (p_*)=sqrt(m)mat(eta_s;-eta_s).
$ <eq:rest-dirac-spinors>

The overall phases and the relation between the $xi_s$ and $eta_s$ bases are
conventional at this classical stage.  They will be coordinated with particle
and antiparticle operators in Section 2.7.

Now obtain arbitrary momentum without solving another four-by-four kernel.
Let $chi_p>=0$ satisfy

$
  cosh chi_p=(E_p)/m,
  quad
  sinh chi_p=(abs(bold(p)))/m,
$ <eq:massive-standard-rapidity>

and choose the passive standard boost

$
  L (p):=B (-chi_p hat(bold(p))),
  quad
  L (p)p_*=p.
$ <eq:massive-standard-boost>

The minus sign is the same passive-boost sign encountered in
@ex:finite-lorentz-transformations.  From
@eq:finite-dirac-rotations-and-boosts,

$
  D (L (p))
  =1/sqrt(2m(E_p+m))
  mat(
    (E_p+m)1_2-bold(sigma) dot bold(p),0;
    0,(E_p+m)1_2+bold(sigma) dot bold(p)
  ).
$ <eq:massive-standard-spinor-boost>

Gamma covariance then guarantees that

$
  u_s (p):=D (L (p))u_s (p_*),
  quad
  v_s (p):=D (L (p))v_s (p_*)
$ <eq:boosted-dirac-spinor-definition>

solve @eq:dirac-momentum-space-equations.  Multiplying the blocks gives the
explicit chiral-basis spinors

$
  u_s (p)
  &=1/sqrt(2(E_p+m))
    mat(
      [(E_p+m)1_2-bold(sigma) dot bold(p)]xi_s;
      [(E_p+m)1_2+bold(sigma) dot bold(p)]xi_s
    ), \
  v_s (p)
  &=1/sqrt(2(E_p+m))
    mat(
      [(E_p+m)1_2-bold(sigma) dot bold(p)]eta_s;
      -[(E_p+m)1_2+bold(sigma) dot bold(p)]eta_s
    ).
$ <eq:explicit-boosted-dirac-spinors>

The most general classical solution can consequently be expanded as

$
  Psi (x)
  =sum_(s=1)^2 integral tilde(dd(p)) [
    c_s (p)u_s (p)e^(i p dot x)
    +d_s (p)v_s (p)e^(-i p dot x)
  ],
$ <eq:classical-dirac-mode-expansion>

where $tilde(dd(p))$ is the invariant measure
@eq:lorentz-invariant-mass-shell-measure.  At this point $c_s$ and $d_s$ are
ordinary mode coefficients.  Promoting them to fermionic annihilation and
creation operators is the separate step taken in Section 2.7.

=== Normalization, spin sums, and the massless limit

Pseudo-unitarity @eq:dirac-pseudo-unitarity shows that Dirac inner products are
unchanged by the common standard boost.  The rest spinors therefore give

$
  overline(u)_s (p)u_(s') (p)&=+2m delta_(s s'), \
  overline(v)_s (p)v_(s') (p)&=-2m delta_(s s'), \
  overline(u)_s (p)v_(s') (p)
    &=overline(v)_s (p)u_(s') (p)=0.
$ <eq:dirac-covariant-spinor-normalization>

The positive density @eq:dirac-density-positive-form instead gives

$
  u_s (p)^dagger u_(s') (p)
  =v_s (p)^dagger v_(s') (p)
  =2E_p delta_(s s').
$ <eq:dirac-equal-time-spinor-normalization>

Equivalently, the vector bilinears are

$
  overline(u)_s (p)tensor(gamma,+mu)u_(s') (p)
  =overline(v)_s (p)tensor(gamma,+mu)v_(s') (p)
  =2 tensor(p,+mu)delta_(s s').
$ <eq:dirac-spinor-vector-bilinears>

The basis-independent completeness relations are the spin sums

$
  sum_(s=1)^2 u_s (p)overline(u)_s (p)
    &=-slashed(p)+m, \
  sum_(s=1)^2 v_s (p)overline(v)_s (p)
    &=-slashed(p)-m.
$ <eq:dirac-spin-sums>

These signs are fixed by the mostly-plus Clifford algebra and the definition
$slashed(p)=tensor(p,-mu)tensor(gamma,+mu)$.  For example, at rest the first
line is $m(1_4+tensor(gamma,+0))$, exactly the sum constructed from
@eq:rest-dirac-spinors.  The associated rank-two projectors are

$
  Lambda_u (p)&:=(-slashed(p)+m)/(2m), \
  Lambda_v (p)&:=(slashed(p)+m)/(2m), \
  Lambda_u^2&=Lambda_u,
  quad Lambda_v^2=Lambda_v,
  quad Lambda_u Lambda_v=0,
  quad Lambda_u+Lambda_v=1_4.
$ <eq:dirac-energy-projectors>

Notice that the $v$ spin sum is $-2m Lambda_v$ because the covariant
$v$ norm in @eq:dirac-covariant-spinor-normalization is negative.  The
ordinary norm $v^dagger v$ remains positive.

The limit $m arrow.r 0$ must be taken at fixed null momentum because a
massless particle has no rest frame.  The Weyl equations
@eq:coupled-weyl-equations then decouple, and the vector and axial currents

$
  tensor(j,+mu)&=overline(Psi)tensor(gamma,+mu)Psi, \
  tensor(j_5,+mu)&=overline(Psi)tensor(gamma,+mu)gamma^5 Psi
$

obey

$
  tensor(partial,-mu)tensor(j,+mu)&=0, \
  tensor(partial,-mu)tensor(j_5,+mu)
    &=2i m overline(Psi)gamma^5 Psi.
$ <eq:classical-dirac-vector-axial-divergences>

Thus both $P_L Psi$ and $P_R Psi$ carry independently conserved currents in
the massless free theory.

To compare chirality with helicity, take a positive-frequency null momentum
$tensor(p,+mu)=(E,0,0,E)$.  The equation $slashed(p)u (p)=0$ reduces to

$
  tensor(sigma,-3)u_R=+u_R,
  quad
  tensor(sigma,-3)u_L=-u_L.
$ <eq:massless-dirac-helicity-components>

With the spin-one-half helicity operator

$
  h:=hat(bold(p)) dot bold(J)_D
  =1/2 mat(
    hat(bold(p)) dot bold(sigma),0;
    0,hat(bold(p)) dot bold(sigma)
  ),
$ <eq:dirac-helicity-operator>

this gives, for positive-frequency massless solutions,

$
  gamma^5 u (p)=2h u (p).
$ <eq:massless-chirality-helicity-relation>

Right chirality therefore carries helicity $+1/2$ and left chirality helicity
$-1/2$.  A spatial rotation extends the result to any null momentum.  For a
massive spinor both chiralities are present and helicity can be reversed by a
change of inertial frame; in the massless theory neither statement is true.
The corresponding antiparticle interpretation of the negative-frequency
solutions will be fixed when the field is quantized in Section 2.7.

== Quantization of the Dirac Field

The classical expansion @eq:classical-dirac-mode-expansion contains two
positive-energy spin states and two negative-frequency spin states.  A
quantum field must turn these four solutions into operators while preserving
positive Hilbert-space norms, a Hamiltonian bounded below, and relativistic
locality.  These requirements are met simultaneously by interpreting the
negative-frequency coefficient as an antiparticle creation operator and by
using fermionic anticommutators.

=== Mode expansion and canonical anticommutators

The first-order momenta @eq:dirac-first-order-canonical-momenta are
constraints.  If the classical spinor components are treated as
Grassmann-odd variables, eliminating those constraints with the graded Dirac
bracket and then quantizing gives the equal-time algebra below.  We use it in
the main text as the canonical quantization rule and leave the explicit
constraint-matrix calculation to @ex:dirac-constraints-and-locality.

For any two fermionic operators define

$
  [hat(A),hat(B)]_+
  :=hat(A)hat(B)+hat(B)hat(A).
$ <eq:fermionic-anticommutator-definition>

The nonzero equal-time anticommutator is

$
  [hat(Psi)_alpha (t,bold(x)),
    hat(Psi)_beta^dagger (t,bold(y))]_+
  =delta_(alpha beta)delta^((3)) (bold(x)-bold(y)),
$ <eq:dirac-equal-time-canonical-anticommutator>

while the anticommutators of two fields or two adjoint fields vanish.  The
operator solution of the free Dirac equation is

$
  hat(Psi) (x)
  &=sum_(s=1)^2 integral tilde(dd(p)) [
    hat(b)_s (p)u_s (p)e^(i p dot x)
    +hat(d)_s^dagger (p)v_s (p)e^(-i p dot x)
  ], \
  overline(hat(Psi)) (x)
  &=sum_(s=1)^2 integral tilde(dd(p)) [
    hat(b)_s^dagger (p)overline(u)_s (p)e^(-i p dot x)
    +hat(d)_s (p)overline(v)_s (p)e^(i p dot x)
  ].
$ <eq:quantized-dirac-mode-expansion>

Here $hat(b)_s$ annihilates a particle and $hat(d)_s^dagger$ creates an
antiparticle.  Hermitian conjugation fixes the second line; in particular,
the two operator families are independent rather than related by conjugation.
The spinor normalization @eq:dirac-equal-time-spinor-normalization and the
invariant measure require

$
  [hat(b)_s (p),hat(b)_r^dagger (q)]_+
  &=[hat(d)_s (p),hat(d)_r^dagger (q)]_+ \
  &=2E_p (2 pi)^3 delta_(s r)
    delta^((3)) (bold(p)-bold(q)),
$ <eq:dirac-ladder-anticommutators>

with every other ladder-operator anticommutator equal to zero.  These factors
are not an additional convention.  Substituting
@eq:quantized-dirac-mode-expansion into
@eq:dirac-equal-time-canonical-anticommutator and using the spin sums gives
the identity matrix in spinor space.  Equivalently, the mode projections at
$t=0$ invert the field expansion and lead directly to
@eq:dirac-ladder-anticommutators.  Both derivations are worked out in
@ex:dirac-mode-algebra-and-observables.

=== Hamiltonian, charge, and antiparticles

The one-particle Dirac Hamiltonian has eigenvalue $+E_p$ on
$u_s (p)e^(i p dot x)$ and $-E_p$ on
$v_s (p)e^(-i p dot x)$.  Consequently, before reordering the operators,

$
  hat(H)
  =sum_(s=1)^2 integral tilde(dd(p)) E_p [
    hat(b)_s^dagger (p)hat(b)_s (p)
    -hat(d)_s (p)hat(d)_s^dagger (p)
  ].
$ <eq:dirac-hamiltonian-before-normal-ordering>

The second term is where the statistics matters.  The fermionic algebra gives
$-hat(d)hat(d)^dagger=hat(d)^dagger hat(d)$ plus an operator-independent
vacuum contribution.  Normal ordering removes that divergent c-number and
leaves

$
  hat(H)
  &=sum_(s=1)^2 integral tilde(dd(p)) E_p [
    hat(b)_s^dagger (p)hat(b)_s (p)
    +hat(d)_s^dagger (p)hat(d)_s (p)
  ], \
  tensor(hat(P),+mu)
  &=sum_(s=1)^2 integral tilde(dd(p)) tensor(p,+mu) [
    hat(b)_s^dagger (p)hat(b)_s (p)
    +hat(d)_s^dagger (p)hat(d)_s (p)
  ].
$ <eq:dirac-normal-ordered-four-momentum>

Both particles and antiparticles therefore carry positive energy and the
same mass.  Had one imposed bosonic commutators with positive norm, the
$hat(d)^dagger hat(d)$ term would retain a minus sign and the energy would be
unbounded below.  Reversing that commutator would repair the energy only by
giving $hat(d)^dagger ket(0)$ negative norm.  The anticommutator avoids both
failures.  This calculation displays the free-field consequence of the
spin--statistics connection; it is not by itself a proof of the general
spin--statistics theorem.

The phase symmetry @eq:dirac-global-phase-symmetry gives another additive
operator.  Normal ordering the spatial integral of $tensor(j,+0)$ yields

$
  hat(Q)
  =sum_(s=1)^2 integral tilde(dd(p)) [
    hat(b)_s^dagger (p)hat(b)_s (p)
    -hat(d)_s^dagger (p)hat(d)_s (p)
  ].
$ <eq:dirac-normal-ordered-charge>

Energy adds the two occupation numbers, whereas charge subtracts them.  In
particular,

$
  [hat(Q),hat(b)_s^dagger (p)]
  &=+hat(b)_s^dagger (p), \
  [hat(Q),hat(d)_s^dagger (p)]
  &=-hat(d)_s^dagger (p), \
  [hat(Q),hat(Psi) (x)]&=-hat(Psi) (x).
$ <eq:dirac-charge-commutators>

Thus the negative-frequency solutions have become positive-energy quanta of
opposite charge.  With
$U (alpha):=e^(-i alpha hat(Q))$, the last line gives

$
  U (alpha)^(-1)hat(Psi) (x)U (alpha)
  =e^(-i alpha)hat(Psi) (x),
$ <eq:dirac-quantum-global-phase>

in the same passive operator order used throughout this chapter.

=== Fermionic Fock space and one-particle states

Let the Poincare-invariant vacuum obey

$
  hat(b)_s (p)ket(0)=0,
  quad
  hat(d)_s (p)ket(0)=0
  quad "for every" quad (p,s),
$ <eq:dirac-fock-vacuum>

and choose its normal-ordered energy and charge to vanish.  Particle and
antiparticle states are

$
  ket((p,s))
  :=hat(b)_s^dagger (p)ket(0),
  quad
  ket((overline(p),s))
  :=hat(d)_s^dagger (p)ket(0).
$ <eq:dirac-one-particle-states>

Their nonzero inner products are

$
  braket((p,s),(q,r))
  &=braket((overline(p),s),(overline(q),r)) \
  &=2E_p (2 pi)^3 delta_(s r)
    delta^((3)) (bold(p)-bold(q)),
$ <eq:dirac-one-particle-normalization>

and particle states are orthogonal to antiparticle states.  This Hilbert-space
norm is positive for both sectors.  It must not be confused with the
covariant spinor contraction
$overline(v)_s v_s=-2m$, which is an indefinite Lorentz-invariant bilinear,
not a state norm.

The anticommutators also imply

$
  hat(b)_s^dagger (p)hat(b)_r^dagger (q)
  &=-hat(b)_r^dagger (q)hat(b)_s^dagger (p), \
  [hat(b)_s^dagger (p)]^2&=0,
  quad
  [hat(d)_s^dagger (p)]^2=0,
$ <eq:dirac-fock-antisymmetry>

with analogous relations for mixed multiparticle states.  Fermionic Fock
states are therefore antisymmetric under exchange, and a fixed one-particle
mode can be occupied at most once.  The observables above act as

$
  tensor(hat(P),+mu)ket((p,s))
    &=tensor(p,+mu)ket((p,s)), \
  tensor(hat(P),+mu)ket((overline(p),s))
    &=tensor(p,+mu)ket((overline(p),s)), \
  hat(Q)ket((p,s))&=+ket((p,s)), \
  hat(Q)ket((overline(p),s))&=-ket((overline(p),s)).
$ <eq:dirac-one-particle-observables>

The corresponding field--state matrix elements recover the classical
spinor wavefunctions:

$
  mel(0,hat(Psi) (x),(p,s))
    &=u_s (p)e^(i p dot x), \
  mel((overline(p),s),hat(Psi) (x),0)
    &=v_s (p)e^(-i p dot x).
$ <eq:dirac-one-particle-wavefunctions>

Proper orthochronous Poincare transformations mix the two spin labels by the
massive little-group representation but do not mix the particle and
antiparticle sectors.  Thus the one-particle space is the direct sum of two
positive-energy mass-$m$, spin-one-half representations, distinguished by
the conserved charge.

=== Fermionic locality

Equal-time anticommutators must still imply a covariant locality statement.
Let $z:=x-y$ and write the mass-$m$ Pauli--Jordan distribution as

$
  i Delta_m (z)
  :=integral tilde(dd(p)) [e^(i p dot z)-e^(-i p dot z)].
$ <eq:massive-pauli-jordan-distribution>

Using @eq:dirac-ladder-anticommutators and the two spin sums gives

$
  [hat(Psi)_alpha (x),overline(hat(Psi))_beta (y)]_+
  &=integral tilde(dd(p)) [
    (-slashed(p)+m)_(alpha beta)e^(i p dot z)
    +(-slashed(p)-m)_(alpha beta)e^(-i p dot z)
  ] \
  &=[i tensor(gamma,+mu)tensor(partial,-mu)+m]_(alpha beta)
    i Delta_m (z),
$ <eq:dirac-covariant-field-anticommutator>

where the derivative acts on $z=x-y$.  At equal time this becomes

$
  [hat(Psi)_alpha (t,bold(x)),
    overline(hat(Psi))_beta (t,bold(y))]_+
  =tensor(gamma,+0)_(alpha beta)
    delta^((3)) (bold(x)-bold(y)),
$ <eq:dirac-equal-time-covariant-anticommutator>

which is equivalent to
@eq:dirac-equal-time-canonical-anticommutator.  For spacelike separation,
$z^2>0$, the Pauli--Jordan distribution and all of its derivatives vanish.
Therefore

$
  [hat(Psi)_alpha (x),overline(hat(Psi))_beta (y)]_+=0
  quad "when" quad (x-y)^2>0.
$ <eq:dirac-fermionic-microcausality>

The elementary spinor field is Grassmann odd, so its locality condition is an
anticommutator.  Suitably defined physical local observables, for example
normal-ordered bilinears in the free theory, have even fermion parity.  For
constant spinor matrices $Gamma_1,Gamma_2$ and distinct spacelike points,

$
  [overline(hat(Psi)) (x)Gamma_1 hat(Psi) (x),
    overline(hat(Psi)) (y)Gamma_2 hat(Psi) (y)]=0.
$ <eq:dirac-even-observable-locality>

Moving one bilinear past the other makes two fermionic exchanges, so their
minus signs cancel.  Hence measurable local densities commute at spacelike
separation just as in the scalar theory.  By contrast, the Wightman function

$
  mel(0,hat(Psi)_alpha (x)
    overline(hat(Psi))_beta (y),0)
  =integral tilde(dd(p))
    (-slashed(p)+m)_(alpha beta)e^(i p dot (x-y))
$ <eq:dirac-wightman-function>

is generally nonzero outside the light cone.  Once again, causality concerns
the order-sensitive difference or graded difference, not the absence of
vacuum correlations.  Time ordering these spinor fields introduces one more
fermionic sign; that construction is postponed to Section 2.8.

== Propagators from Path Integrals

The preceding sections obtained free fields by solving their equations and
quantizing the resulting modes.  Chapter 1 supplied a second route: a
regulated quadratic path integral is a finite-dimensional Gaussian, its
inverse quadratic kernel is a two-point function, and the continuum notation
records the regulated limit.  We now apply that route to the fields of this
chapter and verify that it produces the same time-ordered correlators as the
operator construction.

No new definition of the functional measure is needed here.  All path
integrals below are normalized by their zero-source value, and their
Minkowski meaning is fixed by continuation from the Euclidean Gaussian or,
equivalently, by the Feynman $i 0$ prescription.  We use the Fourier convention

$
  F (x)
  =integral (dd(p,[4]))/((2 pi)^4)
    e^(i p dot x) F (p),
  quad
  p dot x=-tensor(p,+0) t+bold(p) dot bold(x),
$ <eq:chapter-two-fourier-convention>

so $tensor(partial,-mu)$ acts as $i tensor(p,-mu)$ in momentum space.  This
choice agrees with all positive-frequency mode expansions above and will make
the mostly-plus signs visible rather than hiding them in a change of Fourier
convention.

=== Scalar kernels and Feynman boundary conditions

Up to a boundary term, the real-scalar action
@eq:real-scalar-lagrangian is

$
  S_0 [phi]
  =1/2 integral dd(x,[4])
    phi (x) cal(K)_x phi (x),
  quad
  cal(K):=partial^2-m^2.
$ <eq:real-scalar-quadratic-operator>

Introduce a real commuting source and normalize the vacuum functional:

$
  cal(Z)_(0,M) [J]
  :=frac(
    integral cal(D) phi
      e^(i S_0 [phi]+i integral J phi),
    integral cal(D) phi e^(i S_0 [phi])
  ).
$ <eq:normalized-minkowski-scalar-functional>

The regulated Gaussian formula @eq:free-minkowski-boson-master-functional
then gives

$
  cal(Z)_(0,M) [J]
  =exp[-i/2 integral dd(x,[4])dd(y,[4])
    J (x) cal(K)_F^(-1) (x-y) J (y)],
$ <eq:scalar-feynman-generating-functional>

where the subscript $F$ means that the inverse has Feynman boundary
conditions.  With @eq:chapter-two-fourier-convention,

$
  cal(K) (p)&=-(p^2+m^2), \
  cal(K)_F^(-1) (p)&=-1/(p^2+m^2-i 0), \
  Delta_F (p)
    &:=i cal(K)_F^(-1) (p)
      =(-i)/(p^2+m^2-i 0).
$ <eq:scalar-feynman-propagator>

Thus two source derivatives generate

$
  Delta_F (x-y)
  =mel(0,T hat(phi) (x)hat(phi) (y),0),
  quad
  (partial_x^2-m^2)Delta_F (x-y)
  =i delta^((4)) (x-y).
$ <eq:scalar-feynman-green-equation>

The sign in the numerator of @eq:scalar-feynman-propagator is the
mostly-plus version of the familiar scalar propagator.  Closing the
$tensor(p,+0)$ contour on the two displaced mass-shell poles gives, for
$z:=x-y$,

$
  Delta_F (z)
  &=theta (tensor(z,+0))
    integral tilde(dd(p)) e^(i p dot z) \
  &quad +theta (-tensor(z,+0))
    integral tilde(dd(p)) e^(-i p dot z).
$ <eq:scalar-feynman-time-ordering>

The first term is the Wightman function already found from the scalar mode
expansion; the second reverses the operator order.  The pole prescription in
the path integral has therefore reproduced operator time ordering rather than
introduced a different two-point function.

For the complex scalar, integration by parts gives
$S_0 [phi,phi^dagger]=integral phi^dagger cal(K)phi$.  Treat
$phi$ and $phi^dagger$ as independent integration variables and introduce
independent commuting sources $J$ and $overline(J)$ through
$integral (overline(J) phi+phi^dagger J)$.  The complex Gaussian formula gives

$
  cal(Z)_(0,M) [overline(J),J]
  =exp[-i integral dd(x,[4])dd(y,[4])
    overline(J) (x)cal(K)_F^(-1) (x-y)J (y)].
$ <eq:complex-scalar-feynman-functional>

Consequently,

$
  mel(0,T hat(phi) (x)hat(phi)^dagger (y),0)
  &=Delta_F (x-y), \
  mel(0,T hat(phi) (x)hat(phi) (y),0)
  &=0, \
  mel(0,T hat(phi)^dagger (x)hat(phi)^dagger (y),0)
  &=0.
$ <eq:complex-scalar-feynman-propagators>

A nonzero complex-scalar contraction therefore joins a field to its
conjugate.  This is the propagator version of charge flow: the particle and
antiparticle modes are independent, but an oriented scalar line preserves the
global $U (1)$ charge.

=== Gauge fixing and the photon propagator

The Maxwell quadratic operator @eq:maxwell-degenerate-kinetic-operator
annihilates a pure gauge and has no inverse on the full vector space.  This is
not an ultraviolet or mass-shell singularity; it is the gauge redundancy
already identified in Section 2.4.  Add the covariant gauge-fixing term

$
  S_(M,xi) [A]
  :=S_M [A]
    -1/(2 xi) integral dd(x,[4])
      [tensor(partial,+mu)tensor(A,-mu)]^2,
  quad xi!=0.
$ <eq:covariant-gauge-fixed-maxwell-action>

After one integration by parts,

$
  S_(M,xi) [A]
  =1/2 integral dd(x,[4])
    tensor(A,-mu)
    tensor(cal(K)_xi,+mu,+nu)
    tensor(A,-nu),
$

with

$
  tensor(cal(K)_xi,+mu,+nu)
  =tensor(eta,+mu,+nu)partial^2
    -(1-1/xi)
      tensor(partial,+mu)tensor(partial,+nu).
$ <eq:gauge-fixed-maxwell-kernel>

For $p^2!=0$, introduce the mixed-index momentum projectors

$
  tensor(P_T,+mu,-nu)
  &:=tensor(delta,+mu,-nu)
    -(tensor(p,+mu)tensor(p,-nu))/(p^2), \
  tensor(P_L,+mu,-nu)
  &:=(tensor(p,+mu)tensor(p,-nu))/(p^2).
$ <eq:covariant-photon-projectors>

They obey $P_T^2=P_T$, $P_L^2=P_L$, and $P_T P_L=0$.  The gauge-fixed kernel
and its Feynman inverse are therefore diagonal in this decomposition:

$
  tensor(cal(K)_xi,+mu,-nu) (p)
    &=-p^2 tensor(P_T,+mu,-nu)
      -(p^2/xi)tensor(P_L,+mu,-nu), \
  tensor((cal(K)_xi)_F^(-1),-mu,-nu) (p)
    &=-1/(p^2-i 0)
      [tensor(P_T,-mu,-nu)+xi tensor(P_L,-mu,-nu)].
$ <eq:gauge-fixed-maxwell-inverse>

The normalized Gaussian with source coupling
$integral tensor(J,+mu)tensor(A,-mu)$ now yields

$
  tensor(D_F,-mu,-nu) (p)
  &:=mel(0,T tensor(hat(A),-mu) (x)
      tensor(hat(A),-nu) (y),0)_p \
  &=-i/(p^2-i 0)
    [
      tensor(eta,-mu,-nu)
      -(1-xi)(tensor(p,-mu)tensor(p,-nu))/(p^2)
    ].
$ <eq:covariant-photon-propagator>

Here the subscript $p$ denotes the Fourier kernel in $x-y$.  In Feynman gauge,
$xi=1$, this reduces to

$
  tensor(D_F,-mu,-nu) (p)
  =(-i tensor(eta,-mu,-nu))/(p^2-i 0).
$ <eq:feynman-gauge-photon-propagator>

The longitudinal term is gauge dependent, as a potential correlator is
allowed to be.  If an external current is conserved, then
$tensor(p,-mu)tensor(J,+mu) (p)=0$, so the longitudinal projector drops out of
$tensor(J,+mu)tensor(D_F,-mu,-nu)tensor(J,+nu)$.  It also disappears when each
external potential is replaced by the antisymmetric field strength.  Thus
current exchange and field-strength correlators are independent of $xi$.
For the free Abelian theory the determinant generated by gauge fixing is
field independent and cancels from normalized correlators.  More generally,
ghost fields decouple in the Abelian theory.

=== Grassmann sources and the Dirac propagator

For a Dirac field, $Psi$ and $overline(Psi)$ are independent Grassmann-odd
integration variables.  Their independent odd sources $eta$ and
$overline(eta)$ are coupled in the order
$overline(eta)Psi+overline(Psi)eta$.  Define

$
  cal(Z)_(D,M) [overline(eta),eta]
  :=frac(
    integral cal(D)overline(Psi)cal(D)Psi
      e^(i S_D+i integral [overline(eta)Psi+overline(Psi)eta]),
    integral cal(D)overline(Psi)cal(D)Psi e^(i S_D)
  ).
$ <eq:dirac-minkowski-generating-functional>

The measure and all products are first defined with finitely many Grassmann
generators, as in @eq:fermionic-matrix-gaussian.  Let

$
  cal(D):=i tensor(gamma,+mu)tensor(partial,-mu)-m.
$

Completing the square is now an algebraic translation,

$
  overline(Psi)cal(D)Psi
    +overline(eta)Psi+overline(Psi)eta
  &=[overline(Psi)+overline(eta)cal(D)_F^(-1)]
    cal(D)[Psi+cal(D)_F^(-1)eta] \
  &quad -overline(eta)cal(D)_F^(-1)eta.
$ <eq:dirac-source-completion>

Translation invariance of the Berezin measure leaves only the last term.  The
source-independent determinant cancels between numerator and denominator, so

$
  cal(Z)_(D,M) [overline(eta),eta]
  =exp[-i integral dd(x,[4])dd(y,[4])
    overline(eta) (x)cal(D)_F^(-1) (x-y)eta (y)].
$ <eq:dirac-feynman-generating-functional>

We use a left source derivative with respect to $overline(eta)$ to insert
$Psi$ and a right source derivative with respect to $eta$ to insert
$overline(Psi)$.  This convention preserves the displayed order of the two
odd fields.  Differentiating @eq:dirac-feynman-generating-functional gives

$
  tensor(S_F,-alpha,-beta) (x-y)
  :=mel(0,T hat(Psi)_alpha (x)
      overline(hat(Psi))_beta (y),0)
  =i tensor((cal(D)_F^(-1)),-alpha,-beta) (x-y).
$ <eq:dirac-propagator-as-inverse>

In the Fourier convention @eq:chapter-two-fourier-convention,

$
  cal(D) (p)=-slashed(p)-m.
$

Using $slashed(p)^2=-p^2 1_4$ gives the explicit inverse and propagator,

$
  cal(D)_F^(-1) (p)
    &=(slashed(p)-m)/(p^2+m^2-i 0), \
  S_F (p)
    &=i (slashed(p)-m)/(p^2+m^2-i 0).
$ <eq:dirac-feynman-propagator>

These signs are tied together: the same Fourier convention produced
$cal(K) (p)=-(p^2+m^2)$ for the scalar and
$cal(D) (p)=-slashed(p)-m$ for the spinor.  Direct multiplication verifies

$
  cal(D)_x S_F (x-y)=i delta^((4)) (x-y)1_4.
$ <eq:dirac-feynman-green-equation>

The factorization @eq:dirac-operator-square also relates the spinor propagator
to the scalar one:

$
  S_F (x-y)
  =[i tensor(gamma,+mu)tensor(partial,-mu)+m]_x
    Delta_F (x-y).
$ <eq:dirac-propagator-from-scalar>

To compare with canonical quantization, set $z:=x-y$ and perform the
$tensor(p,+0)$ contour integral.  The result is

$
  S_F (z)
  &=theta (tensor(z,+0))
    integral tilde(dd(p))
      [-slashed(p)+m]e^(i p dot z) \
  &quad -theta (-tensor(z,+0))
    integral tilde(dd(p))
      [-slashed(p)-m]e^(-i p dot z).
$ <eq:dirac-time-ordered-mode-form>

The first line is @eq:dirac-wightman-function.  In the second line the
antiparticle spin sum appears, and the minus sign in front is precisely the
fermionic sign required when time ordering exchanges two odd fields.  The
path integral, the mode expansion, and the canonical anticommutators have
therefore selected the same Green function.

=== Euclidean continuation and summary

The Feynman prescription can be defined by the Wick rotation $t=-i tau$
fixed in Chapter 1.  With the mostly-plus Minkowski gamma matrices, choose

$
  tensor(gamma_E,+4)&:=tensor(gamma,+0),
  quad
  tensor(gamma_E,+i):=-i tensor(gamma,+i), \
  [tensor(gamma_E,+a),tensor(gamma_E,+b)]_+
    &=2 tensor(delta,+a,+b)1_4.
$ <eq:euclidean-gamma-continuation>

Then $e^(i S_M)$ continues to $e^(-S_E)$ and the Euclidean Dirac operator is
$cal(D)_E=tensor(gamma_E,+a)tensor(partial,-a)+m$.  The free Euclidean
inverses are

$
  G_E (p_E)
    &=1/(p_E^2+m^2), \
  tensor(D_E,-a,-b) (p_E)|_(xi=1)
    &=tensor(delta,-a,-b)/(p_E^2), \
  S_E (p_E)
    &=[-i tensor(gamma_E,+a)tensor(p_E,-a)+m]/(p_E^2+m^2).
$ <eq:free-euclidean-propagator-summary>

These are ordinary decaying Gaussian covariances away from zero modes.  Their
analytic continuation returns @eq:scalar-feynman-propagator,
@eq:feynman-gauge-photon-propagator, and
@eq:dirac-feynman-propagator.  Across all four free fields the calculation is
the same: remove gauge zero modes when present, invert the quadratic operator
with a boundary prescription, and let the source type remember whether the
field is real, complex, vector-valued, or Grassmann odd.

== Exercises

#exercise(
  title: "Lorentz and Poincare algebras",
  label: <ex:lorentz-poincare-algebra>,
)[
Use the conventions in @eq:lorentz-representation-generators and
@eq:rotation-and-boost-generators.

+ Expand the representation law for two successive infinitesimal Lorentz
  transformations and derive

  $
    [tensor(Sigma,+mu,+nu),tensor(Sigma,+rho,+sigma)]
    = i [
        tensor(eta,+mu,+sigma) tensor(Sigma,+nu,+rho)
        + tensor(eta,+nu,+rho) tensor(Sigma,+mu,+sigma)
        - tensor(eta,+mu,+rho) tensor(Sigma,+nu,+sigma)
        - tensor(eta,+nu,+sigma) tensor(Sigma,+mu,+rho)
      ].
  $

+ Use @eq:rotation-and-boost-generators to show that

  $
    [tensor(J,-i),tensor(J,-j)]
      &= i tensor(epsilon,-i,-j,+k) tensor(J,-k), \
    [tensor(J,-i),tensor(K,-j)]
      &= i tensor(epsilon,-i,-j,+k) tensor(K,-k), \
    [tensor(K,-i),tensor(K,-j)]
      &= -i tensor(epsilon,-i,-j,+k) tensor(J,-k).
  $

  Explain why the last sign shows that boosts do not generate a compact
  rotation group.

+ Starting from @eq:translation-generator-on-fields and
  @eq:orbital-lorentz-generator, compute the differential-operator
  commutators and verify

  $
    [tensor(P,+mu),tensor(P,+nu)] &= 0, \
    [tensor(L,+mu,+nu),tensor(P,+rho)]
      &= i [
          tensor(eta,+nu,+rho) tensor(P,+mu)
          - tensor(eta,+mu,+rho) tensor(P,+nu)
        ].
  $
]

#pagebreak()

#exercise(
  title: "Finite rotations and boosts from the exponential map",
  label: <ex:finite-lorentz-transformations>,
)[
Work in the vector representation @eq:vector-lorentz-generators, set $b=0$,
and keep the passive convention
$tensor(x',+mu)=tensor(Lambda,+mu,-nu) tensor(x,+nu)$.

+ For a rotation of the coordinate axes in the $x^1$--$x^2$ plane, take
  $tensor(omega,-1,-2)=theta$.  For a boost along the $x^1$ direction, take
  $tensor(omega,-0,-1)=chi$.  Starting from
  @eq:lorentz-representation-generators and
  @eq:rotation-and-boost-generators, show that the corresponding exponential
  maps are

  $
    Lambda_R (theta) = e^(i theta tensor(J,-3)),
    quad
    Lambda_B (chi) = e^(-i chi tensor(K,-1)).
  $

  Explain why the signs in the two exponents follow from
  $tensor(J,-i)=-1/2 tensor(epsilon,-i,-j,-k)
  tensor(Sigma,+j,+k)$ rather than from an active transformation convention.

+ Evaluate the exponentials in the ordered basis $(x^0,x^1,x^2,x^3)$ and
  derive

  $
    Lambda_R (theta)
    &= mat(
      1, 0, 0, 0;
      0, cos theta, sin theta, 0;
      0, -sin theta, cos theta, 0;
      0, 0, 0, 1
    ), \
    Lambda_B (chi)
    &= mat(
      cosh chi, -sinh chi, 0, 0;
      -sinh chi, cosh chi, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1
    ).
  $

  Verify directly that both matrices satisfy
  $Lambda^T eta Lambda=eta$.  Show also that their parameters add under
  composition.  For the boost, identify $v=tanh chi$ and
  $gamma_v=cosh chi=1/sqrt(1-v^2)$, then recover
  $x'^0=gamma_v (x^0-v x^1)$ and $x'^1=gamma_v (x^1-v x^0)$.

+ Let $Lambda$ denote either $Lambda_R (theta)$ or $Lambda_B (chi)$.  Write
  the passive transformations at a fixed coordinate argument for a scalar and
  a vector:

  $
    phi' (x)
      &= phi (Lambda^(-1) x), \
    tensor(A',+mu) (x)
      &= tensor(Lambda,+mu,-nu)
         tensor(A,+nu) (Lambda^(-1) x).
  $

  Then write the same statements at the transformed point $x'=Lambda x$.
  Repeat the calculation for the quantum fields using
  @eq:quantum-field-covariance, paying attention to the order
  $U (Lambda)^(-1) tensor(hat(Psi),-a) U (Lambda)$.

+ Expand both finite transformations through first order in $theta$ or $chi$.
  Check that the result agrees with the infinitesimal passive transformation
  used in @eq:fixed-argument-field-transformation and prepares the calculation
  in @ex:infinitesimal-field-action.
]

#exercise(
  title: "Infinitesimal action on a field",
  label: <ex:infinitesimal-field-action>,
)[
Set $tensor(Lambda,+mu,-nu)=tensor(delta,+mu,-nu)
+tensor(omega,+mu,-nu)$ and expand
@eq:fixed-argument-field-transformation through first order in
$tensor(omega,-mu,-nu)$ and $tensor(b,+mu)$.

+ Derive

  $
    tensor(delta Psi,-a) (x)
    = -tensor(b,+mu) tensor(partial,-mu) tensor(Psi,-a) (x)
      - i/2 tensor(omega,-mu,-nu)
        tensor(cal(M),+mu,+nu,-a,+b)
        tensor(Psi,-b) (x).
  $

+ Check the result separately for a scalar and a vector.  For the vector,
  verify that the intrinsic term reproduces multiplication by
  $tensor(Lambda,+mu,-nu)$.
]

#exercise(
  title: "The two Weyl representations",
  label: <ex:weyl-representation-properties>,
)[
Use the passive Lorentz conventions of @eq:rotation-and-boost-generators.

+ Substitute @eq:weyl-su2-generators into the rotation--boost algebra and
  derive all three commutators in @eq:complex-lorentz-algebra-split.  Invert
  the definitions to express $tensor(J,-i)$ and $tensor(K,-i)$ in terms of
  $tensor(cal(A),-i)$ and $tensor(cal(B),-i)$.  Explain why an irreducible
  finite-dimensional representation can be labelled by two spins
  $(j_A,j_B)$.

+ Starting only from the Pauli identity @eq:pauli-matrix-algebra, verify that
  both lines of @eq:left-right-weyl-generators satisfy

  $
    [tensor(J,-i),tensor(J,-j)]
      &=i tensor(epsilon,-i,-j,+k)tensor(J,-k), \
    [tensor(J,-i),tensor(K,-j)]
      &=i tensor(epsilon,-i,-j,+k)tensor(K,-k), \
    [tensor(K,-i),tensor(K,-j)]
      &=-i tensor(epsilon,-i,-j,+k)tensor(J,-k).
  $

  Show explicitly that the left-handed block has
  $tensor(cal(A),-i)=tensor(sigma,-i)/2$ and
  $tensor(cal(B),-i)=0$, whereas the right-handed block has the reverse
  assignment.

+ Exponentiate a rotation about the third axis and a boost along the third
  axis.  Recover @eq:finite-weyl-transformations and evaluate the matrices in
  closed form.  Verify

  $
    D_L (R (theta))^dagger D_L (R (theta))=1_2,
    quad
    D_L (B (chi))^dagger D_L (B (chi))
      =e^(chi tensor(sigma,-3)) != 1_2
  $

  for $chi!=0$.  Repeat for the right-handed block and explain why the
  nonunitarity of a finite-dimensional boost is compatible with unitary time
  evolution in the quantum theory.

+ Prove the matrix identity @eq:weyl-invariant-epsilon.  If
  $psi_L'=D_L (Lambda)psi_L$, show separately for rotations and boosts that

  $
    epsilon_s (psi_L')^*
    =D_R (Lambda)epsilon_s psi_L^*.
  $

  Introduce undotted indices $a,b=1,2$ and dotted indices
  $dot(a),dot(b)=1,2$.  Use $epsilon_s$ and $epsilon_s^(-1)$ to raise and
  lower them, and explain why complex conjugation changes an undotted index
  into a dotted one.  This supplies the detailed form of the conjugacy
  statement following @eq:weyl-conjugate-spinor.

+ Finally compute a $2 pi$ rotation in either Weyl representation.  Show that
  it gives $-1_2$, while a $4 pi$ rotation gives $+1_2$, and relate the result
  to the double cover $upright("Spin")^+ (1,3)$.
]

#pagebreak()

#exercise(
  title: "Dirac and vector representations from Weyl spinors",
  label: <ex:dirac-vector-from-weyl>,
)[
This exercise compares the two different ways of combining the Weyl
representations.  A direct sum produces a Dirac spinor; a tensor product
produces a Lorentz vector.

+ Form the block direct sums

  $
    tensor(J_D,-i)=tensor(J_L,-i) "⊕" tensor(J_R,-i),
    quad
    tensor(K_D,-i)=tensor(K_L,-i) "⊕" tensor(K_R,-i).
  $

  Recover @eq:dirac-block-generators and
  @eq:dirac-generators-from-blocks.  Verify the rotation--boost algebra by
  block multiplication, and then derive the covariant commutator
  @eq:dirac-generator-lorentz-algebra.  This proves that exponentiating the
  direct-sum generators gives a Dirac representation.

+ Insert the chiral gamma matrices @eq:chiral-gamma-matrices and verify both
  lines of @eq:gamma-matrices-recover-dirac-generators.  Starting from the
  Clifford algebra, derive @eq:dirac-gamma-generator-commutator.  Expand
  $D (Lambda)$ to first order in $tensor(omega,-mu,-nu)$ and obtain
  @eq:dirac-gamma-covariance; then explain why the result extends to finite
  transformations connected to the identity.

+ Now form the tensor-product space

  $
    V_(1/2,1/2)
    :=V_(1/2,0) "⊗" V_(0,1/2),
  $

  with generators

  $
    tensor(Sigma_(L R),+mu,+nu)
    :=tensor(Sigma_L,+mu,+nu) "⊗" 1_2
      +1_2 "⊗" tensor(Sigma_R,+mu,+nu).
  $

  Prove directly that these generators obey the Lorentz algebra.  Note that
  this four-dimensional space is a tensor product, not the direct sum used
  for the Dirac spinor.

+ To identify the tensor product with the classical vector representation,
  define the four matrices

  $
    tensor(tau,+mu):=tensor(sigma,+mu)epsilon_s,
    quad
    V_(a dot(b)):=tensor(V,-mu)tensor(tau,+mu)_(a dot(b)).
  $

  The two spinor indices transform with $D_L (Lambda)$ and
  $D_R (Lambda)$.  Abbreviating these matrices by $D_L$ and $D_R$, in matrix
  notation

  $
    V'=D_L V D_R^T.
  $

  Use
  $epsilon_s tensor(sigma,-i)^T=-tensor(sigma,-i)epsilon_s$ to calculate an
  infinitesimal rotation and boost.  Show that the induced matrices acting on
  $tensor(V,+rho)$ are

  $
    tensor(Sigma_V,+mu,+nu,+rho,-sigma)
    =i [
      tensor(eta,+mu,+rho)tensor(delta,+nu,-sigma)
      -tensor(eta,+nu,+rho)tensor(delta,+mu,-sigma)
    ],
  $

  precisely the classical vector generators in
  @eq:vector-lorentz-generators.  As a final check, exponentiate the boost
  along the first axis and recover the vector matrix in
  @ex:finite-lorentz-transformations.
]

#pagebreak()

#exercise(
  title: "Adjoint and currents",
  label: <ex:dirac-adjoint-and-currents>,
)[
Use the chiral gamma matrices @eq:chiral-gamma-matrices and the passive field
transformation @eq:passive-dirac-field-transformation.

+ Verify directly that $tensor(gamma,+0)$ is Hermitian and that each
  $tensor(gamma,+i)$ is anti-Hermitian.  Derive both identities in
  @eq:dirac-gamma-generator-hermiticity and then prove

  $
    D (Lambda)^dagger tensor(gamma,+0)D (Lambda)
    =tensor(gamma,+0)
  $

  first infinitesimally and then for the exponential representation.  Use it
  to obtain @eq:dirac-adjoint-transformation without assuming that
  $D (Lambda)$ is unitary.

+ Starting from @eq:dirac-gamma-covariance and
  $[gamma^5,tensor(Sigma_D,+mu,+nu)]=0$, derive the connected-Lorentz
  transformation of every bilinear in @eq:dirac-bilinear-list.  Show in
  particular that

  $
    overline(Psi')tensor(Sigma_D,+mu,+nu)Psi'
    =tensor(Lambda,+mu,-rho)tensor(Lambda,+nu,-sigma)
      overline(Psi)tensor(Sigma_D,+rho,+sigma)Psi.
  $

  If parity is represented by
  $Psi' (t,-bold(x))=eta_P tensor(gamma,+0)Psi (t,bold(x))$ with
  $abs(eta_P)=1$, determine which bilinears are even and which are odd.

+ Vary @eq:free-dirac-action independently with respect to $Psi$ and
  $overline(Psi)$ and derive both Dirac equations.  Multiply the first equation
  by the conjugate operator and verify @eq:dirac-operator-square, keeping the
  mostly-plus Clifford signs explicit.  Explain why the converse implication
  from the Klein--Gordon equation to the Dirac equation is false.

+ Apply Noether's theorem to @eq:dirac-global-phase-symmetry and derive
  @eq:dirac-noether-current.  Then calculate directly

  $
    tensor(partial,-mu)
      [overline(Psi)tensor(gamma,+mu)gamma^5 Psi]
    =2i m overline(Psi)gamma^5 Psi.
  $

  For $m=0$, construct the separately conserved currents of $P_L Psi$ and
  $P_R Psi$ and express them as linear combinations of $tensor(j,+mu)$ and
  $tensor(j_5,+mu)$.

+ Rewrite the Lagrangian as

  $
    cal(L)_D
    =i Psi^dagger partial_t Psi
      -Psi^dagger cal(H)_D Psi
  $

  up to a spatial total derivative.  Derive
  @eq:dirac-first-order-canonical-momenta and explain why they are constraints
  rather than equations that determine velocities.  Verify that
  $cal(H)_D$ in @eq:dirac-hamiltonian-equation is Hermitian with the standard
  spatial inner product and suitable boundary conditions.
]

#exercise(
  title: "Boosted Dirac spinors and spin sums",
  label: <ex:boosted-dirac-spinors-and-spin-sums>,
)[
This exercise derives the plane-wave formulas from the rest frame rather than
guessing four-component solutions at arbitrary momentum.

+ Substitute $u (p)e^(i p dot x)$ and $v (p)e^(-i p dot x)$ into the free
  Dirac equation and recover @eq:dirac-momentum-space-equations.  At
  $p=p_*$, solve the two eigenvalue equations of
  @eq:rest-dirac-spinor-eigenvalue-equations and show that their most general
  normalized solutions have the form @eq:rest-dirac-spinors.

+ Starting from the boost exponential in
  @eq:finite-dirac-rotations-and-boosts, use

  $
    cosh (chi_p/2)&=sqrt((E_p+m)/(2m)), \
    sinh (chi_p/2)&=(abs(bold(p)))/sqrt(2m(E_p+m))
  $

  to derive @eq:massive-standard-spinor-boost.  Verify directly that the
  corresponding vector boost sends $p_*$ to $p$; this check fixes the passive
  sign in @eq:massive-standard-boost.

+ Apply the boost to the rest spinors and derive
  @eq:explicit-boosted-dirac-spinors.  Use
  $(bold(sigma) dot bold(p))^2=bold(p)^2 1_2$ to check directly that they obey
  @eq:dirac-momentum-space-equations and
  @eq:dirac-equal-time-spinor-normalization.

+ Starting from the two-spinor completeness relations
  @eq:two-spinor-basis-completeness, calculate the four blocks of

  $
    sum_s u_s (p)overline(u)_s (p),
    quad
    sum_s v_s (p)overline(v)_s (p).
  $

  Derive @eq:dirac-spin-sums with every sign shown.  Use the momentum-space
  equations to check the result from the left and right, take the matrix trace
  to verify the rank, and prove the complete projector algebra in
  @eq:dirac-energy-projectors.

+ Take $m arrow.r 0$ at fixed
  $tensor(p,+mu)=(E,0,0,E)$.  Using eigenvectors of $tensor(sigma,-3)$,
  evaluate the limiting spinors and verify
  @eq:massless-dirac-helicity-components and
  @eq:massless-chirality-helicity-relation.  Explain why the rest-frame
  derivation itself cannot be used at $m=0$, even though its boosted formulas
  have a well-defined fixed-momentum limit.
]

#pagebreak()

#exercise(
  title: "Dirac modes and observables",
  label: <ex:dirac-mode-algebra-and-observables>,
)[
This exercise derives the oscillator algebra and the additive observables
rather than taking them as independent quantization conventions.

+ At $t=0$, use the Hermiticity of the one-particle Hamiltonian
  $cal(H)_D (bold(p))$ to show

  $
    u_s (p)^dagger v_r (-p)=0,
    quad
    v_s (p)^dagger u_r (-p)=0.
  $

  Then invert @eq:quantized-dirac-mode-expansion and obtain

  $
    hat(b)_s (p)
    &=integral dd(x,[3]) e^(-i bold(p) dot bold(x))
      u_s (p)^dagger hat(Psi) (0,bold(x)), \
    hat(d)_s^dagger (p)
    &=integral dd(x,[3]) e^(+i bold(p) dot bold(x))
      v_s (p)^dagger hat(Psi) (0,bold(x)).
  $

  Take the Hermitian conjugates to obtain the other two projections.  Use
  @eq:dirac-equal-time-canonical-anticommutator to derive every factor in
  @eq:dirac-ladder-anticommutators and verify that the mixed
  anticommutators vanish.

+ Reverse the calculation: start from the ladder algebra and substitute the
  modes into the equal-time field anticommutator.  Derive from
  @eq:dirac-spin-sums the identity

  $
    sum_(s=1)^2 [
      u_s (p)u_s (p)^dagger
      +v_s (-p)v_s (-p)^dagger
    ]=2E_p 1_4,
  $

  and use $bold(p) arrow.r -bold(p)$ in the antiparticle term to recover
  @eq:dirac-equal-time-canonical-anticommutator.  This verifies explicitly
  that the invariant measure, spinor normalization, and ladder normalization
  form one consistent set.

+ Substitute the mode expansion into

  $
    hat(H)=integral dd(x,[3])
      hat(Psi)^dagger cal(H)_D hat(Psi),
    quad
    hat(Q)=integral dd(x,[3])hat(Psi)^dagger hat(Psi).
  $

  Show that all mixed particle--antiparticle terms vanish and obtain, before
  normal ordering,

  $
    hat(H)&=sum_s integral tilde(dd(p)) E_p
      [hat(b)_s^dagger hat(b)_s-hat(d)_s hat(d)_s^dagger], \
    hat(Q)&=sum_s integral tilde(dd(p))
      [hat(b)_s^dagger hat(b)_s+hat(d)_s hat(d)_s^dagger],
  $

  where every operator on the right carries the common argument $p$.
  Reorder the $hat(d)$ operators, identify the vacuum c-numbers, and recover
  @eq:dirac-normal-ordered-four-momentum and
  @eq:dirac-normal-ordered-charge.  Derive the four charge commutators in
  @eq:dirac-charge-commutators, including the field commutator from the mode
  expansion.

+ Use the ladder algebra to calculate the norms and eigenvalues of the states
  @eq:dirac-one-particle-states.  Prove the antisymmetry relations
  @eq:dirac-fock-antisymmetry.  Finally repeat the Hamiltonian reordering with
  bosonic commutators and show precisely why positive one-antiparticle norm
  and a Hamiltonian bounded below cannot then be retained simultaneously.
]

#pagebreak()

#exercise(
  title: "Fermionic constraints and locality",
  label: <ex:dirac-constraints-and-locality>,
)[
This exercise connects the first-order classical action to its equal-time
quantum algebra and then carries that algebra to arbitrary spacetime points.

+ Treat $Psi_alpha$ and $Psi_alpha^dagger$ as independent Grassmann-odd
  coordinates.  Denote their momenta by $Pi_alpha$ and $Pi_alpha^dagger$ and
  use the symmetric fundamental graded brackets

  $
    [Psi_alpha (bold(x)),Pi_beta (bold(y))]_g
    &=[Pi_beta (bold(y)),Psi_alpha (bold(x))]_g \
    &=delta_(alpha beta)delta^((3)) (bold(x)-bold(y)),
  $

  together with the identical daggered relation.  From
  $cal(L)_D=i Psi^dagger dot(Psi)-Psi^dagger cal(H)_D Psi$, derive the
  constraints

  $
    chi_(1 alpha)=Pi_alpha-i Psi_alpha^dagger approx 0,
    quad
    chi_(2 alpha)=Pi_alpha^dagger approx 0.
  $

  Show that they are second class and that their only nonzero constraint
  brackets are

  $
    C_(1 alpha,2 beta)=C_(2 beta,1 alpha)
    =-i delta_(alpha beta)delta^((3)) (bold(x)-bold(y)).
  $

  Invert this kernel and construct the graded Dirac bracket.  Verify

  $
    [Psi_alpha (bold(x)),Psi_beta^dagger (bold(y))]_(D,g)
    =-i delta_(alpha beta)delta^((3)) (bold(x)-bold(y)).
  $

  Under the fermionic quantization rule
  $i[A,B]_(D,g) arrow.r [hat(A),hat(B)]_+$, recover
  @eq:dirac-equal-time-canonical-anticommutator.  If a different but
  internally consistent left/right Grassmann-derivative convention is chosen,
  track the intermediate sign changes and show that the final operator CAR is
  unchanged.

+ Starting from @eq:quantized-dirac-mode-expansion and
  @eq:dirac-ladder-anticommutators, calculate
  $[hat(Psi)_alpha (x),overline(hat(Psi))_beta (y)]_+$ without assuming its
  covariant form.  Insert @eq:dirac-spin-sums and show that the particle and
  antiparticle terms have exactly the two signs displayed in
  @eq:dirac-covariant-field-anticommutator.  Act on
  @eq:massive-pauli-jordan-distribution with the Dirac operator and prove the
  second line of that equation.

+ Take the equal-time limit and recover
  @eq:dirac-equal-time-covariant-anticommutator, including the factor of
  $tensor(gamma,+0)$.  Show separately that
  $[hat(Psi)_alpha (x),hat(Psi)_beta (y)]_+=0$ and that the corresponding
  adjoint-field anticommutator also vanishes.  Use Lorentz invariance of the
  Pauli--Jordan distribution to establish
  @eq:dirac-fermionic-microcausality for every spacelike separation.

+ At distinct spacelike points, move the four fermionic factors in
  $overline(hat(Psi))Gamma_1 hat(Psi)$ and
  $overline(hat(Psi))Gamma_2 hat(Psi)$ through one another and prove
  @eq:dirac-even-observable-locality.  Finally derive
  @eq:dirac-wightman-function and explain why its possible nonzero value at
  spacelike separation is consistent with the vanishing anticommutator and
  with causal local measurements.
]

#exercise(
  title: "Scalar modes and the second-quantized Hamiltonian",
  label: <ex:scalar-hamiltonian-from-modes>,
)[
Use the invariant measure @eq:lorentz-invariant-mass-shell-measure and the
mode expansion @eq:real-scalar-mode-expansion.

+ At $t=0$, invert the mode expansion and show that

  $
    hat(a) (k)
    = integral dd(x, [3]) e^(-i bold(k) dot bold(x))
      [
        omega_k hat(phi) (0,bold(x))
        + i hat(pi) (0,bold(x))
      ].
  $

  Use @eq:real-scalar-canonical-commutators to derive
  @eq:real-scalar-ladder-commutators, including every factor of
  $2 omega_k$ and $2 pi$.

+ Substitute the mode expansions of $hat(phi)$ and $hat(pi)$ into

  $
    hat(H)
    = 1/2 integral dd(x, [3])
      [
        hat(pi)^2
        + bold(nabla) hat(phi) dot bold(nabla) hat(phi)
        + m^2 hat(phi)^2
      ].
  $

  Show explicitly that the terms containing two creation or two annihilation
  operators cancel, and obtain

  $
    hat(H)
    = integral tilde(dd(k))
      omega_k hat(a)^dagger (k) hat(a) (k)
      + E_0,
    quad
    E_0
    = 1/2 (2 pi)^3 delta^((3)) (0)
      integral (dd(k, [3]))/((2 pi)^3) omega_k.
  $

  Interpret $(2 pi)^3 delta^((3)) (0)$ as the spatial volume, repeat the
  calculation in a finite periodic box, and explain how normal ordering gives
  the first line of @eq:second-quantized-scalar-observables.

+ Starting from
  $tensor(T,+mu,+nu)
  = tensor(partial,+mu) phi tensor(partial,+nu) phi
    + tensor(eta,+mu,+nu) cal(L)_0$,
  calculate the spatial momentum and recover the four-vector expression in
  @eq:second-quantized-scalar-observables.  Finally verify
  @eq:additive-fock-space-four-momentum directly from the ladder algebra.
]

#pagebreak()

#exercise(
  title: "Complex scalar modes and conserved charge",
  label: <ex:complex-scalar-charge>,
)[
Use the covariant normalization of @eq:complex-scalar-mode-expansion.

+ Invert the two mode expansions at $t=0$ and derive

  $
    hat(a) (k)
    &=integral dd(x, [3]) e^(-i bold(k) dot bold(x))
      [
        omega_k hat(phi) (0,bold(x))
        +i hat(pi)^dagger (0,bold(x))
      ], \
    hat(b) (k)
    &=integral dd(x, [3]) e^(-i bold(k) dot bold(x))
      [
        omega_k hat(phi)^dagger (0,bold(x))
        +i hat(pi) (0,bold(x))
      ].
  $

  Use @eq:complex-scalar-canonical-commutators to obtain
  @eq:complex-scalar-ladder-commutators and show that every mixed
  $a$--$b$ commutator vanishes.

+ Starting from the canonical Hamiltonian density

  $
    cal(H)_0
    =pi^dagger pi
     +bold(nabla) phi^dagger dot bold(nabla) phi
     +m^2 phi^dagger phi,
  $

  derive @eq:complex-scalar-second-quantized-momentum.  Keep the vacuum term
  until the end and show that the two species contribute equal zero-point
  energies.

+ Apply Noether's theorem to @eq:complex-scalar-global-u1 and derive
  @eq:complex-scalar-noether-current.  Substitute the mode expansion into
  $hat(Q)=integral dd(x,[3]) tensor(hat(j),+0)$ and recover
  @eq:complex-scalar-charge-operator.  Verify both
  @eq:complex-scalar-charge-eigenstates and
  @eq:charge-generates-global-u1 directly from the ladder algebra.

+ Impose the real condition $hat(phi)^dagger=hat(phi)$.  Show that it forces
  $hat(b) (k)=hat(a) (k)$ and removes the nontrivial $U (1)$ charge.  Explain
  why a real scalar is its own antiparticle.
]

#exercise(
  title: "Gauging the complex scalar phase symmetry",
  label: <ex:gauging-complex-scalar>,
)[
Start from the local phase transformation
$phi' (x)=e^(-i q alpha (x))phi (x)$.

+ Compute $tensor(partial,-mu)phi'$ and show explicitly why the free kinetic
  term in @eq:free-complex-scalar-action is invariant only when $alpha$ is
  constant.

+ Suppose
  $tensor(D,-mu)=tensor(partial,-mu)+i q tensor(A,-mu)$.  Require

  $
    tensor(D',-mu)phi'
    =e^(-i q alpha)tensor(D,-mu)phi
  $

  for arbitrary $phi$ and derive
  $tensor(A',-mu)=tensor(A,-mu)+tensor(partial,-mu)alpha$.  Verify the result
  by direct substitution, including the cancellation of every term
  proportional to $tensor(partial,-mu)alpha$.

+ Show that

  $
    [tensor(D,-mu),tensor(D,-nu)]phi
    =i q tensor(F,-mu,-nu)phi,
  $

  and use this identity to prove
  @eq:scalar-gauge-invariant-building-blocks.  Conclude, term by term, that
  @eq:scalar-electrodynamics-preview is both a Lorentz scalar and locally
  $U (1)$ invariant.

+ Expand the covariant kinetic term and show that

  $
    cal(L)_("scalar QED")
    =cal(L)_0
     -q tensor(A,-mu)tensor(j,+mu)
     -q^2 tensor(A,-mu)tensor(A,+mu)phi^dagger phi
     -1/4 tensor(F,-mu,-nu)tensor(F,+mu,+nu),
  $

  where $tensor(j,+mu)$ is the unit-charge current
  @eq:complex-scalar-noether-current.  Identify the term linear in
  $tensor(A,-mu)$ and the quadratic seagull term.

+ Verify that $tensor(F,-mu,-nu)tensor(F,+mu,+nu)$ is gauge invariant but
  $m_A^2 tensor(A,-mu)tensor(A,+mu)$ is not.  Explain why local covariance
  determines how a connection couples to matter but does not, by itself,
  require the connection to have a Maxwell kinetic term.
]

#exercise(
  title: "Classical gauge redundancy and Maxwell degrees of freedom",
  label: <ex:maxwell-gauge-redundancy>,
)[
Start from the free Maxwell action @eq:free-maxwell-action and assume fields
fall off sufficiently rapidly at spatial infinity.

+ Apply
  $tensor(A,-mu) arrow.r tensor(A,-mu)+tensor(partial,-mu)alpha$ and verify
  directly that $tensor(F,-mu,-nu)$, the Maxwell action, and both Maxwell
  equations are unchanged.  Conversely, let two potentials have the same
  field strength.  Show that their difference is a closed one-form and use
  the Poincare lemma to explain why they are locally gauge equivalent on
  Minkowski spacetime.

+ Expand the field strength in @eq:free-maxwell-action and integrate by parts
  to derive the quadratic form @eq:maxwell-degenerate-kinetic-operator.  Call
  its differential operator

  $
    tensor(K,+mu,+nu)
    :=tensor(eta,+mu,+nu)partial^2
      -tensor(partial,+mu)tensor(partial,+nu).
  $

  Show directly that

  $
    tensor(K,+mu,+nu)tensor(partial,-nu)alpha=0.
  $

  In momentum space, derive

  $
    tensor(K,+mu,+nu) (k)
    =-k^2 tensor(eta,+mu,+nu)
      +tensor(k,+mu)tensor(k,+nu),
    quad
    tensor(K,+mu,+nu) (k)tensor(k,-nu)=0.
  $

  Decompose a vector into parts transverse and longitudinal to a momentum with
  $k^2 != 0$.  Lower one index to form
  $tensor(K,+mu,-nu) (k)$, find its four eigenvalues, and explain why its
  longitudinal zero eigenvalue makes the ungauge-fixed kinetic operator
  noninvertible.  Relate this zero mode to
  @eq:maxwell-gauge-equivalence rather than to the physical massless pole.

+ Define the spatial fields by

  $
    tensor(E,-i):=tensor(F,-0,-i),
    quad
    tensor(B,-i):=1/2 tensor(epsilon,-i,-j,-k)
      tensor(F,-j,-k).
  $

  Verify, with the mostly-plus metric, that

  $
    cal(L)_M=1/2 [bold(E)^2-bold(B)^2].
  $

  Derive @eq:maxwell-canonical-momenta and show explicitly that
  $tensor(Pi,+0)=0$ because the Lagrangian contains no
  $tensor(partial,-0)tensor(A,-0)$.  Perform the Legendre transform and,
  after one spatial integration by parts, obtain

  $
    H_M=integral dd(x,[3]) [
      1/2 tensor(Pi,-i)tensor(Pi,+i)
      +1/4 tensor(F,-i,-j)tensor(F,+i,+j)
      -tensor(A,-0)tensor(partial,-i)tensor(Pi,+i)
    ].
  $

  Explain why varying $tensor(A,-0)$ imposes Gauss's law rather than a new
  evolution equation.

+ #block(breakable: false)[
  Equip the spatial canonical variables with

  $
    {tensor(A,-i) (bold(x)),tensor(Pi,+j) (bold(y))}_"P.B."
    =tensor(delta,-i,+j)delta^((3)) (bold(x)-bold(y)).
  $
  ]

  Show that the smeared Gauss constraint

  $
    G [alpha]
    :=-integral dd(x,[3])
      alpha (bold(x))tensor(partial,-i)tensor(Pi,+i) (bold(x))
  $

  generates
  $delta tensor(A,-i)=tensor(partial,-i)alpha$ and
  $delta tensor(Pi,+i)=0$.  Count the phase-space dimensions removed by
  $tensor(Pi,+0)=0$ and Gauss's law and recover two physical configuration
  degrees of freedom at each spatial point.
]

#exercise(
  title: "Photon polarizations and the transverse canonical algebra",
  label: <ex:maxwell-polarizations-and-canonical-algebra>,
)[
This exercise constructs the polarization vectors explicitly and then checks
the normalization of the reduced quantum theory.

+ Start with the standard positive-energy null momentum and two real linear
  polarizations

  $
    tensor(k_*,+mu)&=(kappa,0,0,kappa), \
    tensor(e_1,+mu)&=(0,1,0,0), \
    tensor(e_2,+mu)&=(0,0,1,0),
    quad kappa>0.
  $

  Solve $k_* dot epsilon=0$ before imposing a gauge condition.  Show that
  the equivalence
  $tensor(epsilon,+mu) "∼" tensor(epsilon,+mu)
  +beta tensor(k_*,+mu)$ permits the radiation-gauge representative
  $tensor(epsilon,+0)=tensor(epsilon,+3)=0$.  Verify that the two vectors
  above form an orthonormal basis of the remaining plane.

  Define

  $
    tensor(epsilon,+mu) (k_*,lambda)
    :=1/sqrt(2) [
      tensor(e_1,+mu)+i lambda tensor(e_2,+mu)
    ],
    quad lambda=plus.minus 1.
  $

  Using $tensor(J,-3)=-tensor(Sigma_V,+1,+2)$ and
  @eq:vector-lorentz-generators, verify that these are helicity eigenvectors
  with eigenvalues $lambda=plus.minus 1$.  Check their orthonormality and show
  explicitly that their spatial completeness sum is
  $upright("diag") (1,1,0)$, the transverse projector for momentum along the
  third axis.

+ Let

  $
    tensor(k,+mu)
    =(omega_k,omega_k hat(bold(k))),
    quad omega_k>0,
  $

  and choose a spatial rotation $R (hat(bold(k)))$ that sends the third axis
  to $hat(bold(k))$.  With the passive boost convention of
  @ex:finite-lorentz-transformations, choose $chi_k$ so that

  $
    L (k)
    :=R (hat(bold(k))) B_3 (chi_k),
    quad
    L (k)k_*=k.
  $

  Show that $chi_k=-ln (omega_k/kappa)$ and define

  $
    tensor(epsilon,+mu) (k,lambda)
    :=tensor(L (k),+mu,-nu)
      tensor(epsilon,+nu) (k_*,lambda).
  $

  Verify @eq:maxwell-polarization-conditions and
  @eq:maxwell-transverse-polarization-completeness for the resulting arbitrary
  null momentum.  Explain why changing $R (hat(bold(k)))$ by a rotation about
  $hat(bold(k))$ changes a circular polarization only by its helicity phase.

+ #block(breakable: false)[
  A general Lorentz transformation need not preserve the radiation-gauge
  representative.  Let

  $
    tensor(k',+mu)&=tensor(Lambda,+mu,-nu)tensor(k,+nu), \
    tensor(tilde(epsilon)',+mu)
      &=tensor(Lambda,+mu,-nu)
        tensor(epsilon,+nu) (k,lambda).
  $

  Choose

  $
    beta
    :=-(tensor(tilde(epsilon)',+0))/(tensor(k',+0)),
    quad
    tensor(epsilon',+mu)
    :=tensor(tilde(epsilon)',+mu)+beta tensor(k',+mu).
  $
  ]

  Show that $tensor(epsilon',+0)=0$,
  $k' dot epsilon'=0$, and the plane-wave field strength is unchanged by the
  added term.  This is the compensating gauge transformation needed to return
  to the chosen radiation-gauge representative.

+ Starting from @eq:maxwell-transverse-mode-expansion, use
  $tensor(hat(Pi),-i)=tensor(partial,-0)tensor(hat(A),-i)$ in radiation gauge
  and the ladder algebra @eq:maxwell-ladder-commutators to calculate the
  equal-time commutator of $tensor(hat(A),-i)$ and $tensor(hat(Pi),-j)$.
  Keep every factor of $2 omega_k$ and $2 pi$.  Use
  @eq:maxwell-transverse-polarization-completeness to derive precisely
  @eq:maxwell-transverse-canonical-commutator with the distribution
  @eq:maxwell-transverse-delta.

+ Prove the converse direction.  At $t=0$, derive the inversion formula

  $
    hat(a)_lambda (k)
    =integral dd(x,[3]) e^(-i bold(k) dot bold(x))
      tensor(epsilon,+i)^* (k,lambda)
      [
        omega_k tensor(hat(A),-i) (0,bold(x))
        +i tensor(hat(Pi),-i) (0,bold(x))
      ].
  $

  Insert @eq:maxwell-transverse-canonical-commutator and use the fact that the
  transverse projector acts as the identity on each polarization vector.
  Recover @eq:maxwell-ladder-commutators, including its covariant factor
  $2 omega_k (2 pi)^3$.  This establishes both directions of consistency
  among @eq:maxwell-transverse-canonical-commutator,
  @eq:maxwell-transverse-delta, and @eq:maxwell-ladder-commutators.
]

#pagebreak()

#exercise(
  title: "Scalar and Dirac contour propagators",
  label: <ex:scalar-dirac-contour-propagators>,
)[
Use the Fourier convention @eq:chapter-two-fourier-convention throughout.
All momentum labels in invariant mass-shell integrals have positive energy.

+ Starting from @eq:real-scalar-quadratic-operator, regulate the field to a
  finite set of real variables and complete the square in the presence of
  $J$.  After dividing by the zero-source integral, recover
  @eq:scalar-feynman-generating-functional.  Differentiate twice and track
  the two factors of $1/i$ needed to obtain the operator correlator.  Verify
  both equations in @eq:scalar-feynman-green-equation.

+ Locate the two poles of @eq:scalar-feynman-propagator in the complex
  $tensor(p,+0)$ plane.  Close the contour in the correct half-plane for positive and
  negative $tensor(z,+0)$ and derive @eq:scalar-feynman-time-ordering.  By
  integrating the Green equation through $tensor(z,+0)=0$, prove the jump
  condition

  $
    [tensor(partial,-0) Delta_F (z)]_(0^-)^(0^+)
    =-i delta^((3)) (bold(z)).
  $

  Show directly that the two mass-shell terms have exactly this jump.  Repeat
  the Gaussian calculation for the complex scalar and explain from the source
  derivatives why the two same-charge correlators in
  @eq:complex-scalar-feynman-propagators vanish.

+ Treat $Psi$, $overline(Psi)$, $eta$, and $overline(eta)$ as independent odd
  variables on a finite regulator.  Verify @eq:dirac-source-completion without
  commuting any two odd quantities silently.  Use a left derivative with
  respect to $overline(eta)$ and a right derivative with respect to $eta$ to
  derive @eq:dirac-propagator-as-inverse, including its overall factor of $i$.

+ In momentum space, multiply $-slashed(p)-m$ by the proposed inverse in
  @eq:dirac-feynman-propagator and recover the identity matrix.  Perform the
  $tensor(p,+0)$ contour integral, use @eq:dirac-spin-sums, and derive
  @eq:dirac-time-ordered-mode-form.  Show explicitly that the negative-time
  residue acquires one additional minus sign from fermionic time ordering.
  Finally apply $i tensor(gamma,+mu)tensor(partial,-mu)-m$ and verify
  @eq:dirac-feynman-green-equation, including the contact term at equal time.
]

#pagebreak()

#exercise(
  title: "Covariant photon propagator and gauge independence",
  label: <ex:covariant-photon-propagator>,
)[
Begin with the degenerate Maxwell kernel
@eq:maxwell-degenerate-kinetic-operator and keep $xi!=0$ until the final step.

+ Add the gauge-fixing term in @eq:covariant-gauge-fixed-maxwell-action and
  integrate by parts to derive @eq:gauge-fixed-maxwell-kernel.  Lower one
  index, insert the projectors @eq:covariant-photon-projectors, and prove their
  idempotence, orthogonality, and completeness.  Use their eigenvalues to
  invert the kernel and recover @eq:gauge-fixed-maxwell-inverse without
  guessing a tensor ansatz.

+ Introduce a source $tensor(J,+mu)$, carry out the regulated Gaussian, and
  differentiate twice to derive @eq:covariant-photon-propagator.  Verify by
  direct multiplication that

  $
    tensor(cal(K)_xi,+mu,+rho) (p)
    tensor(D_F,-rho,-nu) (p)
    =i tensor(delta,+mu,-nu)
  $

  with the pole prescription understood.  Set $xi=1$ only after this check
  and recover @eq:feynman-gauge-photon-propagator.

+ Let the external source be conserved,
  $tensor(p,-mu)tensor(J,+mu) (p)=0$.  Prove that
  $tensor(J,+mu)tensor(D_F,-mu,-nu)tensor(J,+nu)$ is independent of $xi$.
  Then differentiate the potential correlator antisymmetrically at both ends
  and derive

  $
    mel(0,T tensor(hat(F),-mu,-nu) (p)
      tensor(hat(F),-rho,-sigma) (-p),0)
    =-i/(p^2-i 0) [
      tensor(p,-mu)tensor(p,-rho)tensor(eta,-nu,-sigma)
      -tensor(p,-mu)tensor(p,-sigma)tensor(eta,-nu,-rho)
      -tensor(p,-nu)tensor(p,-rho)tensor(eta,-mu,-sigma)
      +tensor(p,-nu)tensor(p,-sigma)tensor(eta,-mu,-rho)
    ].
  $

  Show explicitly that every longitudinal contribution cancels before
  setting $xi$ to any particular value.

+ Under $tensor(A,-mu) arrow.r tensor(A,-mu)+tensor(partial,-mu)alpha$, compute
  the variation of the covariant gauge condition.  Show that the resulting
  Faddeev--Popov operator is $partial^2$, independent of $A$.  Explain why its
  determinant cancels from normalized free-Abelian correlators, whereas the
  gauge-fixing term itself remains essential for defining the potential
  propagator.
]
