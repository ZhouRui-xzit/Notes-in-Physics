#import "../lib.typ": *

#let test-colors = (
  coverrgb: rgb("#163b49"),
  titlergb: rgb("#36a6b6"),
  headingcolor: rgb("#317782"),
  refcolor: rgb("#d86483"),
  night: rgb("#163b49"),
  gold: rgb("#e2b55b"),
  ink: rgb("#26363f"),
  muted: rgb("#657b85"),
  paper: rgb("#fcfefe"),
  panel: rgb("#edf7f8"),
)

#show: mybook.with(
  title: [中文字体排版测试],
  authors: [QFT for Calculators],
  version: [test],
  date: [排版回归],
  cover-image: "fig/cover.jpg",
  mycolors: test-colors,
)

= 中文排版基线：正文与语义样式

这是一段正文，用来检查 Noto Sans CJK SC 的中文字面、标点挤压、行距、
两端对齐和首行缩进。The same paragraph also contains Latin letters, QFT、LSZ 与
$phi^4$，用来检查中西文混排及数学字体是否稳定。

*这是粗体强调，应该使用 Noto Sans CJK SC 的 Bold 字重。*
_这是斜体语义环境，应该改用 LXGW WenKai，而不是人工倾斜的黑体。_
普通正文、*粗体强调*、_文楷强调_ 与 $e^(i S_M) arrow.r e^(-S_E)$
应当在同一行内保持基线协调。

== 二级标题：中文与 Path Integral

二级标题检查编号、字重、颜色和长标题换行。正文中的“量子场论”使用简体中文
语言规则；括号（如此）、引号“如此”与句号。都应正确参与断行。

=== 三级标题：强调环境

#remark(title: [排版说明])[
  环境标题、普通正文、*粗体内容*与_文楷强调_都应清晰可辨。
]

==== 四级标题：$Z_phi$ 与中文混排

四级标题检查左侧金色竖线、编号和数学内容。下面的显示公式继续使用
STIX Two Math：

$
  tensor(eta,-mu,-nu) = upright("diag") (-1,+1,+1,+1),
  quad p^2 = -m^2.
$ <eq:typography-metric>

引用 @eq:typography-metric 应显示中文公式补充词，并保持引用颜色与字重。
