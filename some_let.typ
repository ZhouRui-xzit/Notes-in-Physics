#import "@preview/hydra:0.6.2": * // 页眉

#import "@preview/physica:0.9.8": * // 物理符号库
#import "@preview/ytableausp:0.1.0": * // Young tableaux

#import "@preview/cetz:0.4.2":* // 示意图
#import "@preview/fletcher:0.5.8": * // 示意图
#import "@preview/lilaq:0.5.0" as lq // 科学绘图


#import "@preview/showybox:2.0.4": showybox // 美观的盒子环境
#import "@preview/theorion:0.6.0": make-frame, set-theorion-numbering
#import "@preview/theorion:0.6.0": cosmos
#import cosmos.fancy: fancy-box




#let minical(it) = {
  show math.equation: set text(font: "New Computer Modern Math", size: 12pt)
  box(
  text(
  stylistic-set: 2,
  $cal(it)$))
  }




#let stand(body) = {
 show: emph(body)
}

#let bf(body) = {
  vb(math.upright(body))
}


#let slashed(body) = {
 math.cancel(body,angle: 30deg)
}

#let slashed(body) = {
 math.cancel(body,angle: 30deg)
}




// 自定义符号



// Theorion 定理环境。四类环境分别计数，并继承章编号。
#let theorem-colors = (
  proposition: (border: rgb("#9b6b3f"), body: rgb("#fbf5ed")),
  definition: (border: rgb("#2f6f8f"), body: rgb("#eef7fa")),
  example: (border: rgb("#3f7a55"), body: rgb("#eff8f1")),
  problem: (border: rgb("#a6533c"), body: rgb("#fff1ed")),
)

#let colored-theorem-render(colors) = fancy-box.with(
  get-border-color: _ => colors.border,
  get-body-color: _ => colors.body,
  get-symbol: _ => none,
  breakable: true,
)

#let (
  proposition-counter,
  proposition-box,
  proposition,
  show-proposition,
) = make-frame(
  "proposition",
  "Proposition",
  inherited-levels: 1,
  render: colored-theorem-render(theorem-colors.proposition),
)

#let (
  definition-counter,
  definition-box,
  definition,
  show-definition,
) = make-frame(
  "definition",
  "Definition",
  inherited-levels: 1,
  render: colored-theorem-render(theorem-colors.definition),
)

#let (
  example-counter,
  example-box,
  example,
  show-example,
) = make-frame(
  "example",
  "Example",
  inherited-levels: 1,
  render: colored-theorem-render(theorem-colors.example),
)

#let (
  problem-counter,
  problem-box,
  problem,
  show-problem,
) = make-frame(
  "problem",
  "Problem",
  inherited-levels: 1,
  render: colored-theorem-render(theorem-colors.problem),
)

// 只启用上面的彩色环境，不让 Theorion 接管 remark/proof/solution。
#let show-colored-theorems(body) = {
  show: show-proposition
  show: show-definition
  show: show-example
  show: show-problem
  body
}

// 兼容原来的短名称和 label 参数；新正文也可以直接使用完整名称。
#let legacy-theorem(frame, title: "", label: none, body) = {
  let item = frame(title: title, body)
  if label == none { item } else { [#item #label] }
}

#let prop(title: "", label: none, body) = legacy-theorem(
  proposition,
  title: title,
  label: label,
  body,
)
#let def(title: "", label: none, body) = legacy-theorem(
  definition,
  title: title,
  label: label,
  body,
)
#let exm(title: "", label: none, body) = legacy-theorem(
  example,
  title: title,
  label: label,
  body,
)
#let prob(title: "", label: none, body) = legacy-theorem(
  problem,
  title: title,
  label: label,
  body,
)

// Remark 独立且不带 QED；Proof 与 Solution 保持无框，并在末尾带 QED。
#let remark(title: "Remark", body) = block(
  width: 100%,
  breakable: true,
  inset: (left: 0.8em),
  stroke: (left: 1.5pt + rgb("#7a6b8f")),
  [
    #text(style: "italic", weight: "semibold", fill: rgb("#665876"))[#title.]
    #h(0.5em)
    #body
  ],
)

#let qed-environment(title, body) = block(
  width: 100%,
  breakable: true,
  [
    #text(style: "italic", weight: "semibold")[#title.]
    #h(0.5em)
    #body
    #h(1fr)
    #box($qed$)
  ],
)

#let proof(title: "Proof", body) = qed-environment(title, body)
#let solution(title: "Solution", body) = qed-environment(title, body)
#let sol = solution





// 附录环境
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
  counter(heading).update(0)
  set-theorion-numbering("A.1")
    set figure(numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(A.1)", section, ..nums)
    })

    set math.equation(numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(A.1)", section, ..nums)
    })
  
  body
}
// 附录环境结束
