#import "lib.typ":*

#let mycolors = (
  coverrgb: rgb("#283e46"),      
  titlergb: rgb("#6894de"),      
  headingcolor: rgb("#4ea8ba"),  // 深青色
  refcolor: rgb("#6983a8")       // 蓝灰色
)

#show: mybook.with(
   title: [
    Quantum Field Theory Notes
  ],
  authors: [Rotor],
  version: [0.1.0],
  date: datetime.today().display(),
  cover-image: "fig/cover.png",
  mycolors: mycolors,
)

#include "content/intro.typ"
#part(1, "Basis", mycolors)
#include "content/part1/ch0.typ"
#include "content/part1/ch1.typ"
#include "content/part1/ch2.typ"
#include "content/part1/ch3.typ"
#include "content/part1/ch4.typ"
#include "content/part1/ch5.typ"
#include "content/part1/ch6.typ"
#include "content/part1/ch7.typ"


#part(2, "Temperature Field Theory", mycolors)
#include "content/part2/ch8.typ"




// 附录
#show: appendix






