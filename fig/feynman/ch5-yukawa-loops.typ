#import "@preview/cetz:0.5.2" as cetz
#import "../../Cetz-Feynamn/lib.typ": feynman

#let diagram(kind) = cetz.canvas(length: 7mm, {
  let vertices = ()
  let edges = ()
  let v(id, at, external: false) = (id: id, at: at,
    role: if external { "incoming" } else { "interaction" },
    marker: if external { "none" } else { "dot" })
  let e(a, b, particle, extra: (:)) = (a, b, (particle: particle) + extra)
  if kind == "bubble" or kind == "self" {
    vertices = (v("i", (0,0), external: true), v("a", (1,0)),
      v("b", (3,0)), v("o", (4,0), external: true))
    let outer = if kind == "bubble" { "scalar" } else { "fermion" }
    edges = (e("i","a",outer), e("b","o",outer),
      e("a","b","fermion", extra: (route: (side: "above", level: 1))),
      if kind == "bubble" {
        e("b","a","fermion", extra: (route: (side: "below", level: 1)))
      } else {
        e("a","b","scalar", extra: (route: (side: "below", level: 1)))
      })
  } else if kind == "vertex" {
    vertices = (v("i",(0,0),external:true), v("a",(1,0)),
      v("b",(2,1.3)), v("c",(3,0)), v("o",(4,0),external:true),
      v("s",(2,2.2),external:true))
    edges = (e("i","a","fermion"),e("a","b","fermion"),
      e("b","c","fermion"),e("c","o","fermion"),
      e("a","c","scalar"),e("b","s","scalar"))
  } else if kind == "fish" {
    vertices = (v("i",(0,1),external:true),v("j",(0,-1),external:true),
      v("a",(1,0)),v("b",(3,0)),v("o",(4,1),external:true),v("p",(4,-1),external:true))
    edges = (e("i","a","scalar"),e("j","a","scalar"),
      e("b","o","scalar"),e("b","p","scalar"),
      e("a","b","scalar",extra:(route:(side:"above",level:1))),
      e("a","b","scalar",extra:(route:(side:"below",level:1))))
  } else if kind == "box" {
    vertices = (v("a",(1,1)),v("b",(3,1)),v("c",(3,-1)),v("d",(1,-1)),
      v("i",(0,1.5),external:true),v("j",(4,1.5),external:true),
      v("o",(4,-1.5),external:true),v("p",(0,-1.5),external:true))
    edges = (e("i","a","scalar"),e("j","b","scalar"),
      e("c","o","scalar"),e("d","p","scalar"),
      e("a","b","fermion"),e("b","c","fermion"),
      e("c","d","fermion"),e("d","a","fermion"))
  }
  feynman(vertices: vertices, edges: edges)
})

#let yukawa-loops() = grid(
  columns: (1fr,1fr,1fr), align: center+horizon,
  column-gutter: 12pt, row-gutter: 7pt,
  image("1pi_self.svg",width:28mm), diagram("bubble"), diagram("self"),
  [介子 tadpole：$O(lambda)$], [核子闭圈：$O(g^2)$], [核子自能：$O(g^2)$],
  diagram("vertex"), diagram("fish"), diagram("box"),
  [Yukawa 顶点：$O(g^3)$], [介子 fish：$O(lambda^2)$], [四介子核子圈：$O(g^4)$],
)
