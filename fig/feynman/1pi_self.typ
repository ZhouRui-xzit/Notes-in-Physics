#import "@preview/cetz:0.5.2" as cetz
#import "../../Cetz-Feynamn/lib.typ": feynman

// Book conventions layered on the local library, without changing its presets.
#cetz.canvas(length: 10mm, {
  feynman(
    ("i", "a", (particle: "scalar", momentum: (label: $p$))),
    ("a", "o", (particle: "scalar")),
    (
      "a",
      "a",
      (
        particle: "scalar",
        loop-angle: 90deg,
        loop-size: 0.5,
      ),
    ),
    incoming: ("i",),
    outgoing: ("o",),
    layout: (main-lines: (("i", "a", "o"),)),
  )
})
