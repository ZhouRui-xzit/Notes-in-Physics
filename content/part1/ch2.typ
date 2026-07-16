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
Dirac field is then treated in two stages: first its spinor representation and
free equation, and then its fermionic quantization.  The final section returns
to the path integral and derives the propagators from the corresponding
quadratic operators.

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
  @eq:dirac-lorentz-generators with Lorentz covariance is checked in
  @ex:spinor-generator-covariance.

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

== Dirac Spinors and the Dirac Equation

== Quantization of the Dirac Field

== Propagators from Path Integrals

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
  title: "Spinor generators and the Clifford algebra",
  label: <ex:spinor-generator-covariance>,
)[
Assume the mostly-plus Clifford convention
@eq:mostly-plus-clifford-algebra.

+ Starting from @eq:dirac-lorentz-generators, prove

  $
    [tensor(Sigma_D,+mu,+nu),tensor(gamma,+rho)]
    = i [
        tensor(eta,+nu,+rho) tensor(gamma,+mu)
        - tensor(eta,+mu,+rho) tensor(gamma,+nu)
      ].
  $

+ Use this identity and @eq:lorentz-representation-generators to show, through
  first order in $tensor(omega,-mu,-nu)$, that

  $
    D (Lambda)^(-1) tensor(gamma,+rho) D (Lambda)
    = tensor(Lambda,+rho,-sigma) tensor(gamma,+sigma).
  $

  Conclude that
  $i tensor(gamma,+mu) tensor(partial,-mu)-m$ is a Lorentz-covariant
  first-order operator.
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
