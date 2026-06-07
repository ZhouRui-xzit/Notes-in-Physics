// #import "@preview/i-figured:0.2.4"
#import "@preview/hydra:0.5.2": *
#import "@preview/lemmify:0.1.6": *
#import "@preview/physica:0.9.4": *
#import "@preview/mitex:0.2.5": *
#import "@preview/equate:0.2.1": equate
#import "@preview/muchpdf:0.1.0": *
#import "@preview/quick-maths:0.2.0": shorthands
#import "@preview/ctheorems:1.1.3": *

#import "@preview/cetz:0.3.2"
#import "@preview/cetz-plot:0.1.1"
#import "@preview/fletcher:0.5.4": *
#import "@preview/slashion:0.1.1": slash-frac as sfrac
#import "@preview/tblr:0.3.1": *
#import "@preview/wicked:0.1.0": wick

#let mybook(
  title: [],
  authors: [],
  date: [],
  cover-image: "",
  mycolors:(),
  doc,  
) = {
   


// title page
  set page(paper: "a4", margin: 0pt)
  image(cover-image, width: 100%, height: 55%)
  v(-13pt)
  rect(width: 100%, height: 30pt, fill: mycolors.titlergb)
  v(-10em)

  set align(horizon)
  text(25pt, font: ("Arial", "FZHei-B01"),fill: mycolors.headingcolor)[#h(40pt) *#title*]
  v(10pt)
  text(font: ("Arial", "FZShuSong-Z01"),size: 20pt)[#h(50pt) Data:#date]
  v(0pt)

  text(font: ("Arial", "FZShuSong-Z01"),size: 20pt)[#h(50pt) Author:#authors]
 // title page

  set align(left + top)
  set page(paper: "a4", margin: (x:40pt, y:40pt))
  // title page
  set text(font: ("Arial", "FZShuSong-Z01"), size: 12pt)

  show strong: text.with(font: ("Arial","FZHei-B01"), size: 12pt)

  show emph: text.with(font: ("Arial", "FZKai-Z03"), size: 12pt)
  show math.equation: set text(font: "Latin Modern Math", size: 12pt)
  

    

    // outline
    show outline: it => {
      show heading: set align(center)
      set text(size: 16pt,fill: blue)
      it
    }

    show outline.entry.where(
      level: 1
    ): it => {
      v(12pt, weak: true)

      text(size: 12pt,fill: mycolors.headingcolor, strong(it))
    }

    show outline.entry.where(
      level: 2
    ): it => {
      text(size: 12pt,fill: mycolors.headingcolor, it)
    }

    show outline.entry.where(
      level: 3
    ): it => {
      text(size: 12pt,fill: mycolors.headingcolor, it)
    }
    // outline

    
// heading 

    set heading(numbering: "1.1.")
    set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
    show heading: it =>  {
    it
    par()[#text(size:0.5em)[#h(0.0em)]]
    }
    show figure: it =>  {
        it
        par()[#text(size:0.5em)[#h(0.0em)]]
    }

    show heading.where(level: 1): it => pagebreak(weak: true) + it
    show heading.where(level: 1): it => {
      align(center, text(
        size: 18pt,               // 字体大小
        fill: mycolors.headingcolor,               // 字体颜色
        weight: "bold",           // 加粗
        it
      ))
    }

    // 自定义二级标题样式
    show heading.where(level: 2): it => {
      text(
        size: 16pt,               // 字体大小
        fill: mycolors.headingcolor,               // 字体颜色
        it
      )
    }

    // 自定义三级标题样式
    show heading.where(level: 3): it => {
      text(
        size: 14pt,               // 字体大小
        fill: mycolors.headingcolor,               // 字体颜色
        it
      )
    }
// heading 

// ref
  set figure(numbering: (..nums) => {
  let section = counter(heading).get().first()
  numbering("(1.1)", section, ..nums)
  })


  set math.equation(numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(1.1)", section, ..nums)
  })


  set math.equation(supplement: [式])
  show figure.where(
    kind: table
  ): set figure(supplement: [表])

  show figure.where(
    kind: image
  ): set figure(supplement: [图])

  show link: text.with(fill: mycolors.refcolor)
  show ref: it =>{text(it,mycolors.refcolor)}
  show: thmrules
//ref 


// MainPage
    set page(paper: "a4", margin: (x:40pt, y:60pt), numbering: "1", header: context {
      align(right,  text(size: 13pt,fill: mycolors.headingcolor,hydra(2)))
      v(-10pt)
      line(length: 100%, stroke: black) 
    }, footer: [
        #align(center,context {counter(page).display("1")})
        #line(length: 100%, stroke: black) 
      ])
    
    show footnote.entry: set text(fill:rgb("#f11809"))
        outline(indent: auto, title:"Table of Contents")
    pagebreak()
    counter(page).update(1)
// Mainpage 
  doc

}



// thm



#let thm = thmbox("theorem", "Theorem", 
fill: rgb("#e6d2b8"),inset: (x: 1.2em, top: 1em, bottom: 1em),
base_level: 1, supplement:"定理").with(numbering: "1.1")

#let def = thmbox("def", "Definition", 
fill:cmyk(30.61%, 1.22%, 0%, 3.92%),
inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,
supplement:"定义").with(numbering: "1.1")

#let exm = thmbox("exm", "Example", 
fill:rgb("#afdbb8"),
inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,
supplement:"例子").with(numbering: "1.1")

#let prop = thmbox("Proposition", "Proposition", 
fill:color.hsv(196.19deg, 84.75%, 87.45%, 56.8%),inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,supplement:"命题").with(numbering: "1.1")

#let axm = thmbox("axiom", "Axiom", fill:rgb("#f3dfc5"),inset: (x: 1.2em, top: 1em, bottom: 1em),base_level: 1,supplement:"公理").with(numbering: "1.1")



#let proof = thmplain(
"proof",
"Proof",
bodyfmt: body => [
#body #h(1fr) $qed$ // float a QED symbol to the right
]
).with(numbering: none)


#let remark = thmplain(
"remark",
"Remark",
bodyfmt: body => [
#body #h(1fr) $qed$ // float a QED symbol to the right
]
).with(numbering: none)
// thm

#let appendix(body) = {
  set heading(numbering: "A.1.", supplement: [Appendix])
  set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
  show heading: it =>  {
    it
    par()[#text(size:0.5em)[#h(0.0em)]]
  }
  show figure: it =>  {
      it
      par()[#text(size:0.5em)[#h(0.0em)]]
  }

    set figure(numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(A.1)", section, ..nums)
    })


    set math.equation(numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(A.1)", section, ..nums)
    })
  counter(heading).update(0)
  body
}


#let scr(it) = {
  show math.equation: set text(font: "New Computer Modern Math", size: 12pt)
  text(
  features: ("ss01",),
  box($cal(it)$),
)}
    

#let feynman(body) = math.cancel(angle: 15deg, body)


