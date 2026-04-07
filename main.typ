#import "lib.typ":*

#let mycolors = (
  coverrgb: rgb("#131414"),      
  titlergb: rgb("#15181d"),      
  headingcolor: rgb("#2d2f30"),  // 深青色
  refcolor: rgb("#f53607")       // 蓝灰色
)

#show: mybook.with(
   title: [
    Spacetime, Gravity and Black Holes
  ],
  authors: [Rotor],
  version: [0.1.0],
  date: datetime.today().display(),
  cover-image: "fig/cover.png",
  mycolors: mycolors,
)

#include "content/intro.typ"
#part(1, "Spacetime", mycolors)
#include "content/part1/ch1.typ"
#include "content/part1/ch2.typ"


#part(2, "Einstein's Gravity", mycolors)
#include "content/part2/ch5.typ"

#part(3, "Black Holes", mycolors)
#include "content/part3/ch9.typ"

#part(4, "Black Holes Thermodynamics", mycolors)
#include "content/part4/ch17.typ"


// 附录
#show: appendix






