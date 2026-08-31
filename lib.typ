#import "some_let.typ": *

// ---------------------------------------------------------------------------
// Visual system
// ---------------------------------------------------------------------------

// Keep the original four-color API working, while allowing a richer palette
// to be supplied by main.typ.  All defaults are chosen for good contrast on
// paper and for the cyan / sakura / night-sky colors of the cover artwork.
#let book-palette(colors) = (
  night: colors.at("night", default: rgb("#163b49")),
  deep: colors.at("headingcolor", default: rgb("#317782")),
  cyan: colors.at("titlergb", default: rgb("#36a6b6")),
  sakura: colors.at("refcolor", default: rgb("#d86483")),
  gold: colors.at("gold", default: rgb("#e2b55b")),
  ink: colors.at("ink", default: rgb("#26363f")),
  muted: colors.at("muted", default: rgb("#657b85")),
  paper: colors.at("paper", default: rgb("#fcfefe")),
  panel: colors.at("panel", default: rgb("#edf7f8")),
  cover: colors.at("coverrgb", default: rgb("#173b49")),
)

#let heading-font = ("Noto Sans CJK SC",)

#let body-font = ("Noto Sans CJK SC",)

// LXGW WenKai ships as a regular face.  The emphasis environment uses the
// family itself as the visual contrast instead of synthesizing a slanted CJK
// face.  Noto remains the fallback for glyphs outside WenKai's coverage.
#let emphasis-font = ("LXGW WenKai", "Noto Sans CJK SC")

#let math-font = ("STIX Two Math",)

#let orbit-mark(color, dot-color, size: 92pt) = box(
  width: size,
  height: size,
  [
    #place(center, circle(
      radius: size * 0.42,
      stroke: 0.8pt + color.transparentize(44%),
    ))
    #place(center, rotate(32deg, ellipse(
      width: size * 0.92,
      height: size * 0.34,
      stroke: 0.8pt + color.transparentize(35%),
    )))
    #place(center, circle(
      radius: size * 0.09,
      fill: color.transparentize(20%),
    ))
    #place(top + right, dx: -size * 0.10, dy: size * 0.27, circle(
      radius: size * 0.035,
      fill: dot-color,
    ))
  ],
)

#let running-footer(colors, numbering: "1") = context {
  let p = book-palette(colors)
  align(center)[
    #box(
      fill: p.panel,
      radius: 99pt,
      inset: (x: 9pt, y: 3pt),
      stroke: 0.6pt + p.cyan.transparentize(62%),
    )[
      #text(
        font: heading-font,
        size: 8pt,
        weight: "semibold",
        fill: p.deep,
      )[#counter(page).display(numbering)]
    ]
  ]
}

#let running-header(colors) = context {
  let p = book-palette(colors)
  block(width: 100%)[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      column-gutter: 1em,
      text(
        font: heading-font,
        size: 7.4pt,
        weight: "semibold",
        tracking: 0.13em,
        fill: p.muted,
      )[量子场论 · 手算笔记],
      text(
        font: heading-font,
        size: 8.3pt,
        fill: p.deep,
      )[#hydra(2)],
    )
    #v(4pt)
    #line(
      length: 100%,
      stroke: 0.65pt + p.cyan.transparentize(42%),
    )
  ]
}

#let chapter-heading(it, colors) = {
  let p = book-palette(colors)
  pagebreak(weak: true)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)

  context {
    let number = counter(heading).display(it.numbering)
    let kicker = if it.supplement == [Appendix] {
      [附录 · 参考资料]
    } else {
      [量子场论 · 核心章节]
    }
    block(
      width: 100%,
      breakable: false,
      above: 4pt,
      below: 22pt,
      [
        #grid(
          columns: (auto, 1fr),
          column-gutter: 13pt,
          align: (left + top, left + top),
          box(
            fill: p.night,
            radius: 6pt,
            inset: (x: 10pt, y: 7pt),
            stroke: 0.8pt + p.cyan.transparentize(20%),
            text(
              font: heading-font,
              size: 17pt,
              weight: "bold",
              fill: white,
            )[#number],
          ),
          [
            #set par(justify: false, first-line-indent: 0pt)
            #text(
              font: heading-font,
              size: 7.5pt,
              weight: "semibold",
              tracking: 0.18em,
              fill: p.sakura,
            )[#kicker]
            #v(2pt)
            #text(
              font: heading-font,
              size: 24pt,
              weight: "bold",
              fill: p.ink,
              hyphenate: false,
            )[#it.body]
          ],
        )
        #v(8pt)
        #grid(
          columns: (34pt, 1fr, 7pt),
          align: horizon,
          line(length: 100%, stroke: 2pt + p.sakura),
          line(length: 100%, stroke: 0.7pt + p.cyan.transparentize(35%)),
          circle(radius: 3.2pt, fill: p.gold),
        )
      ],
    )
  }
}

#let section-heading(it, colors) = {
  let p = book-palette(colors)
  counter(math.equation).update(0)
  context {
    let number = counter(heading).display(it.numbering)
    block(
      width: 100%,
      breakable: false,
      above: 14pt,
      below: 9pt,
      [
        #set par(justify: false, first-line-indent: 0pt)
        #grid(
          columns: (auto, 1fr),
          column-gutter: 8pt,
          align: (left + horizon, left + horizon),
          box(
            fill: p.panel,
            radius: 4pt,
            inset: (x: 6pt, y: 3pt),
            stroke: 0.6pt + p.cyan.transparentize(45%),
            text(
              font: heading-font,
              size: 15pt,
              weight: "bold",
              fill: p.deep,
            )[#number],
          ),
          text(
            font: heading-font,
            size: 15pt,
            weight: "bold",
            fill: p.deep,
          )[#it.body],
        )
        #v(4pt)
        #line(
          length: 100%,
          stroke: 0.55pt + p.cyan.transparentize(64%),
        )
      ],
    )
  }
}

#let subsection-heading(it, colors) = {
  let p = book-palette(colors)
  context {
    let number = counter(heading).display(it.numbering)
    block(
      width: 100%,
      breakable: false,
      above: 15pt,
      below: 15pt,
      [
        #set par(justify: false, first-line-indent: 0pt)
        #grid(
          columns: (auto, auto, 1fr),
          column-gutter: 6pt,
          align: horizon,
          circle(radius: 2.6pt, fill: p.sakura),
          text(
            font: heading-font,
            size: 12.5pt,
            weight: "semibold",
            fill: p.muted,
          )[#number],
          text(
            font: heading-font,
            size: 12.5pt,
            weight: "semibold",
            fill: p.ink,
          )[#it.body],
        )
      ],
    )
  }
}

#let subsubsection-heading(it, colors) = {
  let p = book-palette(colors)
  context {
    let number = counter(heading).display(it.numbering)
    block(
      width: 100%,
      breakable: false,
      above: 15pt,
      below: 15pt,
      inset: (left: 9pt),
      stroke: (left: 1.3pt + p.gold),
      [
        #set par(justify: false, first-line-indent: 0pt)
        #text(
          font: heading-font,
          size: 11.4pt,
          weight: "semibold",
          fill: p.muted,
        )[#number]
        #h(0.55em)
        #text(
          font: heading-font,
          size: 11.4pt,
          weight: "semibold",
          fill: p.ink,
        )[#it.body]
      ],
    )
  }
}

// ---------------------------------------------------------------------------
// Book template
// ---------------------------------------------------------------------------

#let mybook(
  title: [],
  authors: [],
  version: [],
  date: [],
  cover-image: "",
  mycolors: (),
  doc,
) = {
  let p = book-palette(mycolors)

  // Cover: full-bleed illustration with a restrained information panel and
  // orbit motifs.  The image remains the visual focus.
  set page(
    paper: "a4",
    margin: 0pt,
    numbering: none,
    header: none,
    footer: none,
    fill: p.night,
  )
  place(top + left, image(
    cover-image,
    width: 100%,
    height: 100%,
    fit: "cover",
  ))
  place(top + left, rect(
    width: 100%,
    height: 100%,
    fill: p.night.transparentize(84%),
  ))
  place(top + left, rect(
    width: 100%,
    height: 100%,
    fill: gradient.linear(
      (p.night.transparentize(78%), 0%),
      (p.night.transparentize(90%), 48%),
      (p.night.transparentize(98%), 100%),
      angle: 0deg,
    ),
  ))
  place(bottom + left, dx: 42pt, dy: -252pt, block(
    width: 66%,
    fill: p.paper.transparentize(22%),
    stroke: 0.8pt + p.night.transparentize(68%),
    radius: 10pt,
    inset: (x: 20pt, y: 17pt),
    [
      #text(
        font: heading-font,
        size: 7.5pt,
        weight: "semibold",
        tracking: 0.20em,
        fill: p.sakura,
      )[重在手算的量子场论指南]
      #v(4pt)
      #text(
        font: heading-font,
        size: 28pt,
        weight: "bold",
        fill: p.night,
      )[#title]
      #v(8pt)
      #line(
        length: 100%,
        stroke: 1.1pt + p.cyan,
      )
      #v(8pt)
      #grid(
        columns: (auto, 1fr, auto),
        column-gutter: 9pt,
        align: (left, left, right),
        text(
          font: heading-font,
          size: 8pt,
          weight: "semibold",
          fill: p.muted,
        )[作者],
        text(
          font: heading-font,
          size: 9pt,
          fill: p.ink,
        )[#authors],
        box(
          fill: p.sakura,
          radius: 99pt,
          inset: (x: 8pt, y: 3pt),
          text(
            font: heading-font,
            size: 7.5pt,
            weight: "semibold",
            fill: white,
          )[v#version],
        ),
      )
      #v(4pt)
      #text(
        font: heading-font,
        size: 7.8pt,
        fill: p.muted,
      )[#date · 自然单位制 · $c = hbar = k_B = 1$]
    ],
  ))
  pagebreak(weak: false)

  // Global typography and reusable environments.
  set align(left + top)
  set text(
    font: body-font,
    size: 11.2pt,
    fill: p.ink,
    lang: "zh",
    region: "CN",
  )
  set par(
    justify: true,
    first-line-indent: 2em,
    leading: 0.78em,
  )
  show strong: set text(font: body-font, weight: "bold", fill: p.ink)
  show emph: text.with(
    font: emphasis-font,
    style: "normal",
  )
  show math.equation: set text(font: math-font)
  show math.equation.where(block: true): set text(size: 11.2pt)
  show: show-colored-theorems

  set heading(numbering: "1.1.")
  show heading.where(level: 1): it => {
    if it.numbering == none { [] } else { chapter-heading(it, mycolors) }
  }
  show heading.where(level: 2): it => section-heading(it, mycolors)
  show heading.where(level: 3): it => subsection-heading(it, mycolors)
  show heading.where(level: 4): it => subsubsection-heading(it, mycolors)

  // Equation and figure numbering follow the chapter / section hierarchy.
  set figure(numbering: (..nums) => {
    let chapter = counter(heading).get().first()
    numbering("(1.1)", chapter, ..nums)
  })
  set math.equation(numbering: n => {
    let count = counter(heading).get()
    let chapter = count.first()
    let section = count.at(1, default: 0)
    numbering("(1.1.1)", chapter, section, n)
  })
  set math.equation(supplement: [式])
  set math.mat(row-gap: 0.85em, column-gap: 0.9em)

  show figure.where(kind: table): set figure(supplement: [表])
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure(supplement: [图])

  // One reference rule is easier to reason about than chained show rules.
  show ref: it => {
    if query(it.target).len() == 0 {
      text(
        font: heading-font,
        weight: "semibold",
        fill: p.sakura,
      )[<???>]
    } else {
      text(
        font: body-font,
        weight: "medium",
        fill: p.sakura,
      )[#it]
    }
  }
  show footnote: set text(fill: p.sakura)
  show footnote.entry: it => {
    set text(size: 9pt, fill: p.muted)
    set math.equation(numbering: none)
    show math.equation: set text(size: 9pt, font: math-font)
    it
  }

  // Main page style.  The header uses Hydra's current-heading lookup, while
  // all layout remains native Typst 0.15 content and context code.
  set page(
    paper: "a4",
    fill: p.paper,
    margin: (x: 46pt, top: 58pt, bottom: 52pt),
    numbering: "1",
    header: running-header(mycolors),
    footer: running-footer(mycolors),
  )

  // Contents pages use a quieter page style and only expose two hierarchy
  // levels; the detailed subsubsections remain discoverable in the PDF.
  {
    counter(page).update(1)
    set page(
      margin: (x: 48pt, top: 48pt, bottom: 46pt),
      numbering: "i",
      header: none,
      footer: running-footer(mycolors, numbering: "i"),
    )
    set par(first-line-indent: 0pt)

    show outline: it => {
      show heading: title => block(
        width: 100%,
        below: 18pt,
        [
          #text(
            font: heading-font,
            size: 7.5pt,
            weight: "semibold",
            tracking: 0.20em,
            fill: p.sakura,
          )[全书导览]
          #v(3pt)
          #text(
            font: heading-font,
            size: 25pt,
            weight: "bold",
            fill: p.ink,
          )[#title.body]
          #v(7pt)
          #grid(
            columns: (30pt, 1fr, 6pt),
            align: horizon,
            line(length: 100%, stroke: 2pt + p.sakura),
            line(length: 100%, stroke: 0.7pt + p.cyan.transparentize(45%)),
            circle(radius: 2.8pt, fill: p.gold),
          )
        ],
      )
      it
    }
    show outline.entry.where(level: 1): it => {
      if it.element.numbering == none {
        block(
          width: 100%,
          breakable: false,
          above: 8pt,
          below: 3pt,
          fill: p.panel,
          radius: 5pt,
          inset: (x: 9pt, y: 5pt),
          text(
            font: heading-font,
            size: 10.5pt,
            weight: "bold",
            fill: p.deep,
            it,
          ),
        )
      } else {
        block(
          above: 5pt,
          below: 1pt,
          text(
            font: heading-font,
            size: 9.8pt,
            weight: "semibold",
            fill: p.ink,
            it,
          ),
        )
      }
    }
    show outline.entry.where(level: 2): it => text(
      font: body-font,
      size: 9.2pt,
      fill: p.muted,
      it,
    )

    outline(title: [目录], depth: 2)
    pagebreak(weak: false)
  }

  counter(page).update(1)
  doc
}

// ---------------------------------------------------------------------------
// Divisions
// ---------------------------------------------------------------------------

#let part(number, title, mycolors) = {
  let p = book-palette(mycolors)

  pagebreak(weak: false)

  [
    #set page(
      paper: "a4",
      margin: 0pt,
      numbering: none,
      header: none,
      footer: none,
      fill: p.night,
    )

    #heading(
      level: 1,
      outlined: true,
      bookmarked: true,
      numbering: none,
      [第 #numbering("I", number) 部分：#title],
    )

    #place(top + right, dx: -34pt, dy: 24pt, text(
      font: heading-font,
      size: 138pt,
      weight: "bold",
      fill: white.transparentize(92%),
    )[#numbering("I", number)])
    #place(top + left, dx: 42pt, dy: 42pt, orbit-mark(
      p.cyan,
      p.sakura,
      size: 116pt,
    ))
    #place(left + horizon, dx: 48pt, dy: 8pt, block(
      width: 76%,
      [
        #text(
          font: heading-font,
          size: 8pt,
          weight: "semibold",
          tracking: 0.22em,
          fill: p.gold,
        )[第 #numbering("I", number) 部分 · 理论篇]
        #v(7pt)
        #text(
          font: heading-font,
          size: 32pt,
          weight: "bold",
          fill: white,
        )[#title]
        #v(12pt)
        #grid(
          columns: (42pt, 1fr, 8pt),
          align: horizon,
          line(length: 100%, stroke: 2.4pt + p.sakura),
          line(length: 100%, stroke: 0.8pt + p.cyan.transparentize(24%)),
          circle(radius: 3.6pt, fill: p.gold),
        )
        #v(12pt)
        #text(
          font: math-font,
          size: 12pt,
          fill: white.transparentize(22%),
        )[$cal(L) arrow.r Z arrow.r Gamma arrow.r "observables"$]
      ],
    ))
    #place(bottom + left, dx: 48pt, dy: -42pt, text(
      font: heading-font,
      size: 7.5pt,
      tracking: 0.16em,
      fill: white.transparentize(45%),
    )[QFT FOR CALCULATORS · ROTOR])

    #pagebreak(weak: false)
  ]
}

#let preface(title, body) = {
  pagebreak(weak: true)
  heading(
    level: 1,
    outlined: true,
    bookmarked: true,
    numbering: none,
    title,
  )

  let p = book-palette((:))
  block(
    width: 100%,
    breakable: false,
    above: 5pt,
    below: 22pt,
    [
      #text(
        font: heading-font,
        size: 7.5pt,
        weight: "semibold",
        tracking: 0.18em,
        fill: p.sakura,
      )[写在计算之前]
      #v(3pt)
      #text(
        font: heading-font,
        size: 25pt,
        weight: "bold",
        fill: p.ink,
      )[#title]
      #v(7pt)
      #grid(
        columns: (32pt, 1fr, 7pt),
        align: horizon,
        line(length: 100%, stroke: 2pt + p.sakura),
        line(length: 100%, stroke: 0.7pt + p.cyan.transparentize(45%)),
        circle(radius: 3pt, fill: p.gold),
      )
    ],
  )
  body
}
