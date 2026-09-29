#import "@preview/cetz:0.5.2" as cetz
#import "../../Cetz-Feynamn/lib.typ": feynman

#let channel(labels) = cetz.canvas(length: 8mm, {
  let points = ((0, 0.8), (0, -0.8), (3.8, 0.8), (3.8, -0.8))
  let vertices = range(4).map(i => (
    id: "e" + str(i), role: "incoming", at: points.at(i),
    label: text(size: 8pt, labels.at(i)),
    label-offset: (if i < 2 { -0.25 } else { 0.25 }, 0),
  ))
  vertices.push((id: "a", at: (1, 0), marker: "dot"))
  vertices.push((id: "b", at: (2.8, 0), marker: "dot"))
  feynman(
    ("e0", "a", (particle: "scalar")),
    ("e1", "a", (particle: "scalar")),
    ("b", "e2", (particle: "scalar")),
    ("b", "e3", (particle: "scalar")),
    ("a", "b", (particle: "scalar", route: (side: "above", level: 1))),
    ("a", "b", (particle: "scalar", route: (side: "below", level: 1))),
    vertices: vertices,
  )
})

#let fish-channels() = grid(
  columns: (1fr, 1fr, 1fr), align: center + horizon,
  column-gutter: 16pt, row-gutter: 7pt,
  channel(($k_1$, $k_2$, $k_3$, $k_4$)),
  channel(($k_1$, $k_3$, $k_2$, $k_4$)),
  channel(($k_1$, $k_4$, $k_2$, $k_3$)),
  [$s$ 通道], [$t$ 通道], [$u$ 通道],
)
