
#import "@preview/physica:0.9.6": * // 物理符号库


#import "@preview/cetz:0.4.2":* // 示意图
#import "@preview/fletcher:0.5.8": * // 示意图






#diagram(
  // 1. 定义顶点
  node((0, 0), name: <v1>), // 湮灭顶点
  node((0, 2), name: <v2>), // 产生顶点

  // 2. 入射粒子 (时间从下往上)
  // 电子 (e-)
  edge((-2, -2), <v1>, "->-", label: $e^-$),
  // 正电子 (e+)，箭头方向相反
  edge((2, -2), <v1>, "-<-", label: $e^+$),

  // 3. 传播子 (光子)
  // 使用 "wave" 装饰 
  edge(<v1>, <v2>, decorations: "wave", label: $gamma$),

  // 4. 出射粒子
  // Muon (μ-)
  edge(<v2>, (-2, 4), "->-", label: $mu^-$),
  // Anti-muon (μ+)，箭头方向相反
  edge(<v2>, (2, 4), "-<-", label: $mu^+$)
)

#diagram(

  node-stroke: black + 0.5pt,
  node-fill: gradient.radial(white, blue, center: (40%, 20%), radius: 150%),
  spacing: (10mm, 5mm),

  node((0,0), [1], name: <1>, extrude: (0, -4)),
  edge("=>"),
  node((1,0), [2], name: <2>),
  node((2,-1), [3a], name: <3a>),
  node((2,+1), [3b], name: <3b>),

  node(enclose: (<1>, <2>)),
  edge(<2.east>, "->", <3a>, bend: -15deg),
  edge(<2.east>, "->", <3b>, bend: +15deg),

  // 这就是绘制循环的那一行：
  edge(<3b>, "->", <3b>, bend: 130deg, loop-angle: 10deg)
)