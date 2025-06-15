// 字体
#let font = (
  main: "Source Han Serif",
  mono: "Jetbrains Mono",
  cjk: "Source Han Serif",
)

// 图标
#let icon(path) = box(
  baseline: 0.125em,
  height: 1.0em,
  width: 1.25em,
  align(center + horizon, image(path))
)

#let faAngleRight = icon("icons/fa-angle-right.svg")

// 主体
#let resume(
  size: 10pt,
  themeColor: rgb(38, 38, 125),
  top: 1.5cm,
  bottom: 2cm,
  left: 2cm,
  right: 2cm,
  photograph: "",
  photographWidth: 0em,
  gutterWidth: 0em,
  headerCenter : false,
  header,
  introduction,
  body
) = {
  // 页边距设定
  set page(paper: "a4", numbering: none, margin: (
    top: top,
    bottom: bottom,
    left: left,
    right: right,
  ))
  
  // 基础字体设定
  set text(font: (font.main, font.cjk), size: size, lang: "zh", weight: "medium")

  // 标题及小标题样式
  show heading: set text(font: (font.main, font.cjk), themeColor, 1.1em)

  // 二级标题下加一条横线
  show heading.where(level: 2): it => stack(
    v(0.1em),
    it,
    v(0.6em),
    line(length: 100%, stroke: 0.05em + themeColor),
    v(0.1em),
  )
  


  // 更改 bullet list 的图标
  set list(indent: 0.5em, body-indent: 0.5em, spacing: 1.0em, tight: true)
  // 上面的语句无法精确控制图标位置, 因此改用了下列方法重写 list
  // show list: it => stack(spacing: 0.6em, ..it.children.map(item => {
  //   grid(
  //     columns: (2em, 1fr),
  //     gutter: (0em),
  //     box({
  //       h(0.75em)
  //       faAngleRight
  //     }),
  //     pad(top: 0.05em, item.body)
  //   )
  // }))
  
  // 链接颜色
  show link: set text(fill: themeColor)
  
  // 主体设定
  set par(justify: true)
  show par: set block(spacing: 0.65em)
  
  // 首部与照片

  if headerCenter {
    assert(photograph == "", message: "can not centerize the name with the photo")
    align(alignment.center, header)
    introduction
  } else {
    grid(
      columns: (auto, 1fr, photographWidth),
      gutter: (gutterWidth, 0em),
      
      [#header 
      #introduction],
      if (photograph != "") {
        image(photograph, width: photographWidth)
      }
    )
  }

  body
}

#let pre(body) = text(body, font: (font.mono))
#let forceFont(font, body) = text(body, font: font)
#let forceWeightSize(body, weight, size) = text(body, weight: weight, size: size)

// 带竖线的侧边栏
#let sidebar(side, content, withLine: true, sideWidth: 12%, margin : 0.25em) = layout(size => {
  let sideSize = measure(width: size.width,height: size.height,side)
  let contentSize = measure(width: size.width * (100% - sideWidth),height: size.height,content)
  let height = calc.max(sideSize.height, contentSize.height) + 0.5em
  grid(
    columns: (sideWidth, 0%, 1fr),
    gutter: (0.75em),
    {
      set align(right)
      v(margin)
      side
      v(margin)
    },
    if (withLine) {line(end: (0em, height), stroke: 0.05em)},
    {
      v(margin)
      content
      v(margin)
    },
  )
})


// 个人信息
#let info(
  color: black,
  ..infos
) = {
    set text(font: (font.mono, font.cjk), fill: color)
    infos.pos().map(dir => {
      box({
        if "icon" in dir {
          if (type(dir.icon) == "string") {
            icon(dir.icon)
          } else {
            dir.icon
          }
        }
        h(0.15em)
        if "link" in dir {
          link(dir.link, dir.content)
        } else {
          dir.content
        }
      })
    }).join(h(0.5fr) + "·" + h(0.5fr))
    v(0.0em)
}


// 日期： 颜色变灰
#let date(body) = text(
  fill: rgb(128, 128, 128),
  size: 0.9em,
  body
)


// 技术: 字体变细
#let tech(body) = block({
  set text(weight: "regular")
  body
})

// 项目
#let item(
  title,
  desc,
  endnote
) = {
  v(0.25em)
  grid(
    columns: (75%, 1fr, auto),
    gutter: (0em),
    [#title #h(1fr) #desc],[], endnote
  )
}

