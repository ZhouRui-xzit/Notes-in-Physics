#import "../../lib.typ":*

= Path Integral Foundations

== The Path Integral in Quantum Mechanics

Canonical quantization describes a quantum system in terms of operators and
states.  The path-integral formulation contains the same information, but
organizes the transition amplitude as a sum over ordinary trajectories.  We
derive this formulation for one non-relativistic degree of freedom.  Throughout
this book we use natural units, $c = hbar = k_B = 1$.

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

Bosonic path integrals integrate over commuting numbers.  Fermionic creation
and annihilation operators instead anticommute, so an ordinary complex-valued
field cannot reproduce their operator algebra.  The path-integral replacement
is a field whose values lie in a Grassmann algebra.  Although Grassmann
integration is algebraic rather than analytic, its Gaussian formulas parallel
the bosonic formulas of the preceding section closely enough to make fermionic
calculations equally systematic.

=== Grassmann algebra and Berezin integration

==== Anticommuting generators

Let $theta_1, dots, theta_N$ be Grassmann generators.  By definition,

$
  theta_i theta_j = -theta_j theta_i,
  quad
  theta_i^2 = 0.
$ <eq:grassmann-algebra>

The second relation follows from the first when the coefficient field has
characteristic different from two.  Nilpotency makes every power series in a
finite set of generators terminate.  For one generator,

$
  F (theta) = F_0 + F_1 theta,
  quad
  e^(a theta) = 1 + a theta.
$ <eq:one-grassmann-expansion>

A homogeneous monomial is *even* or *odd* according to whether it contains an
even or odd number of generators.  If $F$ and $G$ have definite Grassmann
parities $abs(F), abs(G) in {0,1}$, then

$
  F G = (-1)^(abs(F) abs(G)) G F
$ <eq:graded-commutation>

whenever their generators are independent.  Even quantities commute with the
whole algebra, while two odd quantities anticommute.  The sign in
@eq:graded-commutation is the source of every fermionic minus sign below.

==== Differentiation and integration

For an odd variable, left differentiation is defined by

$
  partial^L_theta 1 = 0,
  quad
  partial^L_theta theta = 1,
  quad
  partial^L_theta (F G)
  = (partial^L_theta F) G
    + (-1)^(abs(F)) F (partial^L_theta G).
$ <eq:left-grassmann-derivative>

For example, if $theta$ and $chi$ are independent, then
$partial^L_theta(theta chi) = chi$ but
$partial^L_chi(theta chi) = -theta$.  A right derivative is also useful, but
left and right derivatives must never be interchanged without tracking the
parity of the expression.

Berezin integration is fixed by the two rules

$
  integral dd(theta) 1 = 0,
  quad
  integral dd(theta) theta = 1.
$ <eq:berezin-one-variable>

Thus integration and left differentiation are the same algebraic operation.
There is no convergence question and no analogue of an integration range.
For several variables the order of the measure is part of the definition.  We
use iterated integrals and the convention

$
  integral dd(theta_N) dots dd(theta_1)
    theta_1 dots theta_N = 1.
$ <eq:berezin-measure-order>

Exchanging two differentials changes the sign.  Translation invariance follows
immediately: for an odd constant $eta$ independent of $theta$,

$
  integral dd(theta) F (theta + eta)
  = integral dd(theta) F (theta).
$ <eq:berezin-translation>

The change-of-variables rule is the inverse of the rule for commuting
variables.  If $theta'_i = M_(i j) theta_j$, then

$
  dd(theta'_N) dots dd(theta'_1)
  = (det M)^(-1)
    dd(theta_N) dots dd(theta_1).
$ <eq:berezin-jacobian>

For one variable this is forced by normalization: if $theta' = a theta$, then
$1 = integral dd(theta') theta' = a integral dd(theta') theta$, so
$dd(theta') = a^(-1) dd(theta)$.  Equation @eq:berezin-jacobian is the simplest
example of a Berezinian, the graded analogue of a Jacobian.

=== Fermionic Gaussian integrals

==== One conjugate pair

Introduce independent odd variables $psi$ and $overline(psi)$.  The bar labels
the variable paired with $psi$; inside the integral it does not mean that one
should replace it by an ordinary complex conjugate.  We fix the orientation of
the measure by

$
  integral dd(overline(psi)) dd(psi)
    e^(-overline(psi) a psi) = a.
$ <eq:one-pair-fermionic-gaussian>

Indeed, the exponential stops at first order.  With independent odd sources
$eta$ and $overline(eta)$, translation invariance permits the completion of the
square

$
  -overline(psi) a psi + overline(eta) psi + overline(psi) eta
  = -(overline(psi) - overline(eta) a^(-1))
      a (psi - a^(-1) eta)
    + overline(eta) a^(-1) eta.
$ <eq:fermionic-completing-square>

Consequently,

$
  integral dd(overline(psi)) dd(psi)
  e^(
    -overline(psi) a psi
    + overline(eta) psi + overline(psi) eta
  )
  = a e^(overline(eta) a^(-1) eta).
$ <eq:one-pair-fermionic-source>

Compare this with @eq:complex-gaussian-one-source: a commuting complex
Gaussian produces $a^(-1)$, whereas an anticommuting pair produces $a$.

==== Many variables and the determinant

Let $psi_i$ and $overline(psi)_i$, with $i=1,dots,N$, be independent
Grassmann generators, and fix one consistent ordering of all differentials.
For an invertible $N times N$ matrix $A$,

$
  Z_F (overline(eta), eta; A)
  &:= integral product_(i=1)^N
      dd(overline(psi)_i) dd(psi_i) \
  &quad times
      e^(
        -overline(psi)_i A_(i j) psi_j
        + overline(eta)_i psi_i
        + overline(psi)_i eta_i
      ) \
  &= det A
     e^(overline(eta)_i (A^(-1))_(i j) eta_j).
$ <eq:fermionic-matrix-gaussian>

Repeated indices are summed in this subsection.  One way to see the
determinant is to expand the exponential.  Only the term containing every
$psi_i$ and every $overline(psi)_i$ survives the integral; antisymmetrizing its
matrix indices gives precisely $det A$.  Equivalently, one can diagonalize
$A$ and use @eq:one-pair-fermionic-gaussian $N$ times, with
@eq:berezin-jacobian accounting for the changes of variables.

After division by $Z_F (0,0;A)$, the source-independent determinant disappears:

$
  cal(Z)_F (overline(eta), eta; A)
  = e^(overline(eta)_i (A^(-1))_(i j) eta_j).
$ <eq:normalized-fermionic-gaussian>

Source derivatives insert fields, provided their order and whether they act
from the left or right are specified.  With the convention above, the basic
contraction is

$
  chevron.l psi_i overline(psi)_j chevron.r_0
  = (A^(-1))_(i j).
$ <eq:fermionic-two-point>

All correlators with unequal numbers of barred and unbarred variables vanish.
The first nontrivial sign appears at four points:

$
  chevron.l
    psi_i overline(psi)_j psi_k overline(psi)_l
  chevron.r_0
  = (A^(-1))_(i j) (A^(-1))_(k l)
    - (A^(-1))_(i l) (A^(-1))_(k j).
$ <eq:fermionic-four-point>

More generally, Wick's theorem again sums over pairings, but each pairing is
multiplied by the parity of the permutation required to bring the paired odd
variables together.  For equal numbers of fields and conjugate fields the
answer can be written as a determinant:

$
  chevron.l
    psi_(i_1) dots psi_(i_n)
    overline(psi)_(j_n) dots overline(psi)_(j_1)
  chevron.r_0
  = det[(A^(-1))_(i_r j_s)]_(r,s=1)^n.
$ <eq:fermionic-wick-determinant>

The reverse order of the barred variables on the left is part of our sign
convention.  The invariant rule is simpler than any convention: preserve the
original order of the fields and include one minus sign for every transposition
of odd objects.

==== Real Grassmann variables and Pfaffians

For a single set of real Grassmann variables $chi_i$, only the antisymmetric
part of a matrix contributes to $chi_i A_(i j) chi_j$.  If $A^T=-A$ and $N$ is
even, then an oriented measure can be chosen so that

$
  integral dd(chi_N) dots dd(chi_1)
    e^(-1/2 chi^T A chi)
  = upright("Pf") (A),
  quad
  upright("Pf") (A)^2 = det A.
$ <eq:grassmann-pfaffian>

This is the finite-dimensional pattern behind Majorana fermions.  A Dirac
fermion gives a determinant, while a Majorana fermion formally gives a
Pfaffian, or a square root of a determinant together with an orientation sign.

=== From fermionic operators to a path integral

==== Fermionic coherent states

For one mode, let $hat(a)$ and $hat(a)^dagger$ obey

$
  hat(a)^2 = (hat(a)^dagger)^2 = 0,
  quad
  hat(a) hat(a)^dagger + hat(a)^dagger hat(a) = 1.
$ <eq:fermionic-oscillator-algebra>

Fermionic coherent states are labelled by Grassmann numbers:

$
  ket(psi) := e^(-psi hat(a)^dagger) ket(0),
  quad
  bra(overline(psi)) := bra(0) e^(-hat(a) overline(psi)).
$ <eq:fermionic-coherent-states>

With a consistent convention for moving Grassmann labels through odd
operators, they satisfy

$
  hat(a) ket(psi) = psi ket(psi),
  quad
  bra(overline(psi)) hat(a)^dagger
    = bra(overline(psi)) overline(psi),
  quad
  braket(overline(psi), psi') = e^(overline(psi) psi').
$ <eq:fermionic-coherent-properties>

Their resolution of the identity is

$
  1 = integral dd(overline(psi)) dd(psi)
      e^(-overline(psi) psi)
      ket(psi) bra(overline(psi)).
$ <eq:fermionic-coherent-completeness>

This formula plays exactly the role that the position-space completeness
relation played in @eq:time-sliced-kernel.

==== Time slicing and the kinetic term

Consider a normal-ordered Hamiltonian
$hat(H) = H (hat(a)^dagger, hat(a))$.  Over one Euclidean time step,

$
  bra(overline(psi)_(n+1)) e^(-epsilon hat(H)) ket(psi_n)
  = e^(
      overline(psi)_(n+1) psi_n
      - epsilon H (overline(psi)_(n+1), psi_n)
    ) + O(epsilon^2).
$ <eq:fermionic-short-time-kernel>

Insert @eq:fermionic-coherent-completeness at every slice.  The overlap of
neighboring coherent states combines with its Gaussian weight to produce

$
  sum_n overline(psi)_(n+1)
    (psi_(n+1) - psi_n),
$ <eq:discrete-fermionic-kinetic-term>

which tends to $integral dd(tau) overline(psi) partial_tau psi$.  Thus the
Euclidean action for finitely many modes has the first-order form

$
  S_E [overline(psi), psi]
  = integral_0^beta dd(tau)
    [overline(psi)_i partial_tau psi_i
     + H (overline(psi), psi)].
$ <eq:fermionic-euclidean-action>

The fields $psi$ and $overline(psi)$ are independent integration variables.
The first-order derivative is not a choice of approximation: it is the direct
continuum image of the coherent-state overlap.

For the thermal partition function $Z (beta)=upright("Tr") e^(-beta hat(H))$, the
fermionic trace is represented by identifying the final coherent-state label
with the negative of the initial one.  Hence

$
  psi (beta) = -psi (0),
  quad
  overline(psi) (beta) = -overline(psi) (0).
$ <eq:fermionic-antiperiodic-boundary>

These antiperiodic boundary conditions give the fermionic Matsubara
frequencies $omega_n = (2n+1) pi/beta$.  Bosonic thermal fields are periodic
and instead have $omega_n = 2n pi/beta$.  This difference follows from the
trace and statistics, not from the equations of motion.

In real time, the same slicing gives the formal phase-space action

$
  S [overline(psi), psi]
  = integral dd(t)
    [i overline(psi)_i dot(psi)_i
     - H (overline(psi), psi)],
  quad
  Z = integral cal(D) overline(psi) cal(D) psi e^(i S).
$ <eq:fermionic-real-time-action>

As in the bosonic case, an $i 0$ prescription or continuation from Euclidean
time specifies the oscillatory integral and the vacuum boundary conditions.

=== Free fermionic fields

Put a Dirac field on a finite Euclidean lattice.  Collect all site and spinor
indices into one compound index, so its quadratic action is

$
  S_(E,M) [overline(psi), psi]
  = overline(psi)_I D_(I J) psi_J.
$ <eq:lattice-dirac-action>

Applying @eq:fermionic-matrix-gaussian gives

$
  Z_(F,M) (overline(eta), eta)
  = det D
    e^(overline(eta)_I (D^(-1))_(I J) eta_J).
$ <eq:lattice-dirac-generating-integral>

This regulated formula is the definition of the formal continuum expression.
For

$
  cal(D)_E = gamma_E^mu partial_mu + m,
  quad
  S_E = integral dd(x, [d])
    overline(psi) (x) cal(D)_E psi (x),
$ <eq:euclidean-dirac-operator>

the normalized generating functional is

$
  cal(Z)_0 (overline(eta), eta)
  = exp[
      integral dd(x, [d]) dd(y, [d])
      overline(eta) (x) S_E (x,y) eta (y)
    ],
$ <eq:free-fermion-generating-functional>

where the Euclidean propagator is the inverse Dirac operator,

$
  cal(D)_(E,x) S_E (x,y) = delta^(d)(x-y),
  quad
  S_E (p) = (-i gamma_E^mu p_mu + m)/(p^2 + m^2).
$ <eq:euclidean-fermion-propagator>

In particular,

$
  chevron.l psi_alpha (x) overline(psi)_beta (y) chevron.r_0
  = (S_E (x,y))_(alpha beta).
$ <eq:free-fermion-two-point>

Before normalization, integrating out a free Dirac field contributes
$upright("Det") cal(D)_E$, whereas a real bosonic field contributes
$[upright("Det") cal(K)]^(-1/2)$.  This opposite determinant power is often the
fastest way to check a calculation.  Both functional determinants are still
infinite products and require the same sort of regulator discussed after
@eq:functional-determinant-trace-log.

Finally, fermionic Wick contractions carry their permutation signs into
perturbation theory.  Relative to the corresponding open chain, closing a
fermion chain leaves one additional interchange of odd objects.  Each closed
fermion loop therefore contributes one factor of $-1$.  This rule is not
appended by hand; it is the diagrammatic record of Grassmann anticommutation.

== Generating Functionals and Sources

The preceding sections evaluated free bosonic and fermionic integrals after
adding linear sources.  We now isolate the general principle behind those
calculations.  A source turns field insertion into differentiation, so one
functional contains every time-ordered correlation function of the theory.
Its logarithm retains only the connected parts.  These statements are
independent of whether the remaining path integral can be evaluated exactly.

=== Functional derivatives

==== Definition and elementary identities

For a function of finitely many variables, its first variation is
$delta F = delta x_i (partial F)/(partial x_i)$.  A functional is the
continuous-index version of the same object.  Its derivative is defined by

$
  delta F [phi]
  = integral dd(x, [d]) delta phi_a (x)
    (delta F [phi])/(delta phi_a (x))
    + O(delta phi^2).
$ <eq:functional-derivative-definition>

Here $a$ denotes any internal index, and repeated discrete indices are summed.
The fundamental identity is

$
  (delta phi_a (x))/(delta phi_b (y))
  = delta_(a b) delta^(d)(x-y).
$ <eq:functional-derivative-field>

It is the continuum counterpart of
$(partial x_i)/(partial x_j) = delta_(i j)$.  For a linear source coupling,

$
  (delta)/(delta J_a (x))
  integral dd(y, [d]) J_b (y) phi_b (y)
  = phi_a (x).
$ <eq:functional-derivative-linear-source>

For a local functional $F [phi]=integral dd(x,[d]) f (phi (x))$ with no field
derivatives,

$
  (delta F)/(delta phi (x)) = (dif f)/(dif phi) (phi (x)).
$ <eq:functional-derivative-local-potential>

When derivatives of the field occur, integration by parts transfers derivatives
from $delta phi$ to their coefficients.  For example, assuming that the
boundary term vanishes,

$
  (delta)/(delta phi (x))
  integral dd(y, [d]) 1/2
    partial_mu phi (y) partial^mu phi (y)
  = -partial^2 phi (x).
$ <eq:functional-derivative-kinetic-term>

Functional derivatives obey the ordinary chain and product rules for commuting
fields.  In particular, two bosonic source derivatives commute.  Derivatives
with respect to Grassmann sources are graded operations: their left or right
action and their order must be fixed, exactly as in
@eq:left-grassmann-derivative.

=== Sources and field insertions

Let a real bosonic field have Euclidean action $S_E [phi]$.  Introduce a
commuting source $J (x)$ and define

$
  Z_E [J]
  &:= integral cal(D) phi
    exp[-S_E [phi]
      + integral dd(x, [d]) J (x) phi (x)], \
  cal(Z)_E [J]
  &:= (Z_E [J])/(Z_E [0]).
$ <eq:euclidean-generating-functional-definition>

The denominator is independent of $J$, so
@eq:functional-derivative-linear-source gives

$
  (delta^n cal(Z)_E [J])/
  (delta J (x_1) dots delta J (x_n))
  = 1/(Z_E [0])
    integral cal(D) phi
    phi (x_1) dots phi (x_n)
    e^(-S_E [phi] + integral J phi).
$ <eq:source-derivatives-insert-fields>

We use the compact notation $integral J phi$ when all spacetime integrations
and internal indices are unambiguous.  Setting the source to zero yields the
Euclidean $n$-point function

$
  G_E^((n)) (x_1,dots,x_n)
  := chevron.l phi (x_1) dots phi (x_n) chevron.r
  = [
      (delta^n cal(Z)_E [J])/
      (delta J (x_1) dots delta J (x_n))
    ]_(J=0).
$ <eq:euclidean-correlators-from-source>

In particular, $cal(Z)_E [0]=1$ generates the normalized zero-point function.
If both the action and measure are invariant under $phi arrow.r -phi$, every
odd derivative at $J=0$ vanishes.

For several fields one introduces one source per field component.  A complex
scalar uses independent commuting sources $J$ and $overline(J)$ coupled as
$integral (overline(J) phi + overline(phi) J)$.  A Dirac field uses independent
Grassmann-odd sources $eta$ and $overline(eta)$ coupled as
$integral (overline(eta) psi + overline(psi) eta)$.  Differentiating with respect
to the source paired with a field inserts that field; in the fermionic case the
order of the derivatives is part of the prescription.

=== Operator meaning and time ordering

The Minkowski generating functional has a direct operator interpretation.
With the vacuum selected by the usual $i 0$ prescription, define the normalized
vacuum persistence amplitude

$
  cal(Z)_M [J]
  := chevron.l Omega |
    T exp[i integral dd(x, [d]) J (x) hat(phi)_H (x)]
    | Omega chevron.r.
$ <eq:minkowski-operator-generating-functional>

The subscript $H$ denotes a Heisenberg-picture field.  Expanding the
time-ordered exponential gives

$
  cal(Z)_M [J]
  = sum_(n=0)^infinity i^n/(n!)
    integral product_(r=1)^n dd(x_r, [d])
    J (x_1) dots J (x_n)
    chevron.l Omega |
      T hat(phi)_H (x_1) dots hat(phi)_H (x_n)
    | Omega chevron.r.
$ <eq:minkowski-source-expansion>

Therefore

$
  G_M^((n)) (x_1,dots,x_n)
  &:= chevron.l Omega |
      T hat(phi)_H (x_1) dots hat(phi)_H (x_n)
      | Omega chevron.r \
  &= [
      1/i^n
      (delta^n cal(Z)_M [J])/
      (delta J (x_1) dots delta J (x_n))
    ]_(J=0).
$ <eq:minkowski-correlators-from-source>

Thus the time ordering is not an extra rule imposed after the path integral:
it is already encoded in the vacuum amplitude from which the path integral is
derived.  The Euclidean functional in
@eq:euclidean-generating-functional-definition is obtained by analytic
continuation.  Its derivatives have no factors of $i$, as shown in
@eq:euclidean-correlators-from-source.  Keeping the Euclidean and Minkowski
conventions separate prevents most source-related sign errors.

=== Free bosonic and fermionic master formulas

The Gaussian calculations of Sections 1.2 and 1.3 can now be collected into a
small set of master formulas.  For a real Euclidean boson with quadratic
operator $cal(K)$ and inverse $G=cal(K)^(-1)$,

$
  cal(Z)_(0,E) [J]
  = exp[
      1/2 integral dd(x, [d]) dd(y, [d])
      J (x) G (x,y) J (y)
    ].
$ <eq:free-real-boson-master-functional>

For a complex Euclidean boson,

$
  cal(Z)_(0,E) [overline(J),J]
  = exp[
      integral dd(x, [d]) dd(y, [d])
      overline(J) (x) G (x,y) J (y)
    ].
$ <eq:free-complex-boson-master-functional>

For a Euclidean Dirac field with propagator $S_E=cal(D)_E^(-1)$,

$
  cal(Z)_(0,E) [overline(eta),eta]
  = exp[
      integral dd(x, [d]) dd(y, [d])
      overline(eta) (x) S_E (x,y) eta (y)
    ].
$ <eq:free-dirac-master-functional>

Equations @eq:free-real-boson-master-functional,
@eq:free-complex-boson-master-functional, and
@eq:free-dirac-master-functional contain all free correlation functions.  The
quadratic kernels in their exponents are precisely the basic contractions.
The source types encode the statistics: $J$ and $overline(J)$ commute, while
$eta$ and $overline(eta)$ anticommute.  Consequently, bosonic source derivatives
sum pairings with positive signs, whereas fermionic derivatives reproduce the
permutation signs of @eq:fermionic-wick-determinant.

For comparison, let a real Minkowski action be
$S_0 [phi]=1/2 integral phi K phi$, with the inverse of $K$ fixed by the Feynman
$i 0$ prescription.  Completing the oscillatory Gaussian gives

$
  cal(Z)_(0,M) [J]
  = exp[-i/2 integral J K^(-1) J].
$ <eq:free-minkowski-boson-master-functional>

Two differentiations according to @eq:minkowski-correlators-from-source give
$G_M^((2))=i K^(-1)$, the Feynman propagator.  This explicitly locates the
factor of $i$: $K^(-1)$ is the inverse quadratic operator, while the
time-ordered two-point function is $i K^(-1)$ in this convention.

=== Connected generating functional

Full correlation functions contain products of statistically independent
pieces.  Their connected parts are generated by the logarithm.  In Euclidean
signature define

$
  W_E [J] := log cal(Z)_E [J],
  quad
  cal(Z)_E [J] = e^(W_E [J]).
$ <eq:euclidean-connected-generator>

The first two derivatives illustrate the statement:

$
  (delta W_E)/(delta J_1)
  &= 1/(cal(Z)_E)
    (delta cal(Z)_E)/(delta J_1), \
  (delta^2 W_E)/(delta J_1 delta J_2)
  &= 1/(cal(Z)_E)
    (delta^2 cal(Z)_E)/(delta J_1 delta J_2)
   - 1/(cal(Z)_E^2)
    (delta cal(Z)_E)/(delta J_1)
    (delta cal(Z)_E)/(delta J_2),
$ <eq:first-two-connected-derivatives>

where $J_r$ abbreviates $J (x_r)$.  At $J=0$,

$
  G_(E,c)^((1)) (x_1)
  &= chevron.l phi_1 chevron.r, \
  G_(E,c)^((2)) (x_1,x_2)
  &= chevron.l phi_1 phi_2 chevron.r
   - chevron.l phi_1 chevron.r
     chevron.l phi_2 chevron.r.
$ <eq:connected-one-and-two-point>

In general,

$
  G_(E,c)^((n)) (x_1,dots,x_n)
  = [
      (delta^n W_E [J])/
      (delta J (x_1) dots delta J (x_n))
    ]_(J=0).
$ <eq:euclidean-connected-correlators>

Conversely, a full correlator is the sum over partitions of its arguments into
connected blocks:

$
  G_E^((n)) (x_1,dots,x_n)
  = sum_(P in cal(P)_n)
    product_(B in P) G_(E,c)^((abs(B))) ({x_r : r in B}).
$ <eq:full-correlator-partition-formula>

Here $cal(P)_n$ is the set of partitions of ${1,dots,n}$.  For a centered
field, the four-point case reduces to

$
  G_E^((4)) (1,2,3,4)
  &= G_(E,c)^((4)) (1,2,3,4)
   + G_(E,c)^((2)) (1,2) G_(E,c)^((2)) (3,4) \
  &quad
   + G_(E,c)^((2)) (1,3) G_(E,c)^((2)) (2,4)
   + G_(E,c)^((2)) (1,4) G_(E,c)^((2)) (2,3).
$ <eq:connected-four-point-decomposition>

For a free theory, $W_E$ is quadratic in the sources.  Every connected
correlator above second order therefore vanishes, and
@eq:connected-four-point-decomposition becomes the four-point Wick formula.
More generally, disconnected components exponentiate with the combinatorial
factor that counts indistinguishable components; taking the logarithm reverses
that exponential construction and keeps one connected component.

In Minkowski signature it is conventional to write

$
  W_M [J] := -i log cal(Z)_M [J],
  quad
  cal(Z)_M [J] = e^(i W_M [J]).
$ <eq:minkowski-connected-generator>

With this definition the connected time-ordered functions are

$
  G_(M,c)^((n)) (x_1,dots,x_n)
  = [
      1/i^(n-1)
      (delta^n W_M [J])/
      (delta J (x_1) dots delta J (x_n))
    ]_(J=0).
$ <eq:minkowski-connected-correlators>

The different powers of $i$ in
@eq:euclidean-connected-correlators and
@eq:minkowski-connected-correlators are convention factors; the combinatorial
meaning of connectedness is the same.

=== Interactions as functional differential operators

Let the Euclidean action split into a quadratic part and an interaction,

$
  S_E [phi] = S_(0,E) [phi] + S_("int",E) [phi].
$ <eq:euclidean-action-split>

Since

$
  phi (x) e^(integral J phi)
  = (delta)/(delta J (x)) e^(integral J phi),
$ <eq:euclidean-field-source-identity>

every occurrence of $phi$ in the interaction can be replaced by a source
derivative.  Expanding the interaction exponential as a formal power series,
moving all source derivatives outside the Gaussian integral, and resumming
gives

$
  Z_E [J]
  = exp[
      -S_("int",E) [(delta)/(delta J)]
    ] Z_(0,E) [J].
$ <eq:euclidean-interaction-differential-operator>

The normalized functional must also remove the interacting vacuum amplitude:

$
  cal(Z)_E [J]
  =
  (exp[-S_("int",E) [(delta)/(delta J)]] Z_(0,E) [J])/
  ([exp[-S_("int",E) [(delta)/(delta J)]] Z_(0,E) [J]]_(J=0)).
$ <eq:normalized-interacting-generating-functional>

In Minkowski signature,

$
  phi (x) e^(i integral J phi)
  = 1/i (delta)/(delta J (x)) e^(i integral J phi),
$ <eq:minkowski-field-source-identity>

so the corresponding unnormalized formula is

$
  Z_M [J]
  = exp[
      i S_("int",M) [1/i (delta)/(delta J)]
    ] Z_(0,M) [J].
$ <eq:minkowski-interaction-differential-operator>

The fermionic version replaces fields by ordered left or right derivatives
with respect to $overline(eta)$ and $eta$.  Its precise signs follow from the
chosen source ordering, but its structure is identical: the interaction acts
as a functional differential operator on the free Gaussian functional.  All
formulas in this subsection are understood first with a finite regulator, where
they are identities between ordinary power series.  They are the algebraic
starting point for the perturbative expansion developed later.

== From Quantum Mechanics to Field Theory

A quantum-mechanical coordinate depends on time.  A field depends on time and
on a spatial label, so it may be viewed as a system with one coordinate at
every point of space.  To make this statement precise, we begin with finitely
many coupled oscillators, place them on a spatial lattice, and only then take a
continuum limit.  This route explains both the field path-integral measure and
the interpretation of free particles as quanta of normal modes.

=== Many coupled degrees of freedom

Consider $N$ real coordinates $q_i (t)$ with quadratic action

$
  S_N [q]
  = integral_(t_i)^(t_f) dd(t)
    [
      1/2 dot(q)_i dot(q)_i
      - 1/2 q_i Omega^2_(i j) q_j
    ].
$ <eq:coupled-oscillator-action>

The real symmetric matrix $Omega^2$ contains both the individual restoring
forces and the couplings between coordinates.  If it is positive definite, an
orthogonal matrix $O$ diagonalizes it:

$
  O Omega^2 O^T
  = upright("diag") (omega_1^2,dots,omega_N^2),
  quad
  Q_alpha (t) = O_(alpha i) q_i (t).
$ <eq:coupled-oscillator-diagonalization>

The action becomes a sum of independent harmonic-oscillator actions,

$
  S_N [Q]
  = sum_(alpha=1)^N integral dd(t)
    [
      1/2 dot(Q)_alpha^2
      - 1/2 omega_alpha^2 Q_alpha^2
    ].
$ <eq:normal-mode-oscillator-action>

Nothing essentially infinite-dimensional has appeared.  The source-dependent
path integral is the ordinary continuum-time limit of finite multiple
integrals:

$
  Z_N [J]
  = integral product_(i=1)^N cal(D) q_i
    exp[
      i S_N [q]
      + i integral dd(t) J_i (t) q_i (t)
    ].
$ <eq:coupled-oscillator-generating-functional>

The formulas of Sections 1.1--1.4 therefore already contain the algebra needed
for a regulated field theory.  The new step is to let the coordinate label
$i$ become a spatial label.

=== Spatial lattice and the continuum field

Let space have $d_s$ dimensions and let $D=d_s+1$ be the spacetime dimension.
Put a real variable $phi_n (t)$ at every site $n$ of a periodic spatial lattice
with spacing $a$.  If $e_r$ denotes one lattice step in direction $r$, a
nearest-neighbor scalar action is

$
  S_a [phi]
  = integral dd(t) a^(d_s) sum_n
    [
      1/2 dot(phi)_n^2
      - 1/2 sum_(r=1)^(d_s)
        ((phi_(n+e_r) - phi_n)/a)^2
      - 1/2 m^2 phi_n^2
    ].
$ <eq:lattice-scalar-action>

At fixed lattice spacing and finite volume, this is precisely the coupled
system @eq:coupled-oscillator-action.  The spatial difference and sum approach

$
  (phi_(n+e_r) - phi_n)/a
  &arrow.r partial_r phi (t,x), \
  a^(d_s) sum_n
  &arrow.r integral dd(x, [d_s])
$ <eq:lattice-continuum-replacements>

when the field varies smoothly on the scale $a$.  The continuum action is

$
  S [phi]
  = integral dd(x, [D])
    [
      1/2 partial_mu phi (x) partial^mu phi (x)
      - 1/2 m^2 phi (x)^2
    ].
$ <eq:continuum-real-scalar-action>

We use the mostly-minus Minkowski metric in
@eq:continuum-real-scalar-action.  After $t=-i tau$, the Euclidean action has
positive kinetic and mass terms.

The spatial Dirac delta also has a finite-lattice origin.  The identity

$
  a^(d_s) sum_m (delta_(n m))/(a^(d_s)) f_m = f_n
$ <eq:lattice-delta-identity>

shows that

$
  (delta_(n m))/(a^(d_s))
  arrow.r delta^((d_s)) (x-y).
$ <eq:lattice-delta-continuum-limit>

Likewise, after time slicing, the regulated configuration-space measure is an
ordinary finite product,

$
  cal(D)_a phi
  := product_(ell,n) dd(phi_(ell,n)).
$ <eq:lattice-field-measure>

The formal symbol $cal(D) phi$ means that physical quantities are first
computed with this finite measure and then studied as the time step, lattice
spacing, and box regulator are removed.

=== Normal modes and the particle interpretation

Spatial translation invariance makes Fourier modes the normal coordinates of
the lattice.  In a periodic box of volume $V$, choose the normalization

$
  phi_n (t)
  = 1/sqrt(V) sum_k
    e^(i k dot x_n) tilde(phi)_k (t),
  quad
  tilde(phi)_(-k) = overline(tilde(phi)_k),
$ <eq:lattice-field-fourier-transform>

where the second relation follows because $phi_n$ is real.  Substitution into
@eq:lattice-scalar-action diagonalizes the spatial indices:

$
  S_a [phi]
  = 1/2 integral dd(t) sum_k
    [
      dot(tilde(phi))_k dot(tilde(phi))_(-k)
      - omega_a (k)^2
        tilde(phi)_k tilde(phi)_(-k)
    ],
$ <eq:lattice-field-mode-action>

with lattice dispersion relation

$
  omega_a (k)^2
  = m^2 + 4/a^2 sum_(r=1)^(d_s)
    sin^2((k_r a)/2).
$ <eq:lattice-scalar-dispersion>

For momenta much smaller than the cutoff $pi/a$,

$
  omega_a (k)^2
  arrow.r k^2 + m^2.
$ <eq:continuum-scalar-dispersion>

Equivalently, in continuum notation,

$
  phi (t,x)
  = integral (dd(k, [d_s]))/((2 pi)^(d_s))
    e^(i k dot x) tilde(phi) (t,k),
$ <eq:continuum-spatial-fourier-transform>

and the free action is a continuum sum of oscillator actions,

$
  S [phi]
  = 1/2 integral dd(t)
    integral (dd(k, [d_s]))/((2 pi)^(d_s))
    [
      dot(tilde(phi)) (t,k) dot(tilde(phi)) (t,-k)
      - omega_k^2
        tilde(phi) (t,k) tilde(phi) (t,-k)
    ],
  quad
  omega_k = sqrt(k^2 + m^2).
$ <eq:continuum-field-mode-action>

Quantizing each independent normal mode gives oscillator energies
$E_k=(n_k+1/2) omega_k$.  Raising $n_k$ by one creates one quantum with spatial
momentum $k$ and energy $omega_k$.  This is the free-particle interpretation of
a quantum field.  The detailed creation and annihilation operators,
normalization of states, and Fock-space construction are developed in the next
chapter.

=== Canonical structure and the field path integral

For a local Lagrangian density $cal(L) (phi_a,partial_mu phi_a)$, the momentum
conjugate to the field is

$
  pi_a (t,x)
  := (partial cal(L))/(partial dot(phi)_a) (t,x).
$ <eq:field-canonical-momentum>

The finite-dimensional canonical relation
$[hat(q)_i,hat(p)_j]=i delta_(i j)$ becomes the equal-time field relation

$
  [
    hat(phi)_a (t,x),
    hat(pi)_b (t,y)
  ]
  = i delta_(a b) delta^((d_s)) (x-y).
$ <eq:field-equal-time-commutator>

For the lattice scalar, the canonical site momentum is
$p_n=a^(d_s) dot(phi)_n$.  Hence

$
  [hat(phi)_n,hat(p)_m]
  &= i delta_(n m), \
  [hat(phi)_n,dot(hat(phi))_m]
  &= i (delta_(n m))/(a^(d_s)),
$ <eq:lattice-field-commutators>

which tends to @eq:field-equal-time-commutator by
@eq:lattice-delta-continuum-limit.

Let $cal(H) (pi,phi)$ be the Hamiltonian density.  Repeating the time-slicing
argument of Section 1.1 for all lattice sites gives the phase-space field
integral

$
  Z
  = integral cal(D) pi cal(D) phi
    exp[
      i integral dd(x, [D])
      (pi_a dot(phi)_a - cal(H) (pi,phi))
    ].
$ <eq:field-phase-space-path-integral>

When $cal(H)$ is quadratic in $pi$, the momentum integral is Gaussian and
produces

$
  Z [J]
  = integral cal(D) phi
    exp[
      i S [phi]
      + i integral dd(x, [D]) J_a (x) phi_a (x)
    ].
$ <eq:field-configuration-generating-functional>

Thus the source formalism of Section 1.4 is the field-theory version of adding
a driving force to every coordinate of a coupled oscillator system.

=== Locality, Lorentz invariance, and mass dimensions

A relativistic field theory is normally specified by a local action

$
  S [phi]
  = integral dd(x, [D])
    cal(L) (phi (x),partial_mu phi (x)).
$ <eq:local-field-action>

Locality means that the Lagrangian density at $x$ depends on fields and a
finite number of their derivatives at the same point.  Lorentz invariance
requires its spacetime indices to be contracted into Lorentz scalars.  These
conditions restrict the possible terms before any path integral is evaluated.

Natural units provide a quick consistency check.  Assign mass dimensions

$
  [x] = -1,
  quad
  [partial_mu] = 1,
  quad
  [S] = 0,
  quad
  [cal(L)] = D.
$ <eq:basic-mass-dimensions>

The scalar kinetic term in @eq:continuum-real-scalar-action then implies

$
  2 + 2 [phi] = D,
  quad arrow.r quad
  [phi] = (D-2)/2.
$ <eq:scalar-field-mass-dimension>

Because $integral dd(x,[D]) J (x) phi (x)$ is dimensionless, the scalar source
has dimension

$
  [J] = D - [phi] = (D+2)/2.
$ <eq:scalar-source-mass-dimension>

More generally, a coefficient $g_n$ multiplying $phi^n$ has

$
  [g_n] = D - n (D-2)/2.
$ <eq:scalar-coupling-mass-dimension>

Equation @eq:scalar-coupling-mass-dimension is only dimensional bookkeeping at
this stage; its significance for ultraviolet behavior is postponed until
renormalization is introduced.

=== What changes for other fields?

The regulated construction is common to all fields, but their local variables
and quadratic operators differ.

+ A *real scalar field* assigns one commuting real variable to each lattice
  site.  Its quadratic operator is second order in derivatives.
+ A *complex scalar field* contains two real commuting degrees of freedom.
  In the path integral, $phi$ and $overline(phi)$ are treated as independent
  variables, and independent sources are used for them.
+ A *Dirac field* uses Grassmann variables.  Its kinetic operator is first
  order, its Gaussian integral produces a determinant, and
  $[psi]=(D-1)/2$ follows from the kinetic term
  $overline(psi) gamma^mu partial_mu psi$.
+ A *vector field* carries a Lorentz index.  A gauge field also contains
  redundant variables, so its quadratic operator has zero directions until a
  gauge condition is imposed.

The next chapter applies the common framework of this chapter to these field
types one by one.  The essential calculation remains unchanged: identify the
regulated quadratic operator, invert it with the correct boundary
prescription, and use sources to generate the desired correlation functions.

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

#exercise(
  title: "Grassmann Gaussians and the free fermion",
  label: <ex:grassmann-gaussian>,
)[
Let $psi_i$ and $overline(psi)_i$, $i=1,dots,N$, be independent Grassmann
variables, and use the measure orientation of
@eq:fermionic-matrix-gaussian.

+ For one conjugate pair, expand the exponential in
  @eq:one-pair-fermionic-source completely.  Perform both Berezin integrals and
  verify every sign and the factor of $a$.
+ For general $N$, show directly that the coefficient of the monomial
  containing all $psi_i$ and $overline(psi)_i$ in
  $e^(-overline(psi)_i A_(i j) psi_j)$ is $det A$ with the chosen orientation.
  Then complete the square to derive @eq:fermionic-matrix-gaussian.
+ Differentiate @eq:normalized-fermionic-gaussian with a fixed left/right
  derivative convention and reproduce @eq:fermionic-two-point and
  @eq:fermionic-four-point.  Identify the transposition responsible for the
  relative minus sign in the four-point function.
+ For a free fermionic oscillator with
  $hat(H) = omega hat(a)^dagger hat(a)$, evaluate
  $upright("Tr") e^(-beta hat(H))$ directly in the occupation-number basis.
  Evaluate the same quantity from @eq:fermionic-euclidean-action using
  antiperiodic frequencies, and show that both methods give
  $Z (beta) = 1 + e^(-beta omega)$.
]

#exercise(
  title: "Functional derivatives and source insertions",
  label: <ex:functional-source-insertions>,
)[
Let $J_a (x)$ be a commuting source for a real multicomponent field.

+ Starting from @eq:functional-derivative-definition, derive
  @eq:functional-derivative-field and
  @eq:functional-derivative-linear-source.  Carefully distinguish the Dirac
  delta function in spacetime from the Kronecker delta in the internal index.
+ Let
  $F [phi]=integral dd(x,[d])
  [1/2 partial_mu phi partial^mu phi + V (phi)]$.
  Compute $(delta F)/(delta phi (x))$, state the boundary condition used, and check
  the result against @eq:functional-derivative-kinetic-term.
+ Expand @eq:minkowski-operator-generating-functional through third order in
  $J$.  Differentiate the result and verify every factor of $i$ in
  @eq:minkowski-correlators-from-source.
+ Apply source derivatives to the three master formulas
  @eq:free-real-boson-master-functional,
  @eq:free-complex-boson-master-functional, and
  @eq:free-dirac-master-functional.  State which two-point insertions vanish
  in each theory and explain the result from the source types.
]

#exercise(
  title: "Full and connected correlation functions",
  label: <ex:connected-correlators>,
)[
Let $cal(Z)_E [J]=e^(W_E [J])$ and assume $cal(Z)_E [0]=1$.

+ Differentiate this relation two and three times and express the full
  correlators in terms of connected correlators and one-point functions.
+ Differentiate four times for a centered field and derive
  @eq:connected-four-point-decomposition, including all three partitions into
  two pairs.
+ For the free real-boson functional
  @eq:free-real-boson-master-functional, show that all connected functions with
  $n>2$ vanish.  Recover the general bosonic Wick rule by inserting the
  quadratic $W_E [J]$ into @eq:full-correlator-partition-formula.
+ Starting from $cal(Z)_M=e^(i W_M)$, derive
  @eq:minkowski-connected-correlators and check its powers of $i$ for
  $n=1,2,3$.
]

#exercise(
  title: "From an oscillator chain to a scalar field",
  label: <ex:oscillator-chain-continuum>,
)[
Consider a periodic one-dimensional chain with spacing $a$, site coordinates
$q_n (t)$, and action

$
  S_a [q]
  = integral dd(t) a sum_n
    [
      1/2 dot(q)_n^2
      - v^2/2 ((q_(n+1)-q_n)/a)^2
      - m^2/2 q_n^2
    ].
$

+ Identify $q_n (t)$ with samples of a smooth field $phi (t,x)$ and derive
  the continuum action as $a arrow.r 0$ at fixed physical length.
+ Derive the Euler--Lagrange equation on the lattice and show that it tends to
  $(partial_t^2-v^2 partial_x^2+m^2) phi (t,x)=0$.
+ Compute the momentum conjugate to $q_n$ and derive the lattice equal-time
  commutator corresponding to @eq:lattice-field-commutators.
]

#exercise(
  title: "Lattice normal modes and dispersion",
  label: <ex:lattice-normal-modes>,
)[
Use the periodic lattice action @eq:lattice-scalar-action.

+ Substitute @eq:lattice-field-fourier-transform and prove the orthogonality
  relation required to diagonalize the site labels.
+ Derive @eq:lattice-scalar-dispersion, keeping the lattice spacing explicit.
+ Expand $omega_a (k)^2$ through order $a^2$ at fixed momentum.  Identify the
  leading deviation from the relativistic continuum dispersion relation and
  explain why modes near $pi/a$ cannot be described by that expansion.
+ Show directly from the mode action that the reality condition pairs the
  $k$ and $-k$ coefficients, so they must not be counted as unrelated complex
  oscillators.
]

#exercise(
  title: "Field and source dimensions",
  label: <ex:field-source-dimensions>,
)[
Work in $D$ spacetime dimensions and natural units.

+ Starting from the scalar kinetic term, derive
  @eq:scalar-field-mass-dimension and
  @eq:scalar-source-mass-dimension.
+ Derive $[psi]=(D-1)/2$ from the Dirac kinetic term and determine the mass
  dimension of a Grassmann source coupled through
  $integral dd(x,[D]) overline(eta) psi$.
+ Determine the dimensions of coefficients multiplying $phi^3$, $phi^4$,
  $overline(psi) psi phi$, and
  $(overline(psi) gamma^mu psi) (overline(psi) gamma_mu psi)$.  Check each result
  explicitly in $D=4$.
]
