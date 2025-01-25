#import "@preview/cuti:0.3.0": show-cn-fakebold
#show: show-cn-fakebold
#import "template.typ": *

// 设置图标, 来源: https://fontawesome.com/icons/
// 如果要修改图标颜色, 请手动修改 svg 文件中的 fill="rgb(38, 38, 125)" 属性
// 例如可以使用 VS Code 的全局文本替换功能
#let faAward = icon("icons/fa-award.svg")
#let faBuildingColumns = icon("icons/fa-building-columns.svg")
#let faCode = icon("icons/fa-code.svg")
#let faEnvelope = icon("icons/fa-envelope.svg")
#let faGithub = icon("icons/fa-github.svg")
#let faGraduationCap = icon("icons/fa-graduation-cap.svg")
#let faLinux = icon("icons/fa-linux.svg")
#let faPhone = icon("icons/fa-phone.svg")
#let faWindows = icon("icons/fa-windows.svg")
#let faWrench = icon("icons/fa-wrench.svg")
#let faWork = icon("icons/fa-work.svg")

// 主题颜色
#let themeColor = rgb(38, 38, 125)

// 设置简历选项与头部
#show: resume.with(
  // 字体基准大小
  size: 10pt,
  // 标题颜色
  themeColor: themeColor,
  // 控制纸张的边距
  top: 1.5cm,
  bottom: 1.5cm,
  left: 2cm,
  right: 2cm,


  // 如果需要姓名及联系信息居中，请删除下面关于头像的三行参数，并取消headerCenter的注释
  //headerCenter : true,
  
  // 如果不需要头像，则将下面三行的参数注释或删除
  // photograph: "profile.jpg",
  // photographWidth: 10em,
  // gutterWidth: 2em,
)[

= 赵海波

#v(0.8em)

#info(
  color: themeColor,
  (
    // 其实 icon 也可以直接填字符串, 如 "fa-phone.svg" 
    icon: faPhone,
    content: "(+86) 137-3481-1106",
  ),
  // (
  //   icon: faBuildingColumns,
  //   content: "北京交通大学",
  // ),
  // (
  //   icon: faGraduationCap,
  //   content: "计算机科学与技术（双学位）",
  // ),
  // (
  //   icon: faGraduationCap,
  //   content: "电气工程",
  // ),
  (
    icon: faEnvelope,
    content: "haibozhao@bjtu.edu.cn",
    link: "haibozhao@bjtu.edu.cn"
  ),
  (
    icon: faGithub,
    content: "github.com/npofsi",
    link: "https://github.com/npofsi",
  ),
)
][
// #h(2em)  // 手动顶行, 2em 代表两个字的宽度

// 我是赵海波，现在是北京交通大学大学电气工程学院 2024 级在读博士研究生
// 喜欢一切新奇的东西，兴趣十分广泛
]


== #faGraduationCap 教育背景

#sidebar(withLine: true, sideWidth: 20%)[
  #h(0.2em) 2021.09 \u{2015} 2024.07 #h(1fr)
][
  #sidebar(withLine: false, sideWidth: 40%, margin: 0em)[
  *北京交通大学* · 学士学位 #h(1fr)

  #align(left)[ 詹天佑学院 ]
  ][
  #h(1fr) 电气工程及其自动化专业

  #h(1fr) 计算机科学与技术专业（双学位）
  ]
  // GPA: 4.48 / 5 · Rank: 15%
]

#sidebar(withLine: true, sideWidth: 20%)[
  #h(0.2em) 2024.09 \u{2015} 至今 #h(1fr)
][
  #sidebar(withLine: false, sideWidth: 40%, margin: 0em)[
  *北京交通大学* · 博士学位（在读） #h(1fr)

  #align(left)[ 电气工程学院 ]
  ][
  #h(1fr) 电气工程
  ]
  // GPA: 4.48 / 5 · Rank: 15%
]

== #faCode 项目经历

#item(
  link(
    "https://github.com/beyondstorage/go-service-ftp",
    [ #forceWeightSize([*BeyondStorage / gostorage-ftp*], "bold", 11pt) ]
  ),

  [  ],

  date[ 2021 年 07 月 – 2022 年 01 月 ]
)
2021 开源软件供应链点亮计划
#tech[ Go, FTP(RFC 959) ]

为 BeyondStorage 下的对象文件系统中间件 go-storage 提供 FTP 协议支持

- 撰写软件 RFC，实现 FTP 协议功能，实现对象文件系统的 read、write、list 等基本操作
- 使用 go-codegenutil 基于 go-storage 中间件模板生成兼容性代码
- 项目实现了通过 FTP 协议对其他不同的对象文件系统（如 Amazon S3、Google GCS 等）进行操作的功能

#item(
  link(
    "",
    [ #forceWeightSize([*基于PINN的耦合非线性薛定谔方程求解*], "bold", 11pt) ]
  ),
  [  ],
  date[ 2022 年 11 月 – 2023 年 06 月 ]
)
大学生创新创业大赛
#tech[ Python, PyTorch, Numpy, Scipy, Pandas, Matplotlib ]

使用 Python 机器学习框架 PyTorch, 基于 PINN（物理信息神经网络）对方程进行AI预测求解

- 使用 Scipy、Numpy、Pandas 组织生成部分方程解数据与边界条件，输入网络进行训练

#item(
  link(
    "",
    [ #forceWeightSize([*RWPS 数据采集分析软件*], "bold", 11pt) ]
  ),
  [  ],
  date[ 2023 年 05 月 – 2024 年 11 月 ]
)
机车避雷器监测装置开发 - 北京交通大学 · 牵引供电实验室
#tech[ .NET Framework WPF, C\#, SQLite, EntityFramework, GPS/NMEA, 串口开发, 领域驱动开发   ]

RWPS(Railway Power Supervisor)软件及测量装置提供了在机车上对供电信息进行持续采集和监测的能力

- 基于 Modbus 及 NMEA 串口协议与传感器及 GPS 交互获取数据，并解决数据密集型软件的优化问题
- 基于 .NET Framework 开发界面，包括实时数据展示、录制及回放、特殊事件触发展示等窗口
- 基于 SQLite 数据库与ORM框架 EntityFramework 开发数据录制、回放及导出功能


// == #faWrench 专业技能

== #faAward 获奖情况

#item(
  [ *大学生数学建模竞赛* ],
  [ *校级 三等奖* ],
  date[ 2023 年 03 月 ]
)

#item(
  [ *大学生程序设计竞赛* ],
  [ *校级 二等奖* ],
  date[ 2022 年 05 月 ]
)



// == #faWork 实习与工作经历

// 在这里添加你的实习经历

== #faWrench 职业技能

#sidebar(withLine: false, sideWidth: 12%)[
  // *职业技能*
  
  *编程语言*

  *仿真验证*
][
  // CET-6
  
  Kotlin, Python, C\#, Go, C++, JavaScript, SystemVerilog

  MATLAB & Simulink, Vivado
]


// #item(
//   link(
//     "https://github.com/OrangeX4/Latex-Sympy-Calculator",
//     [ *Latex Sympy Calculator* ]
//   ),
//   [ *个人项目* ],
//   date[ 2021 年 02 月 – 2021 年 04 月 ]
// )

// #tech[ NodeJS, Python, VS Code ]

// 一个用于在 VS Code 中使用 LaTeX 数学公式进行「科学计算」的插件

// - 使用 ANTLR 将 LaTeX 语句编译为 Sympy 语句
// - 通过 Flask 搭建本地 HTTP 服务器与 VS Code 插件进行通信
// - 可以进行多种类型的科学计算，如积分求导、矩阵计算、无穷级数计算等

// #item(
//   link(
//     "https://github.com/OrangeX4/Reversi",
//     [ *黑白棋 Reversi* ]
//   ),
//   [ *课程项目* ],
//   date[ 2021 年 02 月 – 2021 年 04 月 ]
// )

// #tech[ React, Python, AI ]

// 基于 React 与 Antd 的黑白棋前端，与基于 Python 的黑白棋 AI 后端

// - 使用基于评估函数的 BFS 实现了黑白棋 AI，并实现了 Alpha-Beta 剪枝
// - 基于 React 搭建了一个黑白棋平台前端，支持玩家对战、人机对战和 AI 对战
// - 在后端使用 Flask 及 Socket.io 库，实现了玩家之间的联机对战

// == #faBuildingColumns 校园经历

// #item(
//   [ *微软学生俱乐部技术部部长* ],
//   [],
//   date[ 2021 年 09 月 – 2022 年 09 月 ]
// )