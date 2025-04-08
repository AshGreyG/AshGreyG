#let cv-line() = {
  v(-3pt);
  line(length: 100%, stroke: gray);
  v(-10pt);
}

#let cv-entry(
  tl: lorem(2),
  tr: "1145/14 - 1919/8/10",
  bl: [],
  br: [],
  content
) = {
  block(
    inset: (left: 0pt),
    tl + h(1fr) + tr +
    linebreak() +
    if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } +
    content
  )
}

#import "@preview/fontawesome:0.5.0": *
#let link-icon = "link"
#let link-for-icon(url, text: [], icon: link-icon) = {
  if text == [] {
    text = url
  }
  link(url)[#fa-icon(icon) $space.en$ #text]
}

#let link-for-github(user-repo) = {
  link("https://github.com/" + user-repo)[#fa-icon("github") $space.en$ #user-repo]
}

#let cv(body) = {
  set par(justify: true)

  show heading.where(
    level: 1
  ): set text(
    size: 18pt,
    weight: "light",
  )

  let the-font = (
    "Palatino Linotype",
    "Source Han Serif SC",
    "Source Han Serif",
  )
  show heading.where(
    level: 2
  ): it => text(
    size: 12pt,
    font: the-font,
    weight: "bold",
    block(
      cv-line() + it,
    )
  )
  set list(indent: 0pt)
  set text(
    size: 9pt,
    font: the-font
  )

  show link: it => underline(offset: 2pt, it)
  set page(
   margin: (x: 0.5cm, y: 0.9cm),
   numbering: "1 / 1"
  )
  set par(justify: true)

  body
}
