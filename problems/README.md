# QFT Problems

- `main.typ`：独立习题册入口；可按需注释章节.
- `template.typ`：QFT Problems 模板，复用讲义的字体、数学工具和习题 / 解答环境.
- `ch1.typ`、`ch2.typ`、`ch4.typ`、`ch5.typ`：习题与已有解答的唯一来源. 原讲义通过 `include` 引用这些文件.
- `QFT-Problems.pdf`：编译后的独立习题册.

在相应章节文件中新增 `#exercise(...) [...]`，并在其后用 `#sol[...]` 写解答. 保留已有标签，以免破坏交叉引用. 文件名与默认编号沿用原讲义章号；第 3 章目前没有独立习题组.

习题与解答中的公式按“章号.题号.公式号”编号，例如 `(1.1.1)`. 每道新题从末位 1 开始，紧随其后的解答接着该题编号；讲义与独立习题册采用同一规则.

在项目根目录执行 `python problems/build.py`，会依次编译讲义、更新正文公式的编号 / PDF 页码、生成习题册. 需要 Typst 0.15 或更新版本，Python 仅使用标准库.

仅修改题目或解答、没有改变讲义公式编号时，可直接执行：

```text
typst compile --root . problems/main.typ problems/QFT-Problems.pdf
```

`lecture-targets.json` 和 `lecture-refs.json` 由构建脚本生成. 独立习题册内部引用正常跳转；正文公式显示为“讲义式”，通过相对链接指向上一级 `main.pdf`. 分享时保持两个 PDF 的相对目录位置；部分浏览器内置 PDF 阅读器不支持跨文件页码跳转，可使用桌面 PDF 阅读器.
