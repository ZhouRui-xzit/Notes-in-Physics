# 中文排版回归测试

在仓库根目录执行：

```sh
typst compile --root . tests/typography.typ output/pdf/typography-test.pdf
```

生成的 PDF 用于检查中文优先的字体与语义样式：

- 正文、粗体强调和各级标题使用 `Noto Sans CJK SC`；
- `_强调_` / `emph` 使用 `LXGW WenKai`，不合成人工斜体；
- 显示公式使用 `STIX Two Math`；
- 测试页覆盖四级标题、中西文混排、环境块、公式编号与交叉引用。
