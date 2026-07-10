#import "../../lib.typ":*

= Path Integral Foundations

== The Path Integral in Quantum Mechanics

Canonical quantization describes a quantum system in terms of operators and
states.  The path-integral formulation contains the same information, but
organizes the transition amplitude as a sum over ordinary trajectories.  We
derive this formulation for one non-relativistic degree of freedom.  Throughout
this chapter we use natural units, $hbar = 1$.

=== From the canonical commutator to position--momentum overlaps

Let $hat(x)$ and $hat(p)$ be a canonical pair,

$
  [hat(x), hat(p)] = i.
$ <eq:canonical-commutator>

We denote the eigenvalue of the position operator by $q$,

$
  hat(x) ket(q) = q ket(q),
  quad
  integral_( -infinity)^infinity dd(q) ketbra(q) = 1.
$

For a wavefunction $psi (q) = braket(q, psi)$, the commutator in
@eq:canonical-commutator is represented by

$
  mel(q, hat(x), psi) = q psi (q),
  quad
  mel(q, hat(p), psi) = -i pdv(psi (q), q).
$ <eq:position-representation>

Indeed, $[q, -i partial_q] psi (q) = i psi (q)$.  A possible additional
function of $q$ in $hat(p)$ can be removed by a phase redefinition of the
position eigenstates.  If $ket(p)$ is a momentum eigenstate, then
@eq:position-representation gives

$
  -i pdv(braket(q, p), q) = p braket(q, p),
  quad arrow.r quad
  braket(q, p) = e^(i p q).
$ <eq:plane-wave-overlap>

We have chosen the normalization in which

$
  braket(q, q') = delta(q - q'),
  quad
  braket(p, p') = 2 pi delta(p - p'),
  quad
  integral_( -infinity)^infinity (dd(p))/(2 pi) ketbra(p) = 1.
$ <eq:completeness-relations>

Thus the elementary phase $e^(i p q)$ and the measure
$(dd(p))/(2 pi)$ are not extra assumptions: they follow from the canonical
commutator together with our normalization convention.

=== Slicing the time-evolution operator

Let $T = t_f - t_i > 0$.  The amplitude for the system to start at $q_i$ at
time $t_i$ and end at $q_f$ at time $t_f$ is

$
  K (q_f, t_f; q_i, t_i)
  := braket(q_f comma t_f, q_i comma t_i)
  = braket(q_f, e^(-i hat(H) T), q_i).
$ <eq:transition-amplitude>

Divide the interval into $N$ slices of width $epsilon = T/N$, and write
$q_0 = q_i$ and $q_N = q_f$.  Inserting the position-space resolution of the
identity between neighboring factors of $e^(-i epsilon hat(H))$ gives

$
  K (q_f, t_f; q_i, t_i)
  = lim_(N arrow.r infinity)
    integral product_(n=1)^(N-1) dd(q_n)
    product_(n=0)^(N-1)
    braket(q_(n+1), e^(-i epsilon hat(H)), q_n).
$ <eq:time-sliced-kernel>

Consider the standard Hamiltonian

$
  hat(H) = (hat(p)^2)/(2 m) + V (hat(x)).
$ <eq:standard-hamiltonian>

Over one short interval, the first-order Trotter formula yields

$
  e^(-i epsilon hat(H))
  = e^(-i epsilon hat(p)^2/(2 m))
    e^(-i epsilon V (hat(x))) + O(epsilon^2).
$ <eq:trotter-step>

The expansion and its accumulated error are worked out in @ex:trotter.

We now insert the momentum-space identity from
@eq:completeness-relations into every short-time matrix element.  Using the
plane waves in @eq:plane-wave-overlap, we obtain

$
  braket(q_(n+1), e^(-i epsilon hat(H)), q_n)
  = integral_( -infinity)^infinity (dd(p_n))/(2 pi)
    e^(
      i p_n (q_(n+1) - q_n)
      - i epsilon H (p_n, q_n)
    )
    + O(epsilon^2).
$ <eq:short-time-kernel>

The accumulated error vanishes as $N epsilon^2 = T epsilon arrow.r 0$.
Substitution into @eq:time-sliced-kernel therefore gives the phase-space path
integral

$
  K (q_f, t_f; q_i, t_i)
  &= lim_(N arrow.r infinity)
    integral product_(n=1)^(N-1) dd(q_n)
    product_(n=0)^(N-1) (dd(p_n))/(2 pi) \
  &quad
    e^(
      i sum_(n=0)^(N-1)
      [p_n (q_(n+1) - q_n) - epsilon H (p_n, q_n)]
    ).
$ <eq:phase-space-path-integral>

At finite $N$, this expression is only an ordinary multiple integral.  The
formal symbols $cal(D) p$ and $cal(D) q$ are shorthand for the continuum limit
of its precisely specified measure.  In continuum notation,

$
  K (q_f, t_f; q_i, t_i)
  = integral cal(D) p cal(D) q
    e^(
      i integral_(t_i)^(t_f) dd(t)
      [p dot(q) - H (p, q)]
    ).
$ <eq:continuum-phase-space-path-integral>

=== Integrating out the momentum

For the Hamiltonian in @eq:standard-hamiltonian, every $p_n$ occurs
quadratically and independently.  Completing the square,

$
  p_n (q_(n+1) - q_n) - epsilon (p_n^2)/(2 m)
  = -epsilon/(2 m)
    (p_n - (m (q_(n+1) - q_n))/epsilon)^2
    + (m (q_(n+1) - q_n)^2)/(2 epsilon).
$ <eq:momentum-square>

The corresponding Fresnel integral is

$
  integral_( -infinity)^infinity (dd(p))/(2 pi)
  e^(-i epsilon p^2/(2 m) + i p Delta q)
  = sqrt((m)/(2 pi i epsilon))
    e^(i m (Delta q)^2/(2 epsilon)).
$ <eq:fresnel-slice>

The usual $i 0$ prescription fixes the branch of the square root and makes the
oscillatory integral well defined; @ex:fresnel makes this limiting prescription
explicit.  Applying @eq:fresnel-slice to all time slices gives

$
  K (q_f, t_f; q_i, t_i)
  &= lim_(N arrow.r infinity)
    (m/(2 pi i epsilon))^(N/2)
    integral product_(n=1)^(N-1) dd(q_n) \
  &quad
    e^(
      i epsilon sum_(n=0)^(N-1)
      [
        m/2 ((q_(n+1) - q_n)/epsilon)^2
        - V (q_n)
      ]
    ).
$ <eq:configuration-slicing>

The exponent is the Riemann-sum approximation to the classical action

$
  S[q] = integral_(t_i)^(t_f) dd(t) L (q (t), dot(q) (t)),
  quad
  L (q, dot(q)) = m/2 dot(q)^2 - V (q).
$ <eq:mechanical-action>

We may therefore absorb the normalization and the integrations over all
intermediate positions into the configuration-space measure $cal(D) q$:

$
  K (q_f, t_f; q_i, t_i)
  = integral_(q (t_i) = q_i)^(q (t_f) = q_f)
    cal(D) q e^(i S[q]).
$ <eq:configuration-path-integral>

Equation @eq:configuration-path-integral is the path-integral representation
of the original operator amplitude.  With the boundary conditions understood
or suppressed---for example, when taking a trace or imposing vacuum boundary
conditions---we write its essential structure as

$
  Z = integral cal(D) q e^(i S[q]).
$ <eq:partition-functional>

This final expression also explains why Gaussian integration is the basic
computational engine of quantum field theory.  A quadratic action makes $Z$ an
infinite-dimensional Gaussian integral; interactions are then organized as
corrections around that Gaussian theory.  We develop the required Gaussian
identities in the next section.

== Gaussian Integrals and Wick's Theorem

Free bosonic theories are Gaussian.  Once spacetime has been regulated, their
path integrals are ordinary finite-dimensional Gaussian integrals; the
continuum expressions are limits of those finite systems.  We first work in
Euclidean signature, where convergence is transparent.  The oscillatory
Minkowski formulas are obtained afterwards by the same $i 0$ prescription that
appeared in @eq:fresnel-slice.

=== Real Gaussian integrals

==== One real variable

For a real number $a > 0$, define

$
  I(a) = integral_( -infinity)^infinity dd(x) e^(-a x^2/2).
$

The change of variables $y = sqrt(a) x$ reduces the problem to $I(1)$.  Squaring
that integral and using polar coordinates gives

$
  I(1)^2
  &= integral_(RR^2) dd(x) dd(y) e^(-(x^2+y^2)/2) \
  &= integral_0^(2 pi) dd(theta)
     integral_0^infinity r dd(r) e^(-r^2/2)
   = 2 pi.
$

Taking the positive square root,

$
  integral_( -infinity)^infinity dd(x) e^(-a x^2/2)
  = sqrt((2 pi)/a).
$ <eq:real-gaussian-one-dimensional>

A linear source contains all moments of the Gaussian.  Completing the square,

$
  Z_1 (j; a)
  &:= integral_( -infinity)^infinity dd(x)
      e^(-a x^2/2 + j x) \
  &= sqrt((2 pi)/a) e^(j^2/(2a)).
$ <eq:real-gaussian-one-source>

We denote expectation with respect to the normalized Gaussian weight by
$chevron.l · chevron.r_0$.  After division by $Z_1 (0;a)$, differentiating
with respect to $j$ gives

$
  chevron.l x^(2n+1) chevron.r_0 &= 0, \
  chevron.l x^(2n) chevron.r_0 &= (2n - 1)!! a^(-n).
$ <eq:real-gaussian-moments>

The positivity condition can be weakened to a complex $a$ with positive real
part.  The result is then defined by analytic continuation from the positive
real axis, which fixes the branch of $sqrt(a)$.

==== $N$ real variables and a quadratic matrix

Let $x = (x_1, dots, x_N)^T$, let $J$ be a real source, and let $A$ be a real
symmetric positive-definite matrix.  The finite-dimensional generating
integral is

$
  Z_N (J; A)
  := integral_(RR^N) dd(x, [N])
     e^(-1/2 x^T A x + J^T x).
$ <eq:real-gaussian-N-definition>

An orthogonal matrix diagonalizes $A$ as
$A = O^T Lambda O$, where $Lambda = upright(diag)(lambda_1, dots, lambda_N)$
and every $lambda_i > 0$.  The rotation $y = O x$ has unit absolute Jacobian,
so the integral factorizes into $N$ copies of
@eq:real-gaussian-one-dimensional.  Shifting
$x arrow.r x + A^(-1) J$ then gives

$
  Z_N (J; A)
  = (2 pi)^(N/2) (det A)^(-1/2)
    e^(1/2 J^T A^(-1) J).
$ <eq:real-gaussian-N-source>

Only the symmetric part of a real matrix contributes to $x^T A x$.
Positive-definiteness is what guarantees absolute convergence; if $A$ has a
zero eigenvalue, the integral contains an undamped flat direction and
diverges.

It is often best to remove the source-independent normalization immediately:

$
  cal(Z)_N (J; A)
  := (Z_N (J; A))/(Z_N (0; A))
  = e^(1/2 J^T A^(-1) J).
$ <eq:normalized-real-gaussian>

For any integrable function $F$, its Gaussian expectation value and the
associated $n$-point correlation function are defined by

$
  chevron.l F(x) chevron.r_0
  &:= 1/(Z_N (0; A))
      integral_(RR^N) dd(x, [N])
      F(x) e^(-x^T A x/2), \
  G^((n))_(i_1 dots i_n)
  &:= chevron.l x_(i_1) dots x_(i_n) chevron.r_0 \
  &= [
      (partial^n)/(partial J_(i_1) dots partial J_(i_n))
      cal(Z)_N (J; A)
    ]_(J=0).
$ <eq:real-gaussian-correlation-definition>

Thus the subscript $0$ denotes the normalized, centered Gaussian theory.  The
second line follows because every derivative with respect to $J_i$ inserts one
factor of $x_i$ under the integral.

For example,

$
  chevron.l x_i x_j chevron.r_0
  &= (A^(-1))_(i j), \
  chevron.l x_i x_j x_k x_l chevron.r_0
  &= (A^(-1))_(i j) (A^(-1))_(k l)
   + (A^(-1))_(i k) (A^(-1))_(j l)
   + (A^(-1))_(i l) (A^(-1))_(j k).
$ <eq:real-gaussian-two-and-four-point>

Thus the inverse quadratic matrix is the two-point function.  This elementary
fact becomes the statement that the inverse kinetic operator is the free-field
propagator.

==== From a finite matrix to a real functional integral

Place a real field on a finite lattice with $M$ sites, and collect its values
into the vector $phi = (phi_1, dots, phi_M)^T$.  After absorbing lattice-volume
factors into the matrix and source, a regulated quadratic action has the form

$
  S_(E,M)[phi; J]
  = 1/2 phi^T K_M phi - J^T phi.
$ <eq:lattice-real-action>

At every finite $M$ there is no new kind of integration:

$
  Z_M (J)
  &= integral product_(r=1)^M dd(phi_r)
     e^(-S_(E,M)[phi; J]) \
  &= (2 pi)^(M/2) (det K_M)^(-1/2)
     e^(1/2 J^T K_M^(-1) J).
$ <eq:lattice-real-gaussian>

The lattice spacing, box size, and boundary conditions make both the matrix and
the measure precise.  If the lattice spacing tends to zero while the physical
box is kept fixed, then $M arrow.r infinity$ and the labels $r$ become the
continuum points $x$.  Formally,

$
  1/2 phi^T K_M  phi
  &arrow.r 1/2 integral dd(x, [d]) dd(y, [d])
    phi(x) cal(K)(x,y) phi(y), \
  J^T phi
  &arrow.r integral dd(x, [d]) J(x) phi(x).
$ <eq:real-quadratic-continuum-limit>

The inverse matrix tends to a Green function $G$ satisfying

$
  integral dd(z, [d]) cal(K)(x,z) G(z,y)
  = delta^(d)(x-y).
$ <eq:green-function-inverse>

The normalized continuum generating functional is consequently written

$
  cal(Z)_0 (J)
  := (Z_0 (J))/(Z_0 (0))
  = exp[
      1/2 integral dd(x, [d]) dd(y, [d])
      J(x) G(x,y) J(y)
    ].
$ <eq:real-gaussian-functional>

The familiar notation

$
  Z_0 (J)
  = integral cal(D) phi
    exp[
      -1/2 integral phi cal(K) phi
      + integral J phi
    ]
$ <eq:formal-real-functional-integral>

is shorthand for this regulated limit.  In @eq:formal-real-functional-integral
the spacetime integrations and arguments have been suppressed, as will often
be done below.

=== Complex Gaussian integrals

A complex scalar carries two real degrees of freedom at each point, but it is
usually more efficient to integrate directly over the complex variable and its
conjugate.

==== One complex variable

Write $z = x + i y$ and define $dd(z, 2) := dd(x) dd(y)$.  For a positive real
number $a$,

$
  integral_CC (dd(z, 2))/pi e^(-a overline(z) z)
  = 1/a.
$ <eq:complex-gaussian-one-dimensional>

The factor $1/pi$ is a convention chosen so that no extra powers of $pi$
appear later.  With sources $eta$ and $overline(eta)$, completing the square
gives

$
  integral_CC (dd(z, 2))/pi
  e^(-a overline(z) z + overline(eta) z + overline(z) eta)
  = 1/a e^(1/a overline(eta) eta).
$ <eq:complex-gaussian-one-source>

During differentiation it is convenient to regard $eta$ and $overline(eta)$ as
independent variables.  Setting the sources to conjugate values can be done at
the end.

==== $N$ complex variables

Let $z$ be an $N$-component complex column vector and let $A$ be Hermitian and
positive definite.  Unitary diagonalization preserves the measure, and the
one-variable result yields

$
  Z_N^CC (overline(eta), eta; A)
  &:= integral product_(i=1)^N (dd(z_i, 2))/pi
      e^(-z^dagger A z + overline(eta)^T z + z^dagger eta) \
  &= 1/(det A)
     e^(overline(eta)^T A^(-1) eta).
$ <eq:complex-gaussian-N-source>

This is the important difference from a real Gaussian: $N$ complex variables
are $2N$ real variables, and the determinant appears with power $-1$ rather
than $-1/2$.  The normalized two-point functions are

$
  chevron.l z_i overline(z_j) chevron.r_0
  = (A^(-1))_(i j),
  quad
  chevron.l z_i z_j chevron.r_0
  = chevron.l overline(z_i) overline(z_j) chevron.r_0 = 0.
$ <eq:complex-gaussian-two-point>

More generally, absolute convergence only requires the Hermitian part of $A$
to be positive definite.  The Hermitian case is the one normally produced by
a Euclidean quadratic action.

==== Complex fields

For a complex field $phi(x)$ with Euclidean quadratic operator $cal(K)$, the
finite-lattice formula leads to

$
  Z_0 (overline(J), J)
  &= integral cal(D) overline(phi) cal(D) phi
     exp[
       - integral overline(phi) cal(K) phi
       + integral (overline(J) phi + overline(phi) J)
     ], \
  (Z_0 (overline(J), J))/(Z_0 (0,0))
  &= exp[
       integral dd(x, [d]) dd(y, [d])
       overline(J)(x) G(x,y) J(y)
     ],
$ <eq:complex-gaussian-functional>

where $G = cal(K)^(-1)$.  Before normalization the real and complex cases have
the schematic determinant factors

$
  Z_(0, "real") ∝ [upright("Det") cal(K)]^(-1/2),
  quad
  Z_(0, "complex") ∝ [upright("Det") cal(K)]^(-1).
$ <eq:real-complex-functional-determinants>

=== What does the functional measure mean?

A continuum field assigns a variable to every spacetime point, so the symbol
$cal(D) phi = product_x dd(phi(x))$ suggests an uncountable product.  It must
not be interpreted as an ordinary Lebesgue measure.  Infinite-dimensional
function spaces admit no nonzero, locally finite, translation-invariant
Lebesgue measure with all the properties of $dd(x, [N])$.  The uncountable set
of point labels should not be confused with the size of a mode basis: on a
finite box, the function spaces used in practice are usually separable and
admit a countable Fourier or eigenfunction basis.  A cutoff keeps only finitely
many of those modes.

For calculations, one instead chooses a regulator and defines the continuum
notation through a limit:

+ *Lattice regulator:* integrate over finitely many site variables and then
  send the lattice spacing to zero.
+ *Mode cutoff:* expand in eigenfunctions or Fourier modes, retain finitely
  many coefficients, and remove the cutoff afterwards.
+ *Euclidean Gaussian measure:* after normalization, use the covariance $G$ to
  define a genuine probability measure on a suitable space of distributions.
  Typical quantum fields are distributions rather than pointwise-defined
  functions.

The last viewpoint explains why the normalized quantity is more fundamental:

$
  dd(mu_G)[phi]
  := 1/(Z_0 (0)) cal(D) phi
     e^(-1/2 integral phi cal(K) phi),
  quad
  integral dd(mu_G)[phi] = 1.
$ <eq:normalized-gaussian-measure>

An interacting Euclidean theory can then be written formally as an expectation
with respect to this Gaussian measure,

$
  Z/Z_0
  = integral dd(mu_G)[phi] e^(-S_("int")[phi]).
$ <eq:interaction-relative-to-gaussian-measure>

Several different infinities are hidden by the continuum notation.  If
$lambda_n$ are the eigenvalues of $cal(K)$, then

$
  log upright("Det") cal(K)
  = upright("Tr") log cal(K)
  = sum_n log lambda_n.
$ <eq:functional-determinant-trace-log>

The sum generally diverges because there are infinitely many ultraviolet
modes; in infinite volume it also contains an extensive volume divergence.
With the Fourier convention
$integral dd(p, [d])/(2 pi)^d e^(i p x)$, a momentum-space delta function at
zero argument represents the latter as

$
  delta^(d)(0) = V/(2 pi)^d,
$ <eq:delta-zero-volume>

with the precise statement understood only after putting the system in a
finite box.  Field-independent factors such as $Z_0 (0)$ cancel from normalized
correlators, while determinant ratios, vacuum energies, and coincident-point
propagators still require a regulator and renormalization.  A zero eigenvalue
is a separate infrared problem: it creates a flat direction, so one must add an
infrared regulator, treat the zero mode separately, or remove a gauge
redundancy before applying the Gaussian formula.

Finally, a Minkowski integral weighted by $e^(i S)$ is not a probability
measure.  It is defined through time slicing together with an $i 0$
prescription, or by analytic continuation from the corresponding Euclidean
Gaussian.  Algebraic manipulations of $cal(D) phi$ are therefore always
understood as manipulations of a regulated finite-dimensional system followed
by a controlled limit.

=== Wick's theorem

The normalized generating functionals make all free correlation functions
mechanical.  Differentiating @eq:normalized-real-gaussian shows that every odd
moment of a centered real Gaussian vanishes, while every even moment is a sum
over pairings:

$
  chevron.l x_(i_1) dots x_(i_(2n)) chevron.r_0
  = sum_("pairings " P)
    product_((r,s) in P) (A^(-1))_(i_r i_s).
$ <eq:finite-real-wick-theorem>

In the continuum, indices become spacetime points and $A^(-1)$ becomes the
propagator:

$
  chevron.l phi(x_1) dots phi(x_(2n)) chevron.r_0
  = sum_("pairings " P)
    product_((r,s) in P) G(x_r,x_s).
$ <eq:functional-real-wick-theorem>

For a complex Gaussian, a contraction pairs a field only with a conjugate
field.  A correlator vanishes unless it contains equal numbers of $phi$ and
$overline(phi)$, and for equal numbers

$
  chevron.l
    product_(i=1)^n phi(x_i)
    product_(j=1)^n overline(phi)(y_j)
  chevron.r_0
  = sum_(sigma in S_n)
    product_(i=1)^n G(x_i,y_(sigma(i))).
$ <eq:functional-complex-wick-theorem>

Equations @eq:functional-real-wick-theorem and
@eq:functional-complex-wick-theorem are Wick's theorem.  Perturbation theory is
the repeated use of these Gaussian contractions after expanding the
interaction exponential.

== Grassmann Variables and Fermionic Path Integrals

== Generating Functionals and Sources

== From Quantum Mechanics to Field Theory

== Exercises

#exercise(
  title: "Trotter product formula and the continuum limit",
  label: <ex:trotter>,
)[
Let $A$ and $B$ be operators for which the following formal expansions are
valid on a common invariant domain.

+ Expand both sides through order $epsilon^2$ and show that
  $
    e^(epsilon (A + B))
    = e^(epsilon A) e^(epsilon B)
      - epsilon^2/2 [A, B] + O(epsilon^3).
  $
  In particular, verify the $O(epsilon^2)$ statement used in
  @eq:trotter-step.
+ Set $A = -i hat(p)^2/(2m)$ and $B = -i V(hat(x))$.  Explain why $N$ time
  slices produce a total error of order
  $N epsilon^2 = T epsilon$, which vanishes when $N arrow.r infinity$ at fixed
  $T = N epsilon$.
+ Show that the symmetric splitting
  $
    e^(epsilon (A + B))
    = e^(epsilon A/2) e^(epsilon B) e^(epsilon A/2)
      + O(epsilon^3)
  $
  improves the accumulated error to $O(T epsilon^2)$.
]

#exercise(
  title: "The regulated Fresnel integral",
  label: <ex:fresnel>,
)[
For $epsilon > 0$, introduce a convergent regulator

$
  I_eta(Delta q)
  = integral_( -infinity)^infinity (dd(p))/(2 pi)
    e^(-[eta + i epsilon/(2m)] p^2 + i p Delta q),
  quad eta > 0.
$

+ Evaluate $I_eta$ by completing the square and using the ordinary Gaussian
  integral for a complex coefficient with positive real part.
+ Take $eta arrow.r 0^+$ by analytic continuation from $eta > 0$.  Show that
  $
    lim_(eta arrow.r 0^+) I_eta(Delta q)
    = sqrt(m/(2 pi i epsilon))
      e^(i m (Delta q)^2/(2 epsilon)),
  $
  thereby deriving @eq:fresnel-slice and fixing the square-root branch.
+ Check that the result has the correct composition law and approaches
  $delta(Delta q)$ as $epsilon arrow.r 0^+$ in the distributional sense.
]

#exercise(
  title: "A real matrix Gaussian and its moments",
  label: <ex:real-matrix-gaussian>,
)[
Let $A$ be a real symmetric positive-definite $N times N$ matrix.

+ Diagonalize $A$ with an orthogonal transformation and derive
  @eq:real-gaussian-N-source, keeping track of the Jacobian and every factor of
  $2 pi$.
+ Differentiate the normalized generating function
  @eq:normalized-real-gaussian to reproduce the two- and four-point functions
  in @eq:real-gaussian-two-and-four-point.
+ Suppose one eigenvalue of $A$ tends to zero.  Determine the leading
  divergence of $Z_N (0;A)$ and explain its interpretation as the volume of a
  flat direction.
]

#exercise(
  title: "Complex variables and functional determinants",
  label: <ex:complex-gaussian-determinant>,
)[
Write each complex variable as $z_i = x_i + i y_i$.

+ Starting from a $2N$-dimensional real Gaussian, derive
  @eq:complex-gaussian-N-source and explain why the result contains
  $(det A)^(-1)$ rather than $(det A)^(-1/2)$.
+ Use source derivatives to prove the complex Wick rule
  @eq:functional-complex-wick-theorem for a finite number of variables.
+ Put a translation-invariant quadratic theory in a periodic box and impose a
  momentum cutoff.  Show that
  $log upright("Det") cal(K) = sum_p log cal(K)(p)$, identify the factor
  proportional to the spacetime volume, and state which divergence remains
  when the volume is kept finite and the cutoff is removed.
]
