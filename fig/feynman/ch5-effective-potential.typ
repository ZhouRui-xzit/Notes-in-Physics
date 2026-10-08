#import "@preview/cetz:0.5.2" as cetz
#import "../../Cetz-Feynamn/lib.typ": feynman

// Vacuum topologies in the constant-background expansion. The isolated
// vertex denotes V_0; the unmarked circle denotes the Gaussian determinant.
// Two-loop graphs are schematic: coefficients and integrals are not shown.
#let effective-potential-loops() = cetz.canvas(length: 8mm, {
  import cetz.draw: circle, content
  let varphi = math.phi.alt
  let label-at(p, body) = content(p, text(size: 9pt, body))

  label-at((0, 1.25), [零圈：$V_0 (varphi_0)$])
  circle((0, 0), radius: 0.09, fill: black, stroke: none)
  label-at((0, -1.15), [经典势])

  label-at((3.2, 1.25), [一圈：$V_1 (varphi_0)$])
  circle((3.2, 0), radius: 0.65, stroke: 0.9pt)
  label-at((3.2, -1.15), [Gaussian 行列式])

  label-at((8.55, 1.25), [两圈：$V_2 (varphi_0)$])
  feynman(
    ("v", "v", (style: (line: "solid"), loop-size: 0.5, loop-angle: 180deg)),
    ("v", "v", (style: (line: "solid"), loop-size: 0.5, loop-angle: 0deg)),
    vertices: ((id: "v", at: (6.7, 0), marker: "dot"),),
  )
  label-at((6.7, -1.15), [双圈图])
  feynman(
    ("a", "b", (style: (line: "solid"), controls: ((9.6, 1.05), (11.2, 1.05)))),
    ("a", "b", (style: (line: "solid"))),
    ("a", "b", (style: (line: "solid"), controls: ((9.6, -1.05), (11.2, -1.05)))),
    vertices: (
      (id: "a", at: (9.6, 0), marker: "dot"),
      (id: "b", at: (11.2, 0), marker: "dot"),
    ),
  )
  label-at((10.4, -1.15), [sunset 图])
})

// Also allow this file to be compiled directly for a standalone preview.
#set page(width: auto, height: auto, margin: 8pt)
#set text(font: "Noto Sans CJK SC")
#show math.equation: set text(font: "STIX Two Math")
#effective-potential-loops()
