#import "../lib.typ": *

// Shared exercise environments remain in lib.typ / some_let.typ.
#let qft-problems(title: "QFT Problems", author: "Rotor", body) = {
  let ink = rgb("#26363f")
  let teal = rgb("#317782")
  let accent = rgb("#cf6b88")
  let lecture = json("lecture-refs.json")
  set document(title: title, author: author)
  set page(paper: "a4", margin: (x: 46pt, top: 52pt, bottom: 48pt),
    numbering: "1", header: context [
      #text(size: 8pt, fill: teal)[QFT Problems]
      #h(1fr)
      #text(size: 8pt, fill: teal)[#hydra(1)]
      #v(3pt)
      #line(length: 100%, stroke: 0.5pt + teal.lighten(55%))
    ], footer: context align(center, text(size: 9pt, fill: teal, counter(page).display())))
  set text(font: body-font, size: 11pt, lang: "zh", fill: ink)
  set par(justify: true, leading: 0.75em, first-line-indent: 0pt)
  show strong: set text(weight: "bold")
  show emph: text.with(font: emphasis-font, style: "normal")
  show math.equation: set text(font: math-font)
  set math.mat(row-gap: 0.85em, column-gap: 0.9em)
  show: show-colored-theorems
  set heading(numbering: "1.")
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    block(above: 6pt, below: 16pt, breakable: false)[
      #text(size: 22pt, weight: "bold", fill: teal)[
        #if it.numbering != none { context counter(heading).display(it.numbering) } #it.body
      ]
      #v(5pt)
      #line(length: 100%, stroke: 0.8pt + teal)
    ]
  }
  set math.equation(numbering: n => numbering("(1.1)", counter(heading).get().first(), n),
    supplement: [式])
  set figure(numbering: n => numbering("(1.1)", counter(heading).get().first(), n))
  show figure.where(kind: image): set figure(supplement: [图])
  show ref: it => context {
    if query(it.target).len() > 0 {
      text(fill: accent, it)
    } else {
      let key = str(it.target)
      assert(key in lecture, message: "Missing lecture reference: " + key + "; run problems/build.py")
      let entry = lecture.at(key)
      link("../main.pdf#page=" + str(entry.page),
        text(fill: teal)[讲义#entry.kind (#entry.number)])
    }
  }
  // A compact title page leaves the exercises themselves uncluttered.
  {
    set page(header: none, footer: none, numbering: none)
    v(48mm)
    text(size: 36pt, weight: "bold", fill: teal, title)
    v(7pt)
    text(size: 17pt, fill: ink)[量子场论习题与解答]
    v(12pt)
    line(length: 70%, stroke: 1.2pt + accent)
    v(14pt)
    text(size: 11pt)[#author]
    v(1fr)
    text(size: 10pt, fill: teal)[
      习题按原讲义章号编排，已有解答紧随题目.

      “讲义式”指向配套讲义中的公式；其余引用指向本册.
    ]
    pagebreak()
  }
  counter(page).update(1)
  outline(title: [目录], depth: 1)
  pagebreak()
  body
}
