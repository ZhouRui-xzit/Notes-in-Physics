#import "@preview/cetz:0.5.2" as cetz
#import "../../Cetz-Feynamn/lib.typ": feynman

#let four-point(kind: "tree") = cetz.canvas(length: 7mm, {
  import cetz.draw: line
  let blob = ("full", "loop", "ct").contains(kind)
  let positions = ((0, 0.7), (0, -0.7), (2, 0.7), (2, -0.7))
  let vertices = range(4).map(i => (
    id: "e" + str(i), role: if i < 2 { "incoming" } else { "outgoing" },
    at: positions.at(i),
  ))
  vertices.push((id: "v", at: (1, 0),
    marker: if blob { "blob" } else if kind == "ct" { "cross" } else { "dot" },
    size: if blob { 0.34 } else if kind == "ct" { 0.15 } else { 0.075 },
    fill: if blob { white } else { black },
    stroke: 0.8pt + black,
    label: if kind == "loop" { text(size: 7pt)[1PI] } else if kind == "ct" { text(size: 12pt)[$times$] } else { none }, label-offset: (0, 0)))
  let edges = range(4).map(i => ("e" + str(i), "v", (style: (line: "solid"))))
  feynman(vertices: vertices, edges: edges)
  if kind == "full" {
    for j in range(-3, 4) {
      let offset = j * 0.085
      let half = calc.sqrt(0.34 * 0.34 - offset * offset)
      let s = calc.sqrt(2)
      line((1 + (offset - half) / s, (-offset - half) / s),
        (1 + (offset + half) / s, (-offset + half) / s), stroke: 0.45pt)
    }
  }
})

#let four-point-panels() = grid(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  column-gutter: 9pt, row-gutter: 9pt, align: center + horizon,
  four-point(kind: "full"), $=$, four-point(), $+$,
  four-point(kind: "loop"), $+$, four-point(kind: "ct"),
  $i Gamma_R^((4))$, [], $-i mu^(2 epsilon) lambda$, [],
  $i Gamma_"loop"^((4))$, [], $-i mu^(2 epsilon) delta lambda$,
)
