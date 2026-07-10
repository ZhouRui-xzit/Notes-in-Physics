// diary-lib.typ — 学习日记组件库
// 核心概念：每日条目包含「昨日计划回顾」+「今日记录」+「明日大纲」
// 前一天写的 next-plan 直接成为第二天 review 的输入

#import "@preview/showybox:2.0.4": showybox

// ─── 颜色方案 ────────────────────────────────────────────────
#let dc = (
  header:       rgb("#24555c"),           // 日期栏背景（深青）
  accent:       rgb("#2ca6b8"),           // 强调色（青蓝）
  done-bg:      rgb("#d4edda"),           // 已完成 背景
  done-fg:      rgb("#155724"),           // 已完成 文字
  pending-bg:   rgb("#fff3cd"),           // 未完成 背景
  pending-fg:   rgb("#7a5800"),           // 未完成 文字
  skip-bg:      rgb("#f1e0ff"),           // 跳过 背景
  skip-fg:      rgb("#5c1a8a"),           // 跳过 文字
  plan-border:  rgb("#2ca6b8"),           // 明日计划边框
  plan-bg:      rgb("#eef8fb"),           // 明日计划背景
  body-border:  rgb("#24555c"),           // 正文边框
  body-bg:      rgb("#fafcfc"),           // 正文背景
  divider:      rgb("#24555c").lighten(65%),
)

// ─── 日期标题栏 ──────────────────────────────────────────────
// date:    今日日期，如 [2026年7月9日 · 星期四]
// day-num: 可选序号，如 1、2、3
#let day-header(date, day-num: none) = {
  v(0.8em)
  block(
    width: 100%,
    fill: dc.header,
    radius: 6pt,
    inset: (x: 16pt, y: 11pt),
    [
      #set text(fill: white, font: ("Libertinus Serif", "FZHei-B01"))
      #if day-num != none [
        #box(
          fill: white.transparentize(75%),
          radius: 3pt,
          inset: (x: 7pt, y: 2pt),
          text(size: 11pt, weight: "bold")[Day #day-num]
        )
        #h(0.8em)
      ]
      #text(size: 15pt, weight: "bold")[#date]
    ]
  )
  v(0.6em)
}

// ─── 单个检查项（内部辅助）──────────────────────────────────
// status: "done" | "skip" | "pending"
#let _check-item(body, status: "pending") = {
  let (icon, bg, fg) = if status == "done" {
    ("✓", dc.done-bg, dc.done-fg)
  } else if status == "skip" {
    ("╌", dc.skip-bg, dc.skip-fg)
  } else {
    ("○", dc.pending-bg, dc.pending-fg)
  }

  block(
    width: 100%,
    fill: bg,
    radius: 3pt,
    inset: (x: 10pt, y: 5pt),
    [
      #text(fill: fg, weight: "bold", font: ("Libertinus Serif", "Noto Sans CJK SC"))[#icon]
      #h(0.6em)
      #text(fill: fg, font: ("Libertinus Serif", "Noto Serif CJK SC"))[#body]
    ]
  )
}

// ─── 昨日计划回顾块 ──────────────────────────────────────────
// items: array of (content, "done" | "skip" | "pending")
//   例如: (([推导 Klein-Gordon 方程], "done"), ([习题1.3], "pending"))
#let prev-review(items) = {
  if items.len() == 0 { return }

  showybox(
    breakable: true,
    title-style: (
      color: white,
      weight: "bold",
      boxed-style: (
        anchor: (x: left, y: horizon),
        radius: (top: 5pt, bottom: 0pt),
      )
    ),
    frame: (
      title-color: dc.header.lighten(15%),
      body-color:  white,
      border-color: dc.header,
      radius: 5pt,
      thickness: (left: 3pt),
    ),
    title: text(font: ("Libertinus Serif", "FZHei-B01"))[📋 昨日计划 · 完成情况],
    {
      for item in items {
        let (body, status) = item
        _check-item(body, status: status)
        v(4pt, weak: true)
      }
    }
  )
  v(0.8em)
}

// ─── 今日记录正文块 ──────────────────────────────────────────
// body: 今天自由书写的内容
#let diary-body(body) = {
  showybox(
    breakable: true,
    title-style: (
      color: white,
      weight: "bold",
      boxed-style: (
        anchor: (x: left, y: horizon),
        radius: (top: 5pt, bottom: 0pt),
      )
    ),
    frame: (
      title-color: dc.body-border,
      body-color:  dc.body-bg,
      border-color: dc.body-border,
      radius: 5pt,
      thickness: (left: 3pt),
    ),
    title: text(font: ("Libertinus Serif", "FZHei-B01"))[✏️ 今日记录],
    body
  )
  v(0.8em)
}

// ─── 明日计划大纲块 ──────────────────────────────────────────
// next-date:  明日日期，如 [2026年7月10日]
// plan-items: array of content，每项为一条计划
#let next-plan(next-date, plan-items) = {
  if plan-items.len() == 0 { return }

  showybox(
    breakable: true,
    title-style: (
      color: white,
      weight: "bold",
      boxed-style: (
        anchor: (x: left, y: horizon),
        radius: (top: 5pt, bottom: 0pt),
      )
    ),
    frame: (
      title-color: dc.plan-border,
      body-color:  dc.plan-bg,
      border-color: dc.plan-border,
      radius: 5pt,
      thickness: (left: 3pt),
    ),
    title: text(font: ("Libertinus Serif", "FZHei-B01"))[🗓️ 明日大纲 · #next-date],
    {
      for (i, item) in plan-items.enumerate() {
        block(
          width: 100%,
          fill: white,
          radius: 3pt,
          inset: (x: 10pt, y: 5pt),
          stroke: (paint: dc.plan-border.lighten(45%), thickness: 0.5pt),
          [
            #text(fill: dc.plan-border, weight: "bold",
                  font: ("Libertinus Serif", "Noto Sans CJK SC")
            )[#numbering("①", i + 1)]
            #h(0.6em)
            #text(fill: rgb("#1a3a40"),
                  font: ("Libertinus Serif", "Noto Serif CJK SC")
            )[#item]
          ]
        )
        v(4pt, weak: true)
      }
    }
  )
  v(1.2em)
}

// ─── 分隔线 ─────────────────────────────────────────────────
#let day-divider() = {
  line(
    length: 100%,
    stroke: (paint: dc.divider, thickness: 0.8pt, dash: "dashed")
  )
  v(0.6em)
}

// ─── 完整日记条目（顶层函数）────────────────────────────────
// date:       今日日期 (content)
// day-num:    条目序号，可选 (int)
// review:     昨日计划回顾，可选，array of (content, status-str)
// body:       今日记录正文 (content)
// plan-date:  明日日期标注 (content)
// plan-items: 明日计划条目，可选，array of content
#let diary-entry(
  date,
  day-num:    none,
  review:     (),
  body,
  plan-date:  [明日],
  plan-items: (),
) = {
  day-header(date, day-num: day-num)
  prev-review(review)
  diary-body(body)
  next-plan(plan-date, plan-items)
  day-divider()
}
