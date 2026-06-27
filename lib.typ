// #import "@preview/i-figured:0.2.4"
#import "@preview/hydra:0.6.3": *

#import "@preview/physica:0.9.8": *


#import "@preview/theorion:0.6.0" as theorion
#import "@preview/theorion:0.6.0": show-theorion, set-theorion-numbering, set-inherited-levels, set-indent-mode, make-frame

#import "@preview/cetz:0.5.2"

#import "@preview/fletcher:0.5.8": *

#import "@preview/lilaq:0.6.0" as lq

// Screen-first Noto font configuration.
#let latin-font = "Noto Sans"
#let cjk-font = "Noto Sans SC"
#let cjk-emph-font = "LXGW WenKai"
#let math-font = "Noto Sans Math"

#let mybook(
  title: [],
  authors: [],
  date: [],
  cover-image: "",
  mycolors:(),
  doc,  
) = {
   


// title page
  set page(paper: "a4", margin: 0pt, numbering: none, header: none, footer: none)

  image(cover-image, width: 100%, height: 100%, fit: "cover")

  place(
    top + left,
    rect(
      width: 100%,
      height: 100%,
      fill: gradient.linear(
        (mycolors.titlergb.darken(35%).transparentize(35%), 0%),
        (mycolors.titlergb.transparentize(72%), 42%),
        (white.transparentize(6%), 100%),
        angle: 90deg,
      ),
    ),
  )

  place(
    center + horizon,
    dy: 105pt,
    block(
      width: 80%,
      align(center)[
        #box(
          fill: white.transparentize(16%),
          inset: (x: 24pt, y: 20pt),
          radius: 8pt,
          stroke: (paint: mycolors.titlergb.lighten(30%), thickness: 0.9pt),
          [
            #text(
              size: 24pt,
              weight: "bold",
              font: (latin-font, cjk-font),
              fill: mycolors.headingcolor,
            )[#title]

            #v(10pt)
            #line(length: 100%, stroke: (thickness: 1.6pt, paint: mycolors.titlergb))
            #v(14pt)

            #grid(
              columns: (auto, 1fr),
              column-gutter: 1.6em,
              row-gutter: 0.65em,
              align: (center, left),

              text(size: 14pt, weight: "bold", fill: mycolors.headingcolor)[Author:],
              text(size: 14pt, fill: mycolors.headingcolor)[#authors],

              text(size: 14pt, weight: "bold", fill: mycolors.headingcolor)[Date:],
              text(size: 14pt, fill: mycolors.headingcolor)[#date],
            )
          ],
        )
      ],
    ),
  )

  place(
    bottom + center,
    dy: -30pt,
    text(size: 10pt, fill: mycolors.headingcolor.lighten(18%))[
      Statistical Mechanics Notes
    ],
  )

  pagebreak()
 // title page

  set align(left + top)
  set page(paper: "a4", margin: (x:40pt, y:40pt))
  // title page
  set text(font: (latin-font, cjk-font), size: 12pt, weight: 400, lang: "zh")

  // Emphasis avoids forced italic for Chinese and uses Kai-style fallback.
  show emph: it => text(
    font: (latin-font, cjk-emph-font),
    style: "normal",
    weight: 400,
    it.body,
  )
  show math.equation: set text(font: math-font, size: 12pt)
  

    

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
  set-inherited-levels(1)
  set-theorion-numbering("1.1")
  set-indent-mode(auto)
  show: show-theorion
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



// theorem environments
#let theorem-box-render(
  fill: white,
  border: black,
  title-fill: auto,
  prefix: none,
  title: "",
  full-title: auto,
  body,
) = block(
  width: 100%,
  breakable: true,
  fill: fill,
  stroke: 0.8pt + border,
  radius: 3pt,
  inset: (x: 1em, y: .8em),
)[
  #let heading-fill = if title-fill == auto { border } else { title-fill }
  #text(fill: heading-fill, weight: "bold")[#full-title.]
  #sym.space
  #emph(body)
]

#let (thm-counter, thm-box, thm, show-thm) = make-frame(
  "theorem",
  [定理],
  inherited-levels: 1,
  render: theorem-box-render.with(fill: rgb("#fff3dc"), border: rgb("#c27419")),
)
#let theorem = thm

#let (prop-counter, prop-box, prop, show-prop) = make-frame(
  "proposition",
  [命题],
  counter: thm-counter,
  render: theorem-box-render.with(fill: rgb("#e9f5ff"), border: rgb("#2678b8")),
)
#let proposition = prop

#let (exm-counter, exm-box, exm, show-exm) = make-frame(
  "example",
  [例],
  counter: thm-counter,
  render: theorem-box-render.with(fill: rgb("#ecf8ed"), border: rgb("#37905b")),
)
#let example = exm

#let (exercise-counter, exercise-box, exercise, show-exercise-box) = make-frame(
  "exercise",
  [习题],
  counter: thm-counter,
  render: theorem-box-render.with(fill: rgb("#f4edff"), border: rgb("#7c54bd")),
)

#let (definition-counter, def-box, def, show-def) = make-frame(
  "definition",
  [定义],
  counter: thm-counter,
  render: theorem-box-render.with(fill: rgb("#eef2f5"), border: rgb("#6b7785")),
)
#let definition = def

#let (axiom-counter, axm-box, axm, show-axm) = make-frame(
  "axiom",
  [公理],
  counter: thm-counter,
  render: theorem-box-render.with(fill: rgb("#fff1f1"), border: rgb("#c24f4f")),
)
#let axiom = axm

#let remark = theorion.remark-box.with(supplement: [Remark], outlined: false)
#let Remark = remark

#let proof = theorion.proof
#let qedhere = theorion.qedhere
// theorem environments

#let appendix(body) = {
  set heading(numbering: "A.1.", supplement: [Appendix])
  set-theorion-numbering("A.1")
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
    


