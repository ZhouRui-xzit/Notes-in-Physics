#import "../../lib.typ": *
#import "@preview/cetz:0.4.2"

= From Correlation Functions to Scattering Amplitudes
== Perturbative Correlation Functions
Chapter 1 established the functional identities behind perturbation theory.
We now use them as a calculation scheme.  Consider a real scalar field in
Minkowski spacetime, with action

$
  S_M [phi]
  = S_(0,M) [phi] + S_("int",M) [phi].
$

Begin with the unnormalized sourced path integral

$
  Z_M [J]
  := integral cal(D) phi
  exp(
    i (S_(0,M) [phi] + S_("int",M) [phi]
      + integral dd(x, [4]) J (x) phi (x))
  )
$

Its zero-source value $Z_M [0]$ is the interacting vacuum-persistence
amplitude, not the number one.  The functional that generates normalized
vacuum expectation values is the ratio

$
  cal(Z)_M [J] := (Z_M [J])/(Z_M [0]),
  quad
  cal(Z)_M [0] = 1.
$

To expand this ratio, replace fields only inside the interaction action by
source derivatives.  In terms of the normalized free functional
$cal(Z)_(0,M) [J]$ of @eq:scalar-feynman-generating-functional,

$
  cal(Z)_M [J]
  = frac(
    exp[i S_("int",M) [1/i (delta)/(delta J)]]
    cal(Z)_(0,M) [J],
    [
      exp[i S_("int",M) [1/i (delta)/(delta J)]]
      cal(Z)_(0,M) [J]
    ]_(J=0)
  ).
$ <eq:normalized-minkowski-interacting-functional>

The denominator has one precise diagrammatic job.  At each order, all
source-free Wick components are vacuum bubbles, and their sum exponentiates
into the zero-source factor in the denominator.  They therefore cancel from
$cal(Z)_M [J]$.  This cancellation does not remove a diagram merely because
the external points split among several source-attached components; the
four-point calculation below will exhibit such terms explicitly.

All manipulations in this section are understood first with a regulator and
the Feynman $i 0$ prescription.  The parameters $m$ and $lambda$ are bare at
this stage, and $Delta_F (0)$ denotes the regulated coincident propagator.  It
diverges when the ultraviolet regulator is removed.

Functional differentiation now gives the normalized time-ordered functions:

$
  G_M^((n)) (x_1,dots,x_n)
  = [
    1/i^n
    (delta^n cal(Z)_M [J])/
    (delta J (x_1) dots delta J (x_n))
  ]_(J=0).
$

We apply this machinery to Minkowski $phi^4$ theory,

$
  cal(L)_"int" = -lambda/(4!) phi^4,
  quad
  S_("int",M) [phi]
  = -lambda/(4!) integral dd(z, [4]) phi^4 (z).
$

The exponential in @eq:normalized-minkowski-interacting-functional then
generates one factor $-i lambda$ per vertex.  We calculate first the two-point
function and then the four-point function, retaining every Wick topology
through $O(lambda^2)$.

=== The two-point function

Direct expansion gives

$
  G_M^((2)) (x,y) & = Delta_F (x-y) \
                  & + (-i lambda)/2 integral dd(z, [4])
                    Delta_F (x-z) Delta_F (0) Delta_F (z-y) \
                  & + (-i lambda)^2/6 integral dd(z_1, [4]) dd(z_2, [4])
                    Delta_F (x-z_1) [Delta_F (z_1-z_2)]^3 Delta_F (z_2-y) \
                  & + (-i lambda)^2/4 integral dd(z_1, [4]) dd(z_2, [4])
                    Delta_F (x-z_1) Delta_F (0) Delta_F (z_1-z_2)
                    Delta_F (0) Delta_F (z_2-y) \
                  & + (-i lambda)^2/4 integral dd(z_1, [4]) dd(z_2, [4])
                    Delta_F (x-z_1) [Delta_F (z_1-z_2)]^2
                    Delta_F (0) Delta_F (z_1-y)
                    + O(lambda^3).
$ <eq:two-point-function-through-second-order>

#figure(
  image("../../fig/feynman/ch4_two_point_topologies.svg", width: 96%),
  caption: [
    The five two-point topologies in
    @eq:two-point-function-through-second-order, in the order in which they
    appear.  The colored dots are interaction vertices; all lines are scalar
    propagators.
  ],
) <fig:two-point-topologies-through-second-order>

The first correction is the one-vertex tadpole.  At second order the last
three diagrams in @fig:two-point-topologies-through-second-order are,
respectively, the sunset topology, two successive tadpole insertions, and a
tadpole-dressed two-line insertion.  Their symmetry factors are $1/6$, $1/4$,
and $1/4$.  No term consisting of the free line
$Delta_F (x-y)$ times a source-free vacuum bubble remains after normalization.
Because the theory is invariant under $phi arrow.r -phi$, a two-point graph
also cannot split into two nonzero source-attached components.

=== The four-point function

The four-point function is the first example in which vacuum bubbles cancel
but source-attached disconnected terms survive.  To display the expansion
compactly, write the preceding two-point result as

$
  G_M^((2)) (x_i,x_j)
  = D_M^((0)) (x_i,x_j)
  + D_M^((1)) (x_i,x_j)
  + D_M^((2)) (x_i,x_j)
  + O(lambda^3),
$

where $D_M^((r))=O(lambda^r)$ denotes the complete contribution of order $r$;
in particular, $D_M^((2))$ is the sum of the three second-order terms above.
The three ways to divide four external points into pairs are

$
  cal(P)_4^((2))
  := {((1,2),(3,4)),((1,3),(2,4)),((1,4),(2,3))}.
$

For the two-vertex terms, define the two compact integrands

$
   cal(T)_"leg" (z_1,z_2) & := sum_(a=1)^4
                            product_(b=1, b != a)^4 Delta_F (x_b-z_1)
                            Delta_F (z_1-z_2) Delta_F (0) Delta_F (z_2-x_a), \
  cal(T)_"fish" (z_1,z_2) & := sum_(((i,j),(k,l)) in cal(P)_4^((2)))
                            Delta_F (x_i-z_1) Delta_F (x_j-z_1)
                            [Delta_F (z_1-z_2)]^2
                            Delta_F (z_2-x_k) Delta_F (z_2-x_l).
$

The first contains the four choices of an external leg with a tadpole
insertion.  The second contains the fish graph in each of the three pair
channels.  The complete normalized four-point function is then

$
  G_M^((4)) (x_1,x_2,x_3,x_4) & = sum_(((i,j),(k,l)) in cal(P)_4^((2))) [
                                D_M^((0)) (x_i,x_j) D_M^((0)) (x_k,x_l) \
                              & quad + D_M^((1)) (x_i,x_j) D_M^((0)) (x_k,x_l)
                                + D_M^((0)) (x_i,x_j) D_M^((1)) (x_k,x_l) \
                              & quad + D_M^((2)) (x_i,x_j) D_M^((0)) (x_k,x_l)
                                + D_M^((0)) (x_i,x_j) D_M^((2)) (x_k,x_l) \
                              & quad + D_M^((1)) (x_i,x_j) D_M^((1)) (x_k,x_l)
                                ] \
                              & quad + (-i lambda) integral dd(z, [4])
                                product_(a=1)^4 Delta_F (x_a-z) \
                              & quad + ((-i lambda)^2)/2
                                integral dd(z_1, [4]) dd(z_2, [4])
                                [cal(T)_"leg" (z_1,z_2) + cal(T)_"fish" (z_1,z_2)] \
                              & quad + O(lambda^3).
$ <eq:normalized-four-point-through-second-order>

#figure(
  image("../../fig/feynman/ch4_leg_fish_topologies.svg", width: 96%),
  caption: [
    Representative connected second-order topologies in
    @eq:normalized-four-point-through-second-order.  The leg insertion has
    four choices for the distinguished external point $x_a$; the fish has the
    three pair channels collected in $cal(P)_4^((2))$.
  ],
) <fig:four-point-leg-fish-topologies>

The first sum contains every source-attached disconnected contribution through
second order.  At zeroth order it gives the three free Wick pairings.  At first
order one two-point component is corrected while the other remains free.  At
second order it contains both $D_M^((2)) D_M^((0))$ and
$D_M^((1)) D_M^((1))$.  The last two lines place all four external points in a
single component: the contact graph at first order, followed by the four
external-leg insertions and three fish channels at second order, represented
in @fig:four-point-leg-fish-topologies.  The internal
two-propagator loop in a fish graph is sometimes itself called a bubble, but it
is not a vacuum bubble and is not removed by normalization.

Equation @eq:normalized-four-point-through-second-order deliberately retains
both single-component and disconnected source-attached terms.  The next
section introduces $W_M [J]:=-i log cal(Z)_M [J]$ to select connected
correlators, then distinguishes amputated and one-particle-irreducible
structures.  Those operations organize the perturbative results calculated
here; they are different from the vacuum normalization already performed in
@eq:normalized-minkowski-interacting-functional.

== Connected, Amputated, and 1PI Functions
Section 4.1 generated every source-attached Wick graph of the required order.
We now reorganize those graphs according to three independent questions.  A
*connected* graph has all external points in one component.  An *amputated*
graph has its external propagators removed.  A *one-particle-irreducible*
(1PI) graph cannot be separated into two components by cutting one internal
propagator.  These operations address different structures, and none of them
is the same as the vacuum normalization of
@eq:normalized-minkowski-interacting-functional.

=== Connected functions from the logarithm

Write the normalized Minkowski functional as

$
  W_M [J] := -i log cal(Z)_M [J],
  quad
  cal(Z)_M [J] = exp(i W_M [J]).
$ <eq:chapter-four-connected-generator>

As established in @eq:minkowski-connected-correlators, its derivatives are the
connected time-ordered functions,

$
  G_(M,c)^((n)) (x_1,dots,x_n)
  = [
    1/i^(n-1)
    (delta^n W_M [J])/
    (delta J (x_1) dots delta J (x_n))
  ]_(J=0).
$ <eq:chapter-four-connected-correlators>

The logarithm selects one source-attached component because a product of
independent connected components exponentiates in $cal(Z)_M [J]$.  This is a
second cancellation after vacuum normalization: division by $Z_M [0]$ removes
components with no external point, whereas the logarithm removes products of
two or more components that each carry external points.

In the symmetric $phi^4$ vacuum, every odd correlation function vanishes.
Consequently the complete four-point function decomposes as

$
  G_M^((4)) (x_1,x_2,x_3,x_4)
  = G_(M,c)^((4)) (x_1,x_2,x_3,x_4)
  + sum_(((i,j),(k,l)) in cal(P)_4^((2)))
  G_(M,c)^((2)) (x_i,x_j) G_(M,c)^((2)) (x_k,x_l).
$ <eq:minkowski-four-point-connected-decomposition>

Comparison with @eq:normalized-four-point-through-second-order removes its
first sum and leaves

$
  G_(M,c)^((4)) (x_1,x_2,x_3,x_4) & = (-i lambda) integral dd(z, [4])
                                    product_(a=1)^4 Delta_F (x_a-z) \
                                  & quad + ((-i lambda)^2)/2
                                    integral dd(z_1, [4]) dd(z_2, [4])
                                    [cal(T)_"leg" (z_1,z_2) + cal(T)_"fish" (z_1,z_2)] \
                                  & quad + O(lambda^3).
$ <eq:connected-four-point-through-second-order>

Thus the contact, external-leg tadpole, and fish graphs are all connected.
Connectedness alone does not discard corrections that sit on an external leg,
nor does it test whether an internal line is a bridge.

=== Amputation removes external propagation

Let the full connected two-point function be

$
  G_M (x,y) := G_(M,c)^((2)) (x,y),
$

and define its convolution inverse by

$
  integral dd(y, [4]) G_M^(-1) (x,y) G_M (y,z)
  = delta^((4)) (x-z).
$ <eq:full-propagator-convolution-inverse>

The amputated connected $n$-point function is

$
  cal(A)_M^((n)) (y_1,dots,y_n)
  := integral product_(r=1)^n dd(x_r, [4])
  product_(r=1)^n G_M^(-1) (y_r,x_r)
  G_(M,c)^((n)) (x_1,dots,x_n).
$ <eq:amputated-connected-function>

This definition removes one *full* external propagator from every leg.  For
example, applying the free inverse to the tree-level contact graph gives

$
  cal(A)_(M,"tree")^((4)) (y_1,y_2,y_3,y_4)
  = (-i lambda) integral dd(z, [4])
  product_(a=1)^4 delta^((4)) (y_a-z).
$ <eq:amputated-four-point-contact>

When @eq:amputated-connected-function is expanded consistently through
$O(lambda^2)$, the $cal(T)_"leg"$ terms in
@eq:connected-four-point-through-second-order are absorbed into the four full
external propagators and their inverses.  The contact kernel and the three fish
kernels remain.  Amputation therefore removes external propagation, not loop
corrections in the interaction region.

An amputated Green function is still off shell and is not yet a scattering
amplitude.  Section 4.3 will determine the physical one-particle pole and its
residue; Section 4.4 will introduce the scattering operator, while the later
LSZ section will take the on-shell limit.  It is also possible for an amputated
connected graph to remain one-particle reducible internally.

=== One-particle reducibility

An internal propagator is a *bridge* when cutting it separates a connected
graph into two components, each attached to at least one external point.  A
connected graph containing such a bridge is one-particle reducible (1PR).  A
connected graph with no such internal line is one-particle irreducible (1PI).
External legs are not included in this test: removing them is amputation, not
the 1PI criterion.

The distinction is visible even after amputation.  In a theory with a nonzero
three-point proper vertex, a four-point function can contain two three-point
vertices joined by one full propagator.  Cutting that internal propagator
separates the graph, so it is amputated and connected but 1PR.  In the present
$phi arrow.r -phi$ symmetric vacuum the three-point vertex vanishes, so this
four-point 1PR channel is absent.  This is a special simplification, not a
general equivalence between amputation and one-particle irreducibility.  For
example, the six-point function of the same $phi^4$ theory contains two
four-point vertices joined by one propagator and is already 1PR at tree level.

For the four-point graphs calculated in Section 4.1, the contact graph is 1PI.
Each fish graph is also 1PI: cutting either of its two parallel internal lines
leaves the vertices connected by the other.  The external-leg tadpole terms
belong instead to the dressing of $G_M$ and disappear under full amputation.

=== Effective action and proper vertices

The functional that generates 1PI vertices is obtained by a Legendre
transform.  Define the source-dependent mean field

$
  phi_"cl" (x) := (delta W_M [J])/(delta J (x)),
$

solve for $J$ as a functional of $phi_"cl"$, and set

$
  Gamma_M [phi_"cl"]
  := W_M [J] - integral dd(x, [4]) J (x) phi_"cl" (x).
$ <eq:minkowski-effective-action>

Its first derivative satisfies

$
  (delta Gamma_M [phi_"cl"])/(delta phi_"cl" (x)) = -J (x).
$ <eq:effective-action-field-equation>

At $J=0$, let $phi_v$ denote the vacuum mean field and define

$
  Gamma_M^((n)) (x_1,dots,x_n)
  := [
    (delta^n Gamma_M [phi_"cl"])/
    (delta phi_"cl" (x_1) dots delta phi_"cl" (x_n))
  ]_(phi_"cl"=phi_v).
$ <eq:proper-vertex-definition>

These kernels are called the proper vertices.
@ex:effective-action-generates-1pi derives from the Legendre transform both
their diagrammatic meaning and the inverse-propagator identity

$
  integral dd(y, [4])
  Gamma_M^((2)) (x,y) G_M (y,z)
  = i delta^((4)) (x-z).
$ <eq:effective-action-inverse-propagator-identity>

Thus $Gamma_M^((2))$ contains the information in the inverse full propagator.
For $n>=3$, the exercise proves perturbatively that $Gamma_M^((n))$ contains
exactly the 1PI graphs; the Feynman kernel associated with a proper vertex is
$i Gamma_M^((n))$ in the present Minkowski conventions.  At tree level,
$Gamma_M^((4))=-lambda$ at coincident arguments, so
$i Gamma_M^((4))=-i lambda$, as required by Section 4.1.

Conversely, connected functions are assembled from full propagators and 1PI
vertices.  After separating its four full external propagators, the exact
four-point structure is

$
  G_(M,c)^((4)) (x_1,x_2,x_3,x_4) & = integral product_(r=1)^4 dd(y_r, [4]) \
                                  & quad product_(r=1)^4 G_M (x_r,y_r) [
                                    i Gamma_M^((4)) (y_1,y_2,y_3,y_4) \
                                  & quad + cal(R)_(M,"1PR")^((4)) (y_1,y_2,y_3,y_4)
                                    ].
$ <eq:connected-four-point-from-proper-vertices>

where $cal(R)_(M,"1PR")^((4))$ contains proper vertices joined by bridge
propagators.  In the symmetric $phi^4$ vacuum,
$Gamma_M^((3))=0$ and hence $cal(R)_(M,"1PR")^((4))=0$.  Through
$O(lambda^2)$, $i Gamma_M^((4))$ therefore consists of the contact kernel and
the three amputated fish kernels.  The external-leg terms of
@eq:connected-four-point-through-second-order are generated instead by
expanding the four full propagators.

This hierarchy is the practical result:

$
  cal(Z)_M
  arrow.r^("log") W_M
  arrow.r^("differentiate") G_(M,c)^((n))
  arrow.r^("amputate") cal(A)_M^((n)),
  quad
  Gamma_M arrow.r^("differentiate") "1PI vertices".
$

The next section begins with the two-point member of this hierarchy.  Its pole
location fixes the physical mass, and its residue fixes the normalization of
the asymptotic one-particle field.

== One-Particle Poles and Field Normalization

The full propagator introduced in Section 4.2 is still a correlation
function of the chosen local field.  Scattering theory, however, refers to
stable particles: states with a definite physical mass and the invariant
normalization constructed in Chapter 2.  This section identifies those states
inside the exact two-point function.  The pole position will define
$m_"phys"$, while the pole residue will define $Z_phi$.  Their role in
asymptotic fields and in the external legs of the $S$-matrix is deliberately
left to the LSZ section.

=== The exact two-point function and its one-particle contribution

Let $ket(Omega)$ be the interacting translationally invariant vacuum.  In the
unbroken $phi arrow.r -phi$-symmetric vacuum used here, every odd correlator
vanishes.  The exact two-point function is therefore already connected, and
we can calculate it directly:

$
  G_M (x-y)
  :=chevron.l Omega|T hat(phi) (x) hat(phi) (y)|Omega chevron.r.
$ <eq:chapter-four-exact-two-point>

Assume that the theory has a stable spin-zero one-particle state $ket(p)$.
Its normalization and mass shell are

$
  braket(p, q)
  =2 E_p (2 pi)^3 delta^((3)) (bold(p)-bold(q)),
  quad
  E_p:=sqrt(bold(p)^2+m_"phys"^2),
  quad
  p^2=-m_"phys"^2.
$ <eq:chapter-four-physical-one-particle-normalization>

The vacuum is a scalar under translations and Lorentz transformations, and
$hat(phi)$ is also a scalar.  Consequently its matrix element with a
one-particle state can contain no vector other than the plane wave.  With the
phase of $ket(p)$ chosen so that the coefficient is real and nonnegative,
define

$
  chevron.l Omega|hat(phi) (x)|p chevron.r
  =sqrt(Z_phi) e^(i p dot x),
  quad
  Z_phi>=0.
$ <eq:chapter-four-one-particle-overlap>

Translation covariance fixes the exponential: since
$tensor(hat(P), +mu) ket(p)=tensor(p, +mu) ket(p)$ and the passive convention
of Chapter 2 gives
$hat(phi) (x)=e^(-i tensor(hat(P), +mu) tensor(x, -mu))
hat(phi) (0)e^(i tensor(hat(P), +mu) tensor(x, -mu))$ inside a matrix
element, the phase is precisely the book's convention
$p dot x=-p^0 t+bold(p) dot bold(x)$.  The normalization of the state is
important here: $Z_phi$ is not an arbitrary coefficient left over from a
choice of delta-function normalization.

To see how this matrix element enters the propagator, first consider the
Wightman function

$
  W (x-y)
  :=chevron.l Omega|hat(phi) (x)hat(phi) (y)|Omega chevron.r.
$ <eq:chapter-four-wightman-function>

Insert a complete set of exact energy-momentum eigenstates between the two
fields.  Inserting the vacuum, one-particle, and multiparticle sectors means

$
  1=ketbra(Omega)+cal(I)_1+cal(I)_"multi".
$ <eq:chapter-four-complete-state-sectors>

The vacuum term vanishes here because the one-point function is zero.  With
the invariant one-particle resolution
$cal(I)_1=integral tilde(dd(p)) ket(p)ketbra(p)$ from @eq:one-particle-invariant-completeness,
the one-particle part is

$
  W_1 (x-y) & = integral tilde(dd(p))
              chevron.l Omega|hat(phi) (x)|p chevron.r
              chevron.l p|hat(phi) (y)|Omega chevron.r \
            & = Z_phi integral tilde(dd(p)) e^(i p dot (x-y)).
$ <eq:chapter-four-one-particle-wightman>

The remaining exact states give additional positive-energy contributions.
For a scalar field, Lorentz invariance allows us to group all states with the
same invariant mass $s=-p^2$ into a nonnegative spectral density.  Thus

$
  W (x-y)
  =integral_0^infinity dd(s) rho (s)
  integral (dd(p, [4]))/((2 pi)^3)
  theta (tensor(p, +0)) delta (p^2+s) e^(i p dot (x-y)),
$ <eq:chapter-four-wightman-spectral-representation>

where the explicit four-dimensional factor is the positive-energy mass-$sqrt(s)$
shell measure.  Equivalently,

$
  W (x-y)
  =integral_0^infinity dd(s) rho (s) W_0 (x-y;s),
  quad
  W_0 (z;s):=integral (dd(p, [4]))/((2 pi)^3)
  theta (tensor(p, +0)) delta (p^2+s) e^(i p dot z).
$ <eq:chapter-four-wightman-spectral-representation-short>

The one-particle matrix element @eq:chapter-four-one-particle-overlap fixes
the delta-function part of the density:

$
  rho (s)
  =Z_phi delta (s-m_"phys"^2)+rho_"cont" (s),
  quad
  rho_"cont" (s)>=0.
$ <eq:chapter-four-spectral-density-decomposition>

The positivity is not a perturbative claim.  Each contribution to $rho$ is a
sum of absolute squares of matrix elements of $hat(phi)$, multiplied by
positive phase-space measures.  A stable particle produces a delta function
because all its states have the same invariant mass.  Multiparticle states
have continuously variable invariant mass and therefore produce a continuum.
If the field has a symmetry that forbids a two-particle matrix element, the
continuum starts at the lightest allowed higher-particle threshold.  In the
unbroken $phi arrow.r -phi$ vacuum of the present $phi^4$ example, the odd
field $hat(phi)$ couples to odd-particle states, so absent a bound state the
first generic continuum begins at $s=(3 m_"phys")^2$.

#figure(
  cetz.canvas(length: 0.82cm, {
    import cetz.draw: *

    let axis = rgb("#657b85")
    let pole = rgb("#d86483")
    let continuum = rgb("#36a6b6")
    let threshold = rgb("#d09217")

    line((0, 0), (7.25, 0), stroke: 0.8pt + axis, mark: (end: ">"))
    line((0, 0), (0, 3.55), stroke: 0.8pt + axis, mark: (end: ">"))
    content((7.3, -0.05), text(size: 8pt, fill: axis)[$s=mu^2$], anchor: "west")
    content((0.08, 3.60), text(size: 8pt, fill: axis)[$rho (s)$], anchor: "south-west")

    line((1.48, 0), (1.48, 2.42), stroke: 1.6pt + pole)
    circle((1.48, 2.42), radius: 0.095, fill: pole, stroke: pole)
    content((1.48, 2.72), text(size: 8pt, fill: pole)[$Z_phi delta (s-m_"phys"^2)$], anchor: "south")
    line((3.15, 0), (3.15, 2.55), stroke: (paint: threshold, thickness: 0.9pt, dash: "dashed"))
    content((3.15, -0.25), text(size: 8pt, fill: threshold)[$s_"th"$], anchor: "north")

    let points = (
      (3.15, 0.08),
      (3.55, 0.24),
      (3.95, 0.43),
      (4.35, 0.66),
      (4.75, 0.93),
      (5.15, 1.23),
      (5.55, 1.56),
      (5.95, 1.91),
      (6.35, 2.27),
    )
    for i in range(0, points.len() - 1) {
      line(points.at(i), points.at(i + 1), stroke: 1.5pt + continuum)
    }
    content((5.78, 2.45), text(size: 8pt, fill: continuum)[$rho_"cont" (s)$], anchor: "west")
    content((3.55, -0.60), text(size: 8pt, fill: axis)[discrete pole + continuum], anchor: "north")
  }),
  caption: [
    Schematic Källén--Lehmann spectral weight.  The isolated delta function
    at $s=m_"phys"^2$ represents a stable one-particle state.  Above the
    first allowed threshold $s_"th"$, multiparticle states fill a continuum;
    its detailed shape is theory-dependent and the sketch is not to scale.
  ],
) <fig:chapter-four-spectral-density>

The spectral density makes the physical interpretation visible: the isolated
pole is the part of the field that can create a single stable particle, while
the continuum records states with more than one particle.  The exact
time-ordered propagator follows directly from

$
  G_M (z)
  =theta (z^0) W (z)+theta (-z^0) W (-z).
$ <eq:chapter-four-time-ordering-from-wightman>

Applying this operation to every mass component and using the free scalar result
@eq:scalar-feynman-time-ordering gives the Källén--Lehmann representation

$
  G_M (z)
  =integral_0^infinity dd(s) rho (s) Delta_F (z;s),
  quad
  Delta_F (p;s):=(-i)/(p^2+s-i 0).
$ <eq:chapter-four-kallen-lehmann-coordinate>

Fourier transformation with @eq:chapter-two-fourier-convention then yields

$
  G_M (p)
  =integral_0^infinity dd(s) rho (s)
  (-i)/(p^2+s-i 0).
$ <eq:chapter-four-kallen-lehmann-momentum>

Separating the delta function in @eq:chapter-four-spectral-density-decomposition
shows the pole explicitly:

$
  G_M (p)
  =(-i Z_phi)/(p^2+m_"phys"^2-i 0)
  +G_"reg" (p),
  quad
  G_"reg" (p):=integral_0^infinity dd(s) rho_"cont" (s)
  (-i)/(p^2+s-i 0).
$ <eq:chapter-four-isolated-one-particle-pole>

If $s_"th">m_"phys"^2$, then $G_"reg"$ is regular in a neighborhood of
$p^2=-m_"phys"^2$.  The pole is therefore isolated.  By contrast, the
continuum produces a nonanalyticity when the external invariant reaches its
threshold; in perturbation theory this appears as a branch cut after the
loop integrals are analytically continued.  A particle that can decay is not
represented by an isolated real-axis delta function: its spectral weight is
part of the continuum, and its resonance pole requires a separate complex
analytic continuation.  Such an unstable excitation is not an asymptotic
one-particle state for the LSZ construction.

=== Reading the pole from the 1PI two-point kernel

The spectral argument is exact and nonperturbative.  To connect it with the
organization of Section 4.2, use translation invariance to diagonalize the
convolution identity @eq:effective-action-inverse-propagator-identity:

$
  Gamma_M^((2)) (p) G_M (p)=i.
$ <eq:chapter-four-momentum-space-inverse-two-point>

For a scalar theory the 1PI kernel depends only on $p^2$.  Define the exact
self-energy function by

$
  Gamma_M^((2)) (p)
  :=-[p^2+m_0^2+Pi_M (p^2)],
$ <eq:chapter-four-self-energy-definition>

where $m_0$ is the regulated bare mass used in Section 4.1.  The full
propagator is consequently

$
  G_M (p)
  =(-i)/(p^2+m_0^2+Pi_M (p^2)-i 0).
$ <eq:chapter-four-dyson-resummed-propagator>

The physical pole is a zero of the inverse propagator on the real mass shell.
Substituting $p^2=-m_"phys"^2$ gives the pole-mass equation

$
  m_0^2-m_"phys"^2+Pi_M (-m_"phys"^2)=0.
$ <eq:chapter-four-pole-mass-equation>

The equation is to be imposed before removing the regulator, with the same
$i 0$ prescription used in the definition of $G_M$.  At a stable pole below
the first continuum threshold, $Pi_M$ is real on the pole.  Above a threshold
it develops an imaginary part, which is precisely the signal that the real
isolated-particle interpretation has failed.

Expand the inverse propagator around the pole.  With
$q:=p^2+m_"phys"^2$ and assuming a simple pole,

$
  p^2+m_0^2+Pi_M (p^2) & =q [1+Pi_M (-m_"phys"^2)] + O(q^2) \
                       & =Z_phi^(-1) q+O(q^2),
$ <eq:chapter-four-inverse-propagator-pole-expansion>

where the prime denotes differentiation with respect to the scalar argument
$p^2$.  Comparing with the exact pole form @eq:chapter-four-isolated-one-particle-pole
gives

$
  Z_phi^(-1)
  =1+Pi'_M (-m_"phys"^2)
  =-[(partial Gamma_M^((2)) (p))/(partial p^2)]_(p^2=-m_"phys"^2).
$ <eq:chapter-four-pole-residue-from-self-energy>

The two pieces of physical information are therefore separated cleanly:
$Pi_M$ evaluated at the pole fixes the mass, while its slope fixes the residue.
The residue depends on the interpolating field.  If the field is rescaled by
a nonzero constant, $hat(phi) arrow.r c hat(phi)$, then
$G_M arrow.r c^2 G_M$ and $Z_phi arrow.r c^2 Z_phi$; the pole position does
not move.


== S-Matrix and Scattering Operator
== Decay Rates and Cross Sections









== The LSZ Reduction Formula
== Feynman Rules for Scattering Amplitudes

#pagebreak()

== Exercises

#exercise(
  title: "Why the effective action generates 1PI vertices",
  label: <ex:effective-action-generates-1pi>,
)[
  Work first at finite regulator, where the Hessians are ordinary invertible
  matrices.  Use the Minkowski conventions of
  @eq:chapter-four-connected-generator and @eq:minkowski-effective-action; do
  not assume the 1PI interpretation in advance.

  + Starting from
    $phi_"cl" (x)=(delta W_M [J])/(delta J (x))$ and
    $(delta Gamma_M [phi_"cl"])/(delta phi_"cl" (x))=-J (x)$, show that

    $
      (delta phi_"cl" (x))/(delta J (y))=i G_M (x,y).
    $

    Apply the functional chain rule to the second relation and prove
    @eq:effective-action-inverse-propagator-identity, including its factor of
    $i$.

  + Differentiate the inverse relation once more and use it to derive

    $
      G_(M,c)^((3)) (x_1,x_2,x_3)
      = integral product_(r=1)^3 dd(y_r, [4])
      product_(r=1)^3 G_M (x_r,y_r)
      i Gamma_M^((3)) (y_1,y_2,y_3).
    $

    Differentiate again and prove @eq:connected-four-point-from-proper-vertices,
    with the 1PR kernel written explicitly as

    $
      cal(R)_(M,"1PR")^((4)) (y_1,y_2,y_3,y_4) & = sum_(((i,j),(k,l)) in cal(P)_4^((2)))
                                                 integral dd(u, [4]) dd(v, [4]) \
                                               & quad (i Gamma_M^((3)) (y_i,y_j,u)) G_M (u,v)
                                                 (i Gamma_M^((3)) (v,y_k,y_l)).
    $

    Check that every internal line displayed here is a bridge and that the
    expression vanishes in the $phi arrow.r -phi$ symmetric vacuum.

  + Repeat the differentiation for arbitrary $n$.  Show that it generates trees
    with vertices $i Gamma_M^((r))$ and full-propagator edges $G_M$.  Explain
    why the full propagator absorbs two-point insertions, leaving $r>=3$ at a
    stationary vacuum.

  + Cut every bridge of a connected amputated perturbative graph.  Its unique
    maximal bridge-free components form a tree when contracted to points.
    Induct on the number of components to show that every 1PR graph is generated
    by a tree with at least two proper vertices, while a bridge-free graph stays
    in the single-vertex remainder $Gamma_M^((n))$.  Conclude that, for $n>=3$,
    its derivatives generate exactly the amputated 1PI vertices.  Treat $n=2$
    separately using @eq:effective-action-inverse-propagator-identity.
]
