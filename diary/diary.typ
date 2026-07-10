// diary.typ — QFT 写作进度日记
// 今天写昨天的反馈，今天为明天写大纲
// review 里的条目与上一天 plan-items 一一对应

#import "diary-lib.typ": *
#import "@preview/physica:0.9.8": *

// ─── 页面与字体设置 ──────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 50pt, y: 55pt),
  numbering: "1",
  header: context {
    align(right,
      text(size: 11pt, fill: rgb("#24555c"),
           font: ("Libertinus Serif", "Noto Serif CJK SC"),
           [QFT 写作日记])
    )
    v(-8pt)
    line(length: 100%,
         stroke: (paint: rgb("#24555c").lighten(50%), thickness: 0.6pt))
  },
  footer: align(center,
    text(size: 10pt, fill: rgb("#24555c").lighten(40%))[
      #context counter(page).display("1")
    ]
  )
)

#set text(
  font: ("Libertinus Serif", "Noto Serif CJK SC"),
  size: 11.5pt,
  lang: "zh",
)
#show strong: text.with(font: ("Libertinus Serif", "Noto Sans CJK SC"))
#show emph:   text.with(font: ("Libertinus Serif", "LXGW WenKai"))
#show math.equation: set text(font: ("New Computer Modern Math",), size: 11.5pt)

// ─── 封面 ─────────────────────────────────────────────────
#align(center)[
  #v(2em)
  #block(
    fill: rgb("#24555c"),
    radius: 10pt,
    inset: (x: 30pt, y: 20pt),
    [
      #text(size: 22pt, weight: "bold", fill: white,
            font: ("Libertinus Serif", "FZHei-B01"))[QFT 写作日记]
      #v(4pt)
      #text(size: 12pt, fill: white.transparentize(30%),
            font: ("Libertinus Serif", "Noto Serif CJK SC"),
            [QFT for Calculators — 进度记录])
    ]
  )
  #v(0.5em)
  #text(size: 11pt, fill: rgb("#24555c").lighten(30%))[
    始于 #datetime.today().display("[year]年[month]月[day]日")
  ]
  #v(2em)
]

#line(length: 100%, stroke: (paint: rgb("#2ca6b8").lighten(40%), thickness: 1pt))
#v(1.5em)

// ════════════════════════════════════════════════════════════
//  Day 1 — 没有昨日计划，review 留空
// ════════════════════════════════════════════════════════════

#diary-entry(
  [2026年7月8日 · 星期三],
  day-num: 1,

  review: (),

  [
    今天开始动笔写第2章「实标量场的正则量子化」。

    先把章节结构定下来：§2.1 经典场的模展开，§2.2 正则量子化，
    §2.3 Fock 空间，§2.4 传播子。这个顺序和 Peskin & Schroeder
    的安排基本一致，但打算在 §2.3 之前先用一小节解释为什么
    要引入算符，而不是直接写对易关系，让逻辑更自洽。

    §2.1 的正文草稿大体完成。模展开写成

    $ phi(x) = integral (dd(bold(k), 3)) / (2pi)^3 1/sqrt(2 omega_bold(k))
      (hat(a)_bold(k) e^(i k dot x) + hat(a)^dagger_bold(k) e^(-i k dot x)) $

    归一化约定决定用 Peskin 的 $2omega$ 而不是相对论协变的 $2E$，
    写了一个脚注解释这两种约定的关系，避免读者困惑。

    *卡住的地方：* §2.2 正则量子化里，对易关系
    $ [hat(a)_bold(k), hat(a)^dagger_(bold(k)')] = (2pi)^3 delta^3(bold(k) - bold(k)') $
    的推导要从等时对易关系
    $ [phi(bold(x), t), pi(bold(y), t)] = i delta^3(bold(x) - bold(y)) $
    出发反推。中间的逆 Fourier 变换计算今天没时间仔细写，留到明天。
  ],

  plan-date: [2026年7月9日],
  plan-items: (
    [写完§2.2：从等时对易关系推导 $hat(a)$ 的对易关系，逐步写清楚],
    [起草§2.3 Fock 空间：真空态、单粒子态、$n$ 粒子态的定义各一段],
    [检查§2.1 的符号约定是否在全章一致（特别是 $k dot x$ 的度规符号）],
    [给传播子§2.4 列一个提纲，不用写正文],
  ),
)

// ════════════════════════════════════════════════════════════
//  Day 2
// ════════════════════════════════════════════════════════════

#diary-entry(
  [2026年7月9日 · 星期四],
  day-num: 2,

  review: (
    ([写完§2.2：从等时对易关系推导 $hat(a)$ 的对易关系，逐步写清楚],    "done"),
    ([起草§2.3 Fock 空间：真空态、单粒子态、$n$ 粒子态的定义各一段],     "done"),
    ([检查§2.1 的符号约定是否在全章一致（特别是 $k dot x$ 的度规符号）], "pending"),
    ([给传播子§2.4 列一个提纲，不用写正文],                               "skip"),
  ),

  [
    §2.2 的推导写完了，关键步骤是把 $phi$ 和 $pi$ 的模展开代入
    等时对易关系，然后用 $delta$ 函数的 Fourier 表示把积分做掉。
    写了约半页推导，中间加了一个「注意」框提醒读者这里 $omega_bold(k)$
    是 $c$-数而非算符，这个细节容易忽略。

    §2.3 起草了三段：真空态 $|0⟩$（被 $hat(a)_bold(k)$ 湮灭），
    单粒子态 $hat(a)^dagger_bold(k)|0⟩$，以及多粒子态的对称性
    （玻色子，交换不变）。暂时没写粒子数算符，放到§2.3 结尾。

    符号一致性检查没做，因为发现§2.3 里对 $|0⟩$ 的归一化写法
    和§2.1 里隐含的约定可能不一致，需要先把这个问题解决再做
    全局检查，否则检查结果也是错的。

    §2.4 提纲跳过了，现在对传播子的整体思路还不够清晰，
    强行列提纲反而会写错。等§2.3 写完、对 Fock 空间有更清楚的
    认识后再做。
  ],

  plan-date: [2026年7月10日],
  plan-items: (
    [解决 $|0⟩$ 归一化约定冲突，统一§2.1—§2.3 的写法],
    [完成§2.3 后半：粒子数算符 $hat(N)$、Hamiltonian 的正规序形式],
    [做昨天推迟的符号一致性检查，列出所有不统一的地方],
    [重新评估§2.4 传播子是否现在可以列提纲],
  ),
)

// ════════════════════════════════════════════════════════════
//  Day 3 — 今日，正文待写
// ════════════════════════════════════════════════════════════

#diary-entry(
  [2026年7月10日 · 星期五],
  day-num: 3,

  review: (
    ([解决 $|0⟩$ 归一化约定冲突，统一§2.1—§2.3 的写法],              "done"),
    ([完成§2.3 后半：粒子数算符 $hat(N)$、Hamiltonian 的正规序形式], "pending"),
    ([做昨天推迟的符号一致性检查，列出所有不统一的地方],               "done"),
    ([重新评估§2.4 传播子是否现在可以列提纲],                          "done"),
  ),

  text(fill: rgb("#24555c").lighten(45%), style: "italic")[
    ‹ 今日内容待填写 ›
  ],

  plan-date: [2026年7月11日],
  plan-items: (
    [完成§2.3 正规序部分的写作],
    [根据符号检查结果逐一修正§2.1—§2.3],
    [按§2.4 提纲开始写传播子：先写位置空间的定义],
  ),
)
