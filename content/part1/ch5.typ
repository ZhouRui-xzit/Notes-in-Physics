#import "../../lib.typ": *

= $phi^4$ Theory at Zero Temperature

Chapter 4 isolated the exact one-particle pole, related its residue to LSZ
external factors, and translated the reduction formula into momentum-space
Feynman rules.  We now apply that framework to the massive real scalar theory
with an unbroken $phi arrow.r -phi$ symmetry.  The aim is not merely to remove
infinities.  We want a calculation in which the parameters appearing in the
Lagrangian can be related systematically to the pole mass, the pole residue,
and the four-particle scattering amplitude.

The main line of this chapter uses dimensional regularization and the
$overline(upright("MS"))$ subtraction scheme.  The renormalized mass
$m (mu)$ and coupling $lambda (mu)$ will therefore be running parameters, not
definitions of particular physical measurements.  We first calculate the
1PI two-point function through $O(lambda^2)$.  Its zero determines the
physical pole mass, while its slope determines the LSZ residue $Z_phi$.
Only after these one-particle data are fixed do we turn to the four-point
function and the running coupling.

This ordering is especially instructive in $phi^4$ theory.  The one-loop
tadpole shifts the mass but is independent of the external momentum, so the
first nontrivial correction to $Z_phi$ occurs at two loops.  The one-loop
four-point graphs, by contrast, already renormalize $lambda$.  The resulting
scale dependence will lead directly to the renormalization-group equation and
the beta function in the final sections.  On-shell subtraction will be treated
separately in an exercise, where its finite counterterms can be compared with
the $overline(upright("MS"))$ results obtained here.

== Dimensional Regularization and $overline(upright("MS"))$ Feynman Rules

The general rules of Section 4.7 do not specify a regulator or a subtraction
scheme.  We now specialize them.  Dimensional regularization preserves
translation and Lorentz invariance and treats all loop momenta uniformly;
$overline(upright("MS"))$ then removes the ultraviolet pole terms without
choosing additional finite subtractions.  This combination separates the
universal ultraviolet bookkeeping from the later extraction of physical pole
and scattering data.

=== The dimensionally regulated bare theory

Continue the number of spacetime dimensions from four to

$
  d=4-2 epsilon,
  quad epsilon>0,
$ <eq:chapter-five-dimension-convention>

and begin with the regulated bare Minkowski Lagrangian

$
  cal(L)_0
  =-1/2 tensor(partial,+mu) phi_0 tensor(partial,-mu) phi_0
   -1/2 m_0^2 phi_0^2
   -lambda_0/(4!) phi_0^4.
$ <eq:chapter-five-bare-phi-four-lagrangian>

The metric remains mostly plus, so a massive pole lies at $p^2=-m^2$, and
the Fourier convention remains the one used in Chapter 2.  Every loop
integral is analytically continued to $d$ dimensions with the same Feynman
$i 0$ prescription as in Chapter 4.

The action is dimensionless in natural units.  If square brackets denote mass
dimension, then

$
  [phi_0]=(d-2)/2=1-epsilon,
  quad
  [m_0]=1,
  quad
  [lambda_0]=4-d=2 epsilon.
$ <eq:chapter-five-bare-mass-dimensions>

The bare quartic coupling is therefore dimensionful away from four
dimensions.  Introduce an arbitrary mass scale $mu$ so that the renormalized
coupling used in perturbation theory can remain dimensionless.  The scale is
not a new physical parameter: exact observables cannot depend on it because
the bare theory does not.

=== Renormalized variables and counterterms

Define a renormalized field $phi$, mass $m$, and coupling $lambda$ by

$
  phi_0&=sqrt(Z_"ct") phi, \
  Z_"ct" m_0^2&=m^2+delta m^2, \
  Z_"ct"^2 lambda_0
    &=mu^(2 epsilon) (lambda+delta lambda), \
  delta Z&:=Z_"ct"-1.
$ <eq:chapter-five-bare-renormalized-relations>

All quantities on the right-hand side depend on $mu$ except the bare
combinations on the left.  This parametrization has been chosen so that the
Lagrangian splits directly into a canonical renormalized part and a local
counterterm part,

$
  cal(L)_0=cal(L)_"ren"+cal(L)_"ct",
$ <eq:chapter-five-lagrangian-splitting>

where

$
  cal(L)_"ren"
  &=-1/2 tensor(partial,+mu) phi tensor(partial,-mu) phi
    -1/2 m^2 phi^2
    -(mu^(2 epsilon) lambda)/(4!) phi^4, \
  cal(L)_"ct"
  &=-1/2 delta Z
       tensor(partial,+mu) phi tensor(partial,-mu) phi
    -1/2 delta m^2 phi^2
    -(mu^(2 epsilon) delta lambda)/(4!) phi^4.
$ <eq:chapter-five-renormalized-and-counterterm-lagrangians>

The three counterterms have distinct jobs.  The mass counterterm cancels the
momentum-independent divergence of the two-point function; the field
counterterm cancels the part proportional to $p^2$; and the coupling
counterterm cancels the local divergence of the four-point function.  Their
coefficients are not additional independent observables.  They are fixed
order by order by the chosen subtraction prescription.

The symbol $Z_"ct"$ in @eq:chapter-five-bare-renormalized-relations must not be
confused with the $Z_phi$ of Chapter 4.  The former relates the regulated bare
field to the chosen renormalized field and removes ultraviolet poles.  The
latter is the residue of the full renormalized propagator at its physical
one-particle pole.  In $overline(upright("MS"))$ the finite normalization of
the field is not adjusted to make this pole residue one, so in general
$Z_"ct" != Z_phi$.

=== Minimal subtraction with the bar

A dimensionally regulated loop integral has a Laurent expansion around
$epsilon=0$.  It is convenient to combine the pole with two constants that
occur universally in the standard integral measure:

$
  1/(overline(epsilon))
  :=1/epsilon-gamma_"E"+ln(4 pi).
$ <eq:chapter-five-epsilon-bar-definition>

Strict MS subtracts only powers of $1/epsilon$.
$overline(upright("MS"))$ subtracts powers of
$1/overline(epsilon)$ instead.  Equivalently, one may absorb
$4 pi e^(-gamma_"E")$ into a redefined scale.  We retain $mu$ and use
@eq:chapter-five-epsilon-bar-definition throughout.

In this scheme the counterterms contain only pole terms:

$
  delta Z
  &=sum_(n=1)^infinity (z_n (lambda))/(overline(epsilon)^n), \
  delta m^2
  &=m^2 sum_(n=1)^infinity (a_n (lambda))/(overline(epsilon)^n), \
  delta lambda
  &=sum_(n=1)^infinity (b_n (lambda))/(overline(epsilon)^n).
$ <eq:chapter-five-msbar-counterterm-structure>

No additional finite part is placed in $delta Z$, $delta m^2$, or
$delta lambda$.  The finite terms left by the loop integrals therefore remain
explicit in renormalized Green functions.  They contain logarithms such as
$ln(m^2/mu^2)$ or $ln((-P^2-i 0)/mu^2)$ and make the scale dependence of the
renormalized parameters visible.

The first possible orders anticipated by the graph topology are

$
  delta m^2=O(lambda),
  quad
  delta lambda=O(lambda^2),
  quad
  delta Z=O(lambda^2).
$ <eq:chapter-five-counterterm-leading-orders>

The last statement is special to $phi^4$ theory: the one-loop two-point graph
is a momentum-independent tadpole.  Sections 5.2 and 5.3 will derive these
orders rather than assume them.

=== Momentum-space rules

Perturbation theory is now built from $cal(L)_"ren"$, while
$cal(L)_"ct"$ supplies additional vertices.  With all vertex momenta taken
incoming as in Section 4.7, the required rules are

$
  "internal scalar line:"&quad
    (-i)/(p^2+m^2-i 0), \
  "ordinary four-point vertex:"&quad
    -i mu^(2 epsilon) lambda, \
  "two-point counterterm vertex:"&quad
    -i [delta Z p^2+delta m^2], \
  "four-point counterterm vertex:"&quad
    -i mu^(2 epsilon) delta lambda, \
  "independent loop momentum:"&quad
    integral (dd(ell, [d]))/((2 pi)^d).
$ <eq:chapter-five-msbar-feynman-rules>

The factors $1/2$ and $1/(4!)$ in the Lagrangian have already been removed by
differentiating with respect to the fields, so they do not reappear in the
vertex factors.  Diagrammatic symmetry factors are still included exactly as
in Section 4.7.4.  In particular, counterterm vertices are ordinary local
vertices for combinatorial purposes; their crossed drawing is only a visual
label for their perturbative origin.

The order assigned to a counterterm is the order of its coefficient in
@eq:chapter-five-counterterm-leading-orders.  Consequently, a calculation at
a fixed order in $lambda$ must include both loop graphs made from ordinary
vertices and graphs containing lower-order counterterm insertions.  The latter
cancel subdivergences that have already appeared in lower-order subgraphs.
Adding only a new overall counterterm after evaluating the highest-loop graph
would miss this recursive structure.

External propagators are not part of these rules.  When a renormalized Green
function is converted into a scattering amplitude, LSZ amputates those
propagators and attaches the pole factors determined from the full two-point
function.  Since the $overline(upright("MS"))$ field is not pole normalized,
one must not set $Z_phi=1$ merely because its ultraviolet counterterm has been
subtracted.

=== Why these counterterms suffice

The locality of the counterterms can be read from power counting.  For a
connected $phi^4$ graph with $L$ loops, $I$ internal lines, $V$ quartic
vertices, and $E$ external lines, its superficial ultraviolet degree of
divergence at four dimensions is

$
  omega&=4 L-2 I, \
  4 V&=2 I+E, \
  L&=I-V+1,
$

and therefore

$
  omega=4-E.
$ <eq:chapter-five-phi-four-superficial-degree>

Vacuum graphs have $E=0$ and cancel from normalized correlation functions.
For $E=2$, the divergent local polynomial may contain a constant and a term
proportional to $p^2$; these are removed by $delta m^2$ and $delta Z$.
For $E=4$, only a momentum-independent logarithmic divergence remains, and it
is removed by $delta lambda$.  Graphs with $E>=6$ are superficially convergent
and require no new local interaction.  They may still contain divergent
two- or four-point subgraphs, but those are canceled by the same counterterms
inserted recursively.

This is the perturbative content of renormalizability for the present theory:
all ultraviolet divergences can be absorbed into the three structures already
present in @eq:chapter-five-renormalized-and-counterterm-lagrangians.  No
$phi^6$ or higher-derivative coupling is needed to renormalize ordinary
$phi^4$ theory order by order.

=== Pole quantities in an $overline(upright("MS"))$ calculation

After the pole terms have been subtracted, define the finite renormalized
self-energy in the convention of Section 4.3 by

$
  Gamma_R^((2)) (p;mu)
  :=-[p^2+m^2 (mu)+Pi_R (p^2;mu)].
$ <eq:chapter-five-renormalized-self-energy-definition>

The corresponding full renormalized propagator is

$
  G_R (p;mu)
  =(-i)/(p^2+m^2 (mu)+Pi_R (p^2;mu)-i 0).
$ <eq:chapter-five-renormalized-full-propagator>

Minimal subtraction has made this expression finite, but it has not selected
its pole or normalized its residue.  Those are extracted afterward.  The
physical mass satisfies

$
  m_"phys"^2
  =m^2 (mu)+Pi_R (-m_"phys"^2;mu),
$ <eq:chapter-five-msbar-pole-mass-equation>

and the LSZ residue of the $overline(upright("MS"))$ field is

$
  Z_phi^(-1)
  =1+Pi_R' (-m_"phys"^2;mu).
$ <eq:chapter-five-msbar-pole-residue>

The pole position is independent of the arbitrary scale when all orders are
included.  The residue depends on the normalization of the interpolating
field; its scale dependence cancels the corresponding field dependence of the
amputated kernel in an S-matrix element.  At finite perturbative order, any
remaining $mu$ dependence is of higher order and provides a useful estimate
of uncalculated corrections.

An on-shell scheme would instead choose finite parts of the counterterms so
that $m=m_"phys"$ and the renormalized propagator has unit residue.  We do not
make those subtractions in the main calculation.  A later exercise will derive
them from the same unrenormalized self-energy and exhibit the finite conversion
between on-shell and $overline(upright("MS"))$ parameters.

The next two sections calculate $Pi_R$ through $O(lambda^2)$: the one-loop
tadpole first fixes the leading mass dependence, and the two-loop momentum
dependence then supplies the first correction to $Z_phi$.

== The One-Loop Self-Energy

== The Two-Loop Self-Energy

== The Four-Point Function

== The Renormalization Group Equation

== The Beta Function of $phi^4$
