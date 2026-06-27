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
            with the Tencent Cloud TTS service, handling frontend audio capture, transmission,
            and backend text result parsing.
          2. Collaboration: Aligned with the backend team on API specifications to ensure
            WebSocket connection stability and low-latency data transfer (average delay
            < 200ms).
      ],
      zh: cv-entry(
        tl: [*Thetawave*, 北京, 中国, 远程],
        tr: theta-wave-date,
        bl: [实习前端工程师]
      )[
        - 核心职责：主导大模型对话页面从 V1 到 V2 的升级迭代，聚焦用户体验优化与功能逻辑落地。

          1. 界面与交互升级：基于 Ant Design 与 Shadcn UI 重构对话页面布局，使用 TailwindCSS
            定制个性化的快捷 Prompt 选项组件，提升界面一致性与用户操作的流畅度。
          2. 大模型对话集成：通过 Vercel AI SDK 对接大模型 API，结合 tRPC 与后端服务协同，实现
            用户个性化快捷 Prompt。

        - 非核心支持：协助完成课堂场景下的语音转文字实录功能，拓展技术应用边界。
          
          1. 技术方案落地：使用 WebSocket 建立与腾讯云 TTS 模型的实时通信，负责前端音频数据采集、
            传输与后端转文字结果的解析与展示。
          2. 协作支持：与后端团队对齐接口规范，确保 WebSocket 连接的稳定性与数据传输的低延迟（
            平均延迟 < 200ms）。
      ],
    )
  }

  let alpha-scope = {
    let alpha-scope-date = [#translate-date(6, 2025) -- #translate-date(7, 2025)]
    translate(
      en: cv-entry(
        tl: [*AlphaScopeX*, Beijing, China, Remote],
        tr: alpha-scope-date,
        bl: [Frontend Developer]
      )[
        - Core Responsibilities: As the sole frontend engineer, led the rapid development
          and launch of the product MVP to validate business hypotheses from 0 to 1.

          1. Rapid Delivery: Leveraged Next.js for project setup, combined with Tailwind
            CSS and Shadcn UI and used Axios and Next.js API routes to build a RESTful API
            client layer. Completed end-to-end development from requirement implementation
            to production deployment within 15 days, ensuring fast time-to-market.
          2. Visualization Module Development: Independently built a Canvas-based rendering
            module to achieve high-performance mini K-line chart visualization and adjusted
            to different themes.
          3. Open-Source Library Adaption: Leveraged TradingView's lightweight library,
            adapted it to token price data requirements and quickly implemented dynamic
            rendering and interactive feature for crypto token line charts.
          4. Real-Time Data Communication: Developed a universal `useWebsocket` hook for
            WebSocket management, encapsulating connection handling, message subscription
            and auto-reconnect logic. Reused across market data, order notifications, and
            other scenarios, cutting 70% redundant development effort.
      ],
      zh: cv-entry(
        tl: [*AlphaScopeX*, 北京, 中国, 远程],
        tr: alpha-scope-date,
        bl: [前端工程师]
      )[
        - 核心职责：作为团队唯一前端工程师，主导核心产品 MVP 的快速研发与上线，支撑业务
          从 0 到 1 验证。

          1. 极速交付：基于 Next.js 全栈框架搭建项目，结合 Tailwind CSS 与 Shadcn UI 组件库，
            同时整合 Axios 和 Next.js API Routes 构建 RESTful API 调用层。15 天内完成从需求
            落地到生产环境部署的全流程，保障产品快速上线。
          2. 迷你 K 线可视化：针对金融场景核心需求，独立封装 Canvas 绘制组件，实现迷你 K 线
            图的高性能渲染与动态适配夜间主题。
          3. 开源库适配与提效：基于 Tradingview 开源轻量级 K 线库 lightweight 封装适配代币
            价格数据的绘制逻辑，包括时间戳转换与价格精度的处理，快速实现代币线图的动态渲染
            和交互。
          4. 实时数据通信：基于 WebSocket 设计通用 `useWebsocket` hook 函数，封装连接管理、
            消息订阅与异常重连逻辑，复用至具体代币的行情数据的场景，降低 50% 重复代码。
      ]
    )
  }

  let algorithm-tsts = translate(
    en: cv-entry(
      tl: [*Algorithm-TsTs*, Type Helper Toolkit],
      tr: link-for-github("AshGreyG/Algorithm-TsTs")
    )[
      1. TypeScript Type System Practice: Led the development of an algorithm-oriented
        Type Helper toolkit using TypeScript's type metaprogramming. Leveraged conditional
        types, template literal types and type inference to enforce type constraints
        for algorithmic logic, addressing type safety and logical consistency in complex
        business scenarios.
      2. AI-Powered Code Review: Integrated Sourcery AI's automated code review bot to
        design custom rules, reducing manual code review time by 45%.
      3. Github-Action: Built an automated unit testing pipeline with Github Actions, 
        integrating TypeScript type checking.
    ],
    zh: cv-entry(
      tl: [*Algorithm-TsTs*, Type Helper 工具集],
      tr: link-for-github("AshGreyG/Algorithm-TsTs")
    )[
      1. TypeScript 类型系统实践：主导开发基于 TypeScript 类型元编程的算法型 Type Helper
        工具集，通过高级类型 Conditional Types, Template Literal Types 与类型推断实现
        算法逻辑的类型约束，解决复杂业务场景下类型安全与逻辑一致性问题。
      2. AI 辅助代码审计：集成 Sourcery AI 自动 Code Review 功能，将代码审计效率提升
        45%。
      3. 自动单元测试：基于 Github Actions 搭建自动化单元测试流水线，集成 TypeScript
        类型检查。
    ]
  )

  let skills = {
    let pro-lang = {
      let experienced = "JavaScript | TypeScript"
      let comfortable = "Rust | Java | C++(≤11) | Python | Solidity | Scheme | Typst"
      translate(
        en: [
          - Programming Languages: multilingual (not limited to any specific language),
            experienced in #experienced, comfortable with #comfortable.
        ],
        zh: [
          - 编程语言: 多语言使用者（编程不受特定语言限制），熟悉 #experienced，较为熟悉 #comfortable
        ]
      )
    }
    let tools = {
      translate(
        en: [
          - Tools: familiar with Linux and shell script, use Arch Linux for development in 
            daily work, experienced in using Git for team collaboration and version control, 
            and have some knowledge of Github Action.
        ],
        zh: [
          - 工具: 熟悉 Linux 和 Shell 脚本，日常使用 Arch Linux 进行开发，熟练使用 Git 进行团队
            合作和版本控制，了解 Github Action
        ]
      )
    }
    let css = {
      translate(
        en: [
          - CSS: Proficient in core CSS syntax (Flexbox/Grid layouts, responsive design, 
            media queries), skilled in the CSS preprocessor Stylus (variables, mixins, 
            nested syntax), and adept at leveraging the utility-first framework Tailwind
            CSS for rapid cross-device (PC/Mobile) interface development. Maintained design
            system consistency across 4+ projects.
        ],
        zh: [
          - CSS：熟练掌握 CSS 核心语法（Flexbox/Grid 布局、响应式设计、媒体查询），精通
            CSS 预处理器 Stylus （变量、Mixin、嵌套语法），擅长通过原子化工具类快速构建
            页面，深度使用 Tailwind CSS 实现多端适配（PC/移动端）与设计系统一致性维护，
            累计主导 4+ 个项目的前端样式开发与维护。
        ]
      )
    }
    let javascript = {
      translate(
        en: [
          - JavaScript: Proficient in ES6+ core syntax (arrow functions, destructuring,
            classes, modules), skilled in asynchronous programming (Promise/Async/Await, 
            event loop). Experienced with modern frontend framework React, Next.js with
            its component-based design.
        ],
        zh: [
          - JavaScript: 熟悉 ES6+ 核心语法（箭头函数、解构赋值、类、模块化），熟练异步编程
            （Promise/Async/Await，事件循环机制）。熟悉现代前端框架 React、Next.js 的状态
            管理和组件化设计，了解 Next.js 服务端组件。
        ]
      )
    }
    let typescript = {
      translate(
        en: [
          - TypeScript: Proficient in TypeScript's type system (primitive types, literal
            types, type inference, recursive types), skilled in leveraging generics,
            conditional types, and mapped types for engineering-grade type safety.
        ],
        zh: [
          - TypeScript: 深度掌握 TypeScript 类型系统（基础类型、字面量类型、类型推断以及
            递归类型），精通泛型、条件类型、映射类型等高级特性的工程化应用。
        ]
      )
    }
    pro-lang
    tools
    css
    javascript
    typescript
  }

  translate(en: [= #smallcaps[Grey He]], zh: [= #smallcaps[AshGrey] (何昱晖)])

  [#link("mailto:huaier.ashgrey@gmail.com")[huaier.ashgrey\@gmail.com] $dot.c$ #link-for-icon("https://www.huaier-ashgrey.top") $dot.c$ #link-for-icon("https://github.com/AshGreyG", icon: "github")]

  translate(zh: [== 教育经历], en: [== Education])
  education

  translate(zh: [== 工作经历], en: [== Work Experience])
  theta-wave
  alpha-scope

  translate(zh: [== 项目经历], en: [== Related Projects])
  algorithm-tsts

  translate(zh: [== 技能], en: [== Skills])
  skills
}
