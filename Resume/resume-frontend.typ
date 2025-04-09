#import "utils/cv.typ": *

#let Chinese = 0
#let English = 1

#let run-i18n(mode) = {
  let translate(zh:[], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let translate-stack = translate(zh: [技术栈], en: [Technical Stack])
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let education = {
    let thu-date = [#translate-date(8, 2022) -- #current]
    translate(
      en: cv-entry(
        tl: [The second year of undergraduate in Pharmaceutical Science at *Tsinghua University*, China],
        tr: thu-date
      )[Member of Tuna and THUBA Technical Department],
      zh: cv-entry(
        tl: [清华大学，药学专业，本科二年级在读，中国],
        tr: thu-date
      )[清华大学 TUNA 协会成员，清华大学区块链协会技术部成员]
    )
  }

  let thuba = {
    let thuba-date = [#translate-date(3, 2025) -- #current]
    translate(
      en: cv-entry(
        tl: [*THU Blockchain Association*, Tsinghua University, Beijing, China],
        tr: thuba-date,
        bl: [Frontend Developer, Smart Contract Developer]
      )[
        - As a frontend developer, co-worked on participating in #link("https://z2h.tech")[VitaFlux-ZTH] Community Hackathon.
      ],
      zh: cv-entry(
        tl: [*清华大学区块链协会*，清华大学，北京，中国],
        tr: thuba-date,
        bl: [前端开发，智能合约开发]
      )[
        - 作为前端开发人员，组队参与 #link("https://z2h.tech")[VitaFlux-ZTH] 社区黑客松比赛
      ]
    )
  }

  let facesun-frontend = {
    translate(
      en: cv-entry(
        tl: [*Facesun Frontend*, the frontend part of Chaoyang Inspection System],
        tr: link-for-github("AshGreyG/Facesun-Frontend")
      )[
        - #translate-stack: React + React Router + React i18n Next + Axios + Material Design Icons
        - Design the UI of Facesun according to the design concept of Material Design 3 (MD3).
        - Receive data from the backend using Axios and use TypeScript's static typing to constrain the JSON data sent from the backend.
        - Use React Router to develop a login page, a working page and an administrator user management page.
        - Use React i18n Next to add English and Chinese interface languages.
      ],
      zh: cv-entry(
        tl :[*Facesun Frontend*, 北京市朝阳区网警自动化勘验系统科研项目的前端部分],
        tr: link-for-github("AshGreyG/Facesun-Frontend")
      )[
        - #translate-stack: React + React Router + React i18n Next + Axios + Material Design Icons
        - 根据 Material Design 3 (MD3) 设计思想设计界面UI
        - 使用 Axios 获取后端 API 传回的 JSON 数据并用 TypeScript 静态类型约束后端数据
        - 使用 React Router 设计登录页面，工作页面以及管理员用户管理界面
        - 使用 React i18n Next 添加中文和英文的界面语言
      ]
    )
  }

  let type-challenges = {
    translate(
      en: cv-entry(
        tl: [*Type Challenges*, Personal solutions to TypeScript type system challenges],
        tr: link-for-github("AshGreyG/To-Realize-Type-Challenges")
      )[
        - Learn some useful utility types like *Currying*, *Union-to-Intersection*.
        - Find corner cases of TypeScript type system like *Equal* utility type checkers and a bug of template literal and unicode (report an #link("https://github.com/microsoft/TypeScript/issues/61525")[issue], closed as duplicate).
        - Participate in open-source projects, show my solutions in the community.
      ],
      zh: cv-entry(
        tl: [*Type Challenges*, 对 TypeScript 类型系统难题的个人解答],
        tr: link-for-github("AshGreyG/To-Realize-Type-Challenges")
      )[
        - 学习了有用的类型工具，例如类型层面的函数柯里化，使用协变和逆变实现联合类型到交叉类型的映射工具
        - 发现 TypeScript 类型系统的边缘案例，例如实体层面的 *Equal* 工具类型检查器，以及一个模板字符串相关的 Bug （上报 #link("https://github.com/microsoft/TypeScript/issues/61525")[issue]，与现有的 issue 类似而关闭）
        - 参与开源项目，在社区中分享我的解答
      ]
    )
  }

  let skills = {
    let pro-lang = {
      let experienced = "JavaScript TypeScript"
      let comfortable = "Java C++(<=11) Python Solidity Scheme Typst"
      translate(
        en: [
          - Programming Languages: multilingual (not limited to any specific language), experienced in #experienced, comfortable with #comfortable.
        ],
        zh: [
          - 编程语言: 多语言使用者（编程不受特定语言限制），熟悉 #experienced，较为熟悉 #comfortable
        ]
      )
    }
    let tools = {
      translate(
        en: [
          - Tools: familiar with Linux and shell script, use Arch Linux for development in daily work, experienced in using Git for team collaboration and version control, and have some knowledge of Github Action.
        ],
        zh: [
          - 工具: 熟悉 Linux 和 Shell 脚本，日常使用 Arch Linux 进行开发，熟练使用 Git 进行团队合作和版本控制，了解 Github Action
        ]
      )
    }
    let html = {
      translate(
        en: [
          - HTML: rewrote the source code of Mustache, Handlebars, EJS and Pug.
        ]
      )
    }
    let css = {
      translate(
        en: [
          - CSS: familiar with CSS3, experienced in using flexbox and grid layout to create complex web page layouts, proficient in using CSS pre-processor SCSS, Less, Stylus and atomic CSS library Tailwind CSS and Windi CSS.
        ],
        zh: [
          - CSS: 熟悉 CSS3，熟练使用弹性盒模型以及网格布局创建复杂网页。/* 熟悉 CSS 预处理器 SCSS，Less，Stylus 以及 原子化 CSS 库 Tailwind CSS 和 Windi CSS */
        ]
      )
    }
    let javascript = {
      let typescript-repo = link("https://github.com/AshGreyG/To-Realize-TypeScript/tree/main/src/lib")[TypeScript]
      let underscore-repo = link("https://github.com/AshGreyG/To-Realize-Underscore")[Underscore]
      translate(
        en: [
          - JavaScript: familiar with JavaScript (ES6+), currently rewriting the #typescript-repo library of JavaScript language API, now focus on rewriting an utility JavaScript library #underscore-repo
        ],
        zh: [
          - JavaScript: 熟悉 JavaScript (ES6+)，最近正在重写 #typescript-repo 中的 JavaScript API 库以及 JavaScript 工具库 #underscore-repo
        ]
      )
    }
    let typescript = {
      translate(
        en: [
          - TypeScript: understand the type system of TypeScript, experienced in writing complicated utility type.
        ],
        zh: [
          - TypeScript: 理解 TypeScript 类型系统，在实践中能够编写复杂的工具类型
        ]
      )
    }
    let framework = {
      translate(
        en: [
          - Framework: familiar with React and its peripheral ecosystem like React Router, Jotai and Zustand.
        ],
        zh: [
          - 框架: 熟悉 React 框架及其周边生态
        ]
      )
    }
    pro-lang
    tools
    css
    javascript
    typescript
    framework
  }

  translate(en: [= #smallcaps[Grey He]], zh: [= #smallcaps[AshGrey] (何昱晖)])

  [#link("mailto:huaier.ashgrey@gmail.com")[huaier.ashgrey\@gmail.com] $dot.c$ #link-for-icon("https://www.huaier-ashgrey.top") $dot.c$ #link-for-icon("https://github.com/AshGreyG", icon: "github")]

  translate(zh: [== 教育经历], en: [== Education])
  education

  translate(zh: [== 工作经历], en: [== Work Experience])
  thuba

  translate(zh: [== 项目经历], en: [== Related Projects])
  facesun-frontend
  type-challenges

  translate(zh: [== 技能], en: [== Skills])
  skills
}