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
  let dropped = translate(
    zh: [退学],
    en: [Dropped]
  )
  let suspend = translate(
    zh: [休学],
    en: [Suspended]
  )

  let education = {
    let thu-date = [#translate-date(8, 2022) -- #suspend]
    translate(
      en: cv-entry(
        tl: [The second year of undergraduate in Pharmaceutical Science at *Tsinghua University*, China],
        tr: thu-date
      )[Member of TUNA and THUBA Technical Department],
      zh: cv-entry(
        tl: [清华大学，药学专业，本科二年级休学，中国],
        tr: thu-date
      )[清华大学 TUNA 协会成员，清华大学区块链协会技术部成员]
    )
  }

  // Work Experience Section

  let theta-wave = {
    let theta-wave-date = [#translate-date(4, 2025) -- #translate-date(6, 2025)]
    translate(
      en: cv-entry(
        tl: [*Thetawave*, Beijing, China, Remote],
        tr: theta-wave-date,
        bl: [Frontend Development Intern]
      )[
        - Core Responsibilities: Led the upgrade of the LLM chat interface from V1
          to V2, optimizing user experience and functional logic based on business
          requirements.

          1. UI/UX Enhancement: Refactored page layout using Ant Design and Shadcn UI
            components, and customized high-interaction chat components with Tailwind
            CSS to improve visual consistency and flow.
          2. Data & Logic Implementation: Integrated Vercel AI SDK to enable LLM
            dialogue API calls, and leveraged tRPC to connect to connect with backend
            services for fetching user's knowledge and notes library.

        - Non-Core Support: Assisted in implementing a real-time voice-to-text transcription
          feature for classroom scenarios, expanding technical expertise.

          1. Technical Implementation: Used WebSocket to establish real-time communication
            with the Volcengine TTS service, handling frontend audio capture, transmission,
            and backend text result parsing.
          2.
      ],
      zh: cv-entry(
        tl: [*Thetawave*, 北京, 中国, 远程],
        tr: theta-wave-date,
        bl: [实习前端工程师]
      )[

      ],
    )
  }

  let alpha-scope = {
    let alpha-scope-data = [#translate-date(6, 2025) -- #translate-date(7, 2025)]
    translate(
      en: cv-entry(
        tl: [*AlphaScopeX*, Beijing, China, Remote],
        tr: alpha-scope-data,
        bl: [Frontend Developer]
      )[
        - 
      ]
    )
  }

  let skills = {
    let pro-lang = {
      let experienced = "JavaScript | TypeScript"
      let comfortable = "Rust | Java | C++(<=11) | Python | Solidity | Scheme | Typst"
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
  theta-wave
  alpha-scope

  translate(zh: [== 项目经历], en: [== Related Projects])

  translate(zh: [== 技能], en: [== Skills])
  skills
}
