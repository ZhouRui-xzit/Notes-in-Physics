#import "@preview/cetz:0.5.2" as cetz
#import "../../Cetz-Feynamn/lib.typ": feynman

// Book conventions layered on the local library, without changing its presets.
#let two-point(kind: "free", count: 1) = cetz.canvas(length: 8mm, {
  import cetz.draw: line
  let centers = if kind == "chain" { range(count).map(i => 0.85 + 1.3 * i) } else { (1.0,) }
  let end = if kind == "chain" { centers.last() + 0.85 } else { 2.0 }
  let vertices = ((id: "in", role: "incoming", at: (0, 0)),)
  let edges = ()
  let previous = "in"
  if kind != "free" {
    for (i, x) in centers.enumerate() {
      let id = "v" + str(i)
      vertices.push((id: id, at: (x, 0),
        marker: if kind == "ct" { "cross" } else { "blob" },
        size: if kind == "ct" { 0.15 } else { 0.34 },
        fill: if ("self", "chain").contains(kind) { rgb("#d0d0d0") } else { white },
        stroke: 0.8pt + black,
        label: if ("self", "chain", "loop").contains(kind) { text(size: 7pt)[1PI] } else { none },
        label-offset: (0, 0)))
      edges.push((previous, id, (style: (line: "solid"))))
      previous = id
    }
  }
  vertices.push((id: "out", role: "outgoing", at: (end, 0)))
  edges.push((previous, "out", (style: (line: "solid"))))
  feynman(vertices: vertices, edges: edges)
  if kind == "full" {
    // Parallel chords clipped analytically to the circular boundary.
    for j in range(-3, 4) {
      let offset = j * 0.085
      let half = calc.sqrt(0.34 * 0.34 - offset * offset)
      let s = calc.sqrt(2)
      line((1 + (offset - half) / s, (-offset - half) / s),
        (1 + (offset + half) / s, (-offset + half) / s), stroke: 0.45pt)
    }
  }
})

#let self-energy-parts() = grid(
  columns: (auto, auto, auto, auto, auto), align: center + horizon,
  column-gutter: 12pt, row-gutter: 7pt,
  two-point(kind: "self"), $=$, two-point(kind: "loop"), $+$, two-point(kind: "ct"),
  $-i Pi_R$, [], $-i Pi_"loop"$, [], $-i [delta Z p^2+delta m^2]$,
)

#let two-point-legend() = grid(
  columns: (1fr, 1fr, 1fr, 1fr), align: center + horizon,
  column-gutter: 10pt, row-gutter: 9pt,
  two-point(), two-point(kind: "full"), two-point(kind: "self"), two-point(kind: "ct"),
  [自由传播子], [完整传播子], [自能插入], [二点反项],
  $G_0 (p)$, $G_R (p)$, $-i Pi_R (p^2)$, $-i [delta Z p^2+delta m^2]$,
)

#let dyson-diagrams() = grid(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
  align: center + horizon, column-gutter: 6pt,
  two-point(kind: "full"), $=$, two-point(), $+$,
  two-point(kind: "chain", count: 1), $+$,
  two-point(kind: "chain", count: 2), $+$, $dots$,
)
