#import "lib.typ": *


#show: thmrules
#let thm = thmbox("theorem", "Theorem", 
fill: rgb("#e6d2b8"),inset: (x: 1.2em, top: 1em, bottom: 1em),
base_level: 1, supplement:"定理").with(numbering: "A.1")

#let def = thmbox("def", "Definition", 
fill:cmyk(30.61%, 1.22%, 0%, 3.92%),
inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,
supplement:"定义").with(numbering: "A.1")

#let exm = thmbox("exm", "Example", 
fill:cmyk(17.84%, 0%, 21.58%, 5.49%),
inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,
supplement:"例子").with(numbering: "A.1")

#let prop = thmbox("Proposition", "Proposition", 
fill:color.hsv(196.19deg, 84.75%, 87.45%, 56.8%),inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,supplement:"命题").with(numbering: "A.1")

#let axm = thmbox("axiom", "Axiom", fill:rgb("#f3dfc5"),inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,supplement:"公理").with(numbering: "A.1")



#let proof = thmplain(
"proof",
[*Proof*],
bodyfmt: body => [
#text(emph(body),size: 12pt) #h(1fr) $qed$ // float a QED symbol to the right
]
).with(numbering: none)


#let remark = thmplain(
"remark",
[*Remark*],
bodyfmt: body => [
#text(emph(body),size: 12pt) #h(1fr) $qed$ // float a QED symbol to the right
]
).with(numbering: none)