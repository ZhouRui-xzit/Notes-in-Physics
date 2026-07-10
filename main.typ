#import "lib.typ":*

#let mycolors = (
  coverrgb: rgb("#163b49"),
  titlergb: rgb("#36a6b6"),
  headingcolor: rgb("#317782"),
  refcolor: rgb("#d86483"),
  night: rgb("#163b49"),
  gold: rgb("#e2b55b"),
  ink: rgb("#26363f"),
  muted: rgb("#657b85"),
  paper: rgb("#fcfefe"),
  panel: rgb("#edf7f8"),
)

#show: mybook.with(
  title: [QFT for Calculators],
  authors: [Rotor],
  version: [0.1.0],
  date: datetime.today().display(),
  cover-image: "fig/cover.jpg",
  mycolors: mycolors,
)

#include "content/intro.typ"

#part(1, "Free Fields", mycolors)
#include "content/part1/ch1.typ"
#include "content/part1/ch2.typ"
#include "content/part1/ch3.typ"

#part(2, "Interacting Fields", mycolors)
#include "content/part1/ch4.typ"
#include "content/part1/ch5.typ"
#include "content/part1/ch6.typ"

#part(3, "QED", mycolors)
#include "content/part2/ch7.typ"
#include "content/part2/ch8.typ"

#part(4, "QCD", mycolors)
#include "content/part3/ch9.typ"

#part(5, "SSB and Electroweak Theory", mycolors)
#include "content/part4/ch10.typ"
#include "content/part4/ch11.typ"

// Appendices
#show: appendix
#include "content/app/app1.typ"
