#import "lib.typ":*



#show: mybook.with(
   title: [
    Introduction to Statistical Mechanics
  ],
  authors: [Rotor],
  date: datetime.today().display(),
  cover-image: "fig/cover1.png",
  mycolors: (titlergb:rgb("#70dbe9"), headingcolor: rgb("#3692dd"),refcolor:rgb("#eb1515")),
)

#include "content/ch1.typ"

// 附录
#show: appendix


