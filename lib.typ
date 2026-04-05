#import "some_let.typ":* // 一些自定义函数


#let mybook(
  title: [],
  authors: [],
  version: [],
  date: [],
  cover-image: "",
  mycolors:(),
  doc,  
) = {
   

    // title page

// title page
set page(paper: "a4", margin: 0pt)
// 背景图片
image(cover-image, width: 100%, height: 100%)


// 覆盖层 - 使用渐变效果
place(
  top + left,
  rect(
    width: 100%,
    height: 100%,
    fill: gradient.linear(
      (mycolors.coverrgb.transparentize(70%), 0%),
      (mycolors.coverrgb.lighten(30%).transparentize(70%), 50%),
      (white.transparentize(0%), 100%),
      angle: 90deg
    )
  )
)
place(
  center + horizon,
  dx: 0pt,
  dy: -100pt,
  block(
    width: 80%,
    align(center)[
      // 信息表格
      #box(
        fill: white.transparentize(20%),
        inset: 20pt,
        radius: 8pt,
        stroke: (paint: mycolors.titlergb.lighten(40%), thickness: 1pt),
        [
          // 主标题 - 添加在框内第一行
          #text(
            size: 25pt,
            weight: "bold",
            font: ("Arial", "FZHei-B01"),
            fill: mycolors.titlergb,
            //tracking: 0.01em
          )[#title]
          
         
          
          // 装饰线
          #line(length: 100%, stroke: (thickness: 2pt, paint: mycolors.titlergb))
          
         
          
          // 信息表格
          #grid(
            columns: (auto, 1fr),
            column-gutter: 2em,
            row-gutter: 0.8em,
            align: (right, left),
            
            text(size: 14pt, weight: "bold", fill: mycolors.titlergb)[Author:],
            text(size: 14pt, fill: mycolors.titlergb)[#authors],
            
            text(size: 14pt, weight: "bold", fill: mycolors.titlergb)[Version:],
            text(size: 14pt, fill: mycolors.titlergb)[#version],
            
            text(size: 14pt, weight: "bold", fill: mycolors.titlergb)[Date:],
            text(size: 14pt, fill: mycolors.titlergb)[#date],
          )
        ]
      )
    ]
  )
)
// 底部装饰
place(
  bottom + center,
  dy: -30pt,
  text(size: 10pt, fill: mycolors.titlergb.lighten(20%))[
    Build by #version
  ]
)

pagebreak()
 // title page

  set align(left+top)
  set page(paper: "a4", margin: (x:40pt, y:40pt))
  // title page
  set text(font: ("Libertinus Serif", "FZShuSong-Z01"), size: 12pt)
  show strong: text.with(font: ("Libertinus Serif", "FZHei-B01"), size: 12pt)
  show emph: text.with(font: ("Libertinus Serif", "FZKai-Z03"), size: 12pt)
  show math.equation: set text(font: ("New Computer Modern Math",), size: 12pt)




  
  // outline
  
  show outline: it => {
    show heading: set align(center)
    set text(size: 16pt, fill: mycolors.headingcolor)
    it
  }

show outline.entry.where(
  level: 1
): it => {
  // 检查是否是 Part 条目（通过检查是否有编号）
  let is-part = it.element.numbering == none
  
  if is-part {
    // Part 条目：居中显示，没有填充线，显示页码
    v(18pt, weak: true)
    align(center)[
      #text(size: 16pt, fill: mycolors.headingcolor, weight: "bold", font:("Arial", "FZHei-B01"))[
        // 使用 text 包裹 link 来覆盖全局的 link 颜色设置
        #text(fill: mycolors.headingcolor)[
          #link(it.element.location())[#it.element.body]
        ]
      ]
    ]
    v(6pt, weak: true)
  } else {
    // 普通一级标题
    v(12pt, weak: true)
    text(size: 12pt, fill: mycolors.headingcolor, strong(it))
  }
}

  show outline.entry.where(
    level: 2
  ): it => {
    text(size: 12pt,fill: mycolors.headingcolor, it)
  }

  show outline.entry.where(
    level: 3
  ): it => {
    text(size: 12pt,fill: mycolors.headingcolor, it)
  }


    
// heading 


// 需要为 Part 的 heading 添加特殊样式，使其不显示但在目录中显示
show heading.where(level: 1): it => {
  // 通过检查 numbering 属性来判断是否是 Part
  // Part 的 numbering 是 none，普通章节有编号
  if it.numbering == none {
    // Part heading 不显示内容
    []
  } else {
    // 普通 heading 正常显示
    pagebreak(weak: true)
        // 重置计数器
    counter(figure.where(kind:image)).update(0)
    counter(figure.where(kind:table)).update(0)
    
    align(center, text(
      size: 18pt,
      fill: mycolors.headingcolor,
      weight: "bold",
      it
    ))
    v(-1pt)
  }
}

  set heading(numbering: "1.1.")
  set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
  show heading: it =>  {
  it
  par()[#text(size:0.5em)[#h(0.0em)]]
  }
  show figure: it =>  {
      it
      par()[#text(size:0.5em)[#h(0.0em)]]
  }


    // 自定义二级标题样式
    show heading.where(level: 2): it => {
      text(
        size: 16pt,               // 字体大小
        fill: mycolors.headingcolor,               // 字体颜色
        it
      )
       v(-10pt)
    }

    // 自定义三级标题样式
    show heading.where(level: 3): it => {
      text(
        size: 14pt,               // 字体大小
        fill: mycolors.headingcolor,               // 字体颜色
        it
      )
      v(-10pt)
    }
// heading 

    // ref

  set figure(numbering: (..nums) => {
    let ch = counter(heading).get().first()
    numbering("(1.1)", ch, ..nums)
  })


   set math.equation(numbering: n => {
  
  // if you want change the number of number of displayed
  // section numbers, modify it this way:
  let count = counter(heading).get()
  let h1 = count.first()
  let h2 = count.at(1, default: 0)
  numbering("(1.1.1)", h1, h2, n)
})



    set math.equation(supplement: [eq])
    show figure.where(
    kind: table
    ): set figure(supplement: [table])
    show figure.where(
    kind: table
    ): set figure.caption(position: top)
    show figure.where(
    kind: image
    ): set figure(supplement: [fig])
    show heading.where(level: 2): it => it + counter(math.equation).update(0)
  

    //show link: text.with(fill: mycolors.refcolor) // 网址链接
    show ref: it =>{text(it,mycolors.refcolor,font: ("Libertinus Serif", "FZHei-B01"), size: 12pt)}

    show ref: it => {
    if query(it.target).len() == 0 {
    return text(fill: red, "<???" + ">")
    }
    it
    }

    //ref 

    set math.mat(row-gap:1em, column-gap:1em)

    // Page
    set page(paper: "a4",fill: white, margin: (x:40pt, y:60pt), numbering: "1", header: context {
      align(right,  text(size: 13pt,fill: mycolors.headingcolor,hydra(2)))
      v(-10pt)
      line(length: 100%, stroke: black) 
    }, footer: [
        #align(center,context {counter(page).display("1")})
        #line(length: 100%, stroke: black) 
      ])
    // page 
 // 修改脚注样式（在 mybook 函数中）
  show footnote.entry: it => {
    set text(fill: mycolors.refcolor, size: 10pt)
    set math.equation(numbering: none)  // 脚注中的公式不编号
    show math.equation: set text(size: 10pt, font: "Libertinus Math")
    it
  }

    outline(title:"Table of Contents")
   
    counter(page).update(1)
  
  doc
}

// 在 mybook 外部定义，接受 mycolors 参数
#let part(number, title, mycolors) = {
  heading(
    level: 1,
    outlined: true,
    numbering: none,
    [Part #numbering("I", number): #title]
  )
  
  pagebreak(weak: false)
  
  [
    #set page(
      paper: "a4",
      margin: 0pt,
      numbering: none,
      header: none,
      footer: none,
      fill: mycolors.titlergb.lighten(95%)
    )

    #place(
      center + horizon,
      {
        showybox(
          width: 75%,
          frame: (
            border-color: mycolors.titlergb.darken(10%),
            title-color: mycolors.titlergb,
            body-color: white,
            radius: 20pt,
            thickness: 4pt,
          ),
          shadow: (
            offset: (x: 8pt, y: 8pt),
            color: mycolors.titlergb.transparentize(50%)
          ),
          title-style: (
            color: white,
            weight: "bold",
            align: center,
            sep: 1.5em,
            boxed-style: (
              anchor: (x: center, y: horizon),
              offset: (y: -0.5em),
            )
          ),
          body-style: (
            align: center,
          ),
          sep: (
            dash: "solid",
            thickness: 2pt,
            gutter: 2em,
          ),
          // 标题显示 PART I
          title: text(
            size: 30pt,
            font: ("Arial", "FZHei-B01"),
            tracking: 0.15em,
            weight: "black"
          )[PART #numbering("I", number)],
          [
            #v(1.5em)
            
            // 正文显示标题
            #text(
              size: 28pt,
              font: ("Arial", "FZHei-B01"),
              weight: "bold",
              fill: mycolors.titlergb.darken(10%)
            )[#title]
            
            #v(1em)
            
            // 底部装饰
            #box(
              width: 50%,
              height: 3pt,
              fill: gradient.linear(
                (mycolors.titlergb.transparentize(100%), 0%),
                (mycolors.titlergb, 50%),
                (mycolors.titlergb.transparentize(100%), 100%)
              )
            )
            #v(1em)
          ]
        )
      }
    )
    
    #pagebreak(weak: false)
  ]
}

// 在 lib.typ 中添加序章函数
#let preface(title, body) = {
  pagebreak(weak: true)
  
  // 添加到目录但不编号
  heading(
    level: 1,
    outlined: true,
    numbering: none,
    [#title]
  )
  
  // 序章内容
  body
}