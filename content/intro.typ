#import "../lib.typ": preface, hbar
#preface([Preface])[

There is a certain kind of understanding that only comes from doing the calculation yourself.
You can read a derivation, follow every line, nod along --- and still find yourself
completely lost the moment you try to reproduce it on a blank page.
Quantum field theory has more than its share of results like this:
the LSZ formula, the one-loop effective potential, the QCD beta function.
Each of them looks inevitable in retrospect, yet the algebra has a way of collapsing
the moment you are left alone with it.

These notes exist because of that gap.
The goal is not to develop QFT from first principles or to argue for
the deepest conceptual foundations --- that is a different project entirely.
The goal here is more modest and more specific: to become fluent in the
standard models and methods, to the point where the calculations run smoothly
and the intermediate steps no longer feel like obstacles.

The path taken reflects this priority.
We begin with path integrals, the language in which almost everything
that follows is most naturally expressed.
Throughout the book we use natural units, $c = hbar = k_B = 1$, where $k_B$
is Boltzmann's constant.  Masses, energies, momenta, and temperatures are
therefore expressed in compatible units.
Free fields come next --- scalar, Dirac, and gauge --- first at zero temperature,
then within the imaginary-time formalism at finite temperature.
Interactions enter through $phi^3$ theory, chosen precisely because
it is the simplest setting in which real Feynman diagrams appear,
symmetry factors must be counted, and renormalization becomes necessary.
Loops in $phi^3$, then the finite-temperature effective potential in $phi^4$,
before moving on to QED and QCD, where the same machinery meets
physically meaningful theories.
The final part reaches spontaneous symmetry breaking and the electroweak model,
which is where many of the earlier techniques converge.

Readers who want the physical and conceptual architecture behind all of this
should look elsewhere.
The four books that sit closest to these notes are
Peskin and Schroeder's _An Introduction to Quantum Field Theory_,
Srednicki's _Quantum Field Theory_,
Schwartz's _Quantum Field Theory and the Standard Model_,
and Kapusta and Gale's _Finite-Temperature Field Theory_.
Between them they cover far more ground, with far more care,
than these pages ever will.
What these notes offer instead is a record of the calculations done out in full ---
every Feynman parameter introduced, every Matsubara sum evaluated,
every divergence isolated and subtracted ---
so that the standard results become genuinely familiar rather than merely known.

]
