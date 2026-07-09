#import "@preview/hydra:0.6.2": * // 页眉

#import "@preview/physica:0.9.8": * // 物理符号库
#import "@preview/ytableausp:0.1.0": * // Young tableaux

#import "@preview/cetz:0.4.2":* // 示意图
#import "@preview/fletcher:0.5.8": * // 示意图
#import "@preview/lilaq:0.5.0" as lq // 科学绘图


#import "@preview/showybox:2.0.4": showybox // 美观的盒子环境




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



// 定义计数器
#let thm-counter = counter("theorem")
#let def-counter = counter("definition")
#let exm-counter = counter("example")
#let prob-counter = counter("problem")
// 带自动编号的定理环境（使用 figure 包装以支持引用）
#let prop(title: none, label: none, body) = {
  thm-counter.step()
  context {
    let num = thm-counter.get().first()
    let full-title = if title != none {
      [Proposition #num (#title)]
    } else {
      [Proposition #num]
    }
    
    // 先定义 fig 变量
    let fig = figure(
      kind: "theorem",
      supplement: [命题],
      numbering: _ => numbering("1", num),
      showybox(
        breakable: true,
        title-style: (
          color: black,
          weight: "bold",
          boxed-style: (
            anchor: (x: left, y: horizon),
            radius: (top: 5pt, bottom: 0pt),
          )
        ),
        frame: (
          title-color: rgb("#e6d2b8").darken(20%),
          body-color: rgb("#e6d2b8"),
          border-color: rgb("#e6d2b8").darken(30%),
          radius: 5pt,
          thickness: (left: 2pt),
        ),
        body-style: (
          align: left,
        ),
        title: full-title,
        body
      )
    )
    
    // 然后使用 fig 变量
    if label != none {
      [#fig #label]
    } else {
      fig
    }
  }
}

// 同样修改 def
#let def(title: none, label: none, body) = {
  def-counter.step()
  context {
    let num = def-counter.get().first()
    let full-title = if title != none {
      [Definition #num (#title)]
    } else {
      [Definition #num]
    }
    
    let fig = figure(
      kind: "definition",
      supplement: [Definition],
      numbering: _ => numbering("1", num),
      showybox(
        breakable: true,
        title-style: (
          color: black,
          weight: "bold",
          boxed-style: (
            anchor: (x: left, y: horizon),
            radius: (top: 5pt, bottom: 0pt),
          )
        ),
        frame: (
          title-color: cmyk(30.61%, 1.22%, 0%, 3.92%).darken(20%),
          body-color: cmyk(30.61%, 1.22%, 0%, 3.92%),
          border-color: cmyk(30.61%, 1.22%, 0%, 3.92%).darken(30%),
          radius: 5pt,
          thickness: (left: 2pt),
        ),
        body-style: (
          align: left,
        ),
        title: full-title,
        body
      )
    )
    
    if label != none {
      [#fig #label]
    } else {
      fig
    }
  }
}

// 同样修改 exm
#let exm(title: none, label: none, body) = {
  exm-counter.step()
  context {
    let num = exm-counter.get().first()
    let full-title = if title != none {
      [Example #num (#title)]
    } else {
      [Example #num]
    }
    
    let fig = figure(
      kind: "example",
      supplement: [Example],
      numbering: _ => numbering("1", num),
      showybox(
        breakable: true,
        title-style: (
          color: black,
          weight: "bold",
          boxed-style: (
            anchor: (x: left, y: horizon),
            radius: (top: 5pt, bottom: 0pt),
          )
        ),
        frame: (
          title-color: rgb("#afdbb8").darken(20%),
          body-color: rgb("#afdbb8"),
          border-color: rgb("#afdbb8").darken(30%),
          radius: 5pt,
          thickness: (left: 2pt),
        ),
        body-style: (
          align: left,
        ),
        title: full-title,
        body
      )
    )
    
    if label != none {
      [#fig #label]
    } else {
      fig
    }
  }
}


// 同样修改 prob
#let prob(title: none, label: none, body) = {
  prob-counter.step()
  context {
    let num = prob-counter.get().first()
    let full-title = if title != none {
      [Problem #num (#title)]
    } else {
      [Problem #num]
    }
    
    let fig = figure(
      kind: "problem",
      supplement: [Problem],
      numbering: _ => numbering("1", num),
      showybox(
        breakable: true,
        title-style: (
          color: black,
          weight: "bold",
          boxed-style: (
            anchor: (x: left, y: horizon),
            radius: (top: 5pt, bottom: 0pt),
          )
        ),
        frame: (
          title-color: rgb("#e1a988").darken(20%),
          body-color: rgb("#e1a988"),
          border-color: rgb("#e1a988").darken(30%),
          radius: 5pt,
          thickness: (left: 2pt),
        ),
        body-style: (
          align: left,
        ),
        title: full-title,
        body
      )
    )
    
    if label != none {
      [#fig #label]
    } else {
      fig
    }
  }
}


// Remark 环境 - 无盒子，只有标题和内容
#let remark(title: "Remark", body) = {
  block(
    width: 100%,
    breakable: true,
    [
      #text(style: "italic", weight: "bold")[#title.]
      #h(0.5em)
      #body
      #h(1fr)
      $qed$
    ]
  )
}

// Proof 环境 - 无盒子，斜体 Proof 开头，QED 符号结尾
#let proof(title: "Proof", body) = {
  block(
    width: 100%,
    breakable: true,
    [
      #text(style: "italic", weight: "bold")[#title.]
      #h(0.5em)
      #body
      #h(1fr)
      $qed$
    ]
  )
}


#let sol(title: "Solution", body) = {
  block(
    width: 100%,
    breakable: true,
    [
      #text(style: "italic", weight: "bold")[#title.]
      #h(0.5em)
      #body
      #h(1fr)
      $qed$
    ]
  )
}



// 使用 showybox 创建更美观的定理环境





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
