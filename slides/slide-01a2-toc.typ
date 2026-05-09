#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let toc-item(num, label, sub, minor: false) = {
  let bullet-size = if minor { 1.0em } else { 1.3em }
  let num-size = if minor { 9pt } else { 11pt }
  let label-size = if minor { 13pt } else { 17pt }
  let label-color = if minor { text-mid } else { text-dark }
  stack(dir: ltr, spacing: 0.5em,
    box(
      width: bullet-size, height: bullet-size,
      fill: highlight.transparentize(80%),
      stroke: 1pt + highlight,
      radius: 50%,
    )[
      #set align(center + horizon)
      #text(size: num-size, weight: "bold", fill: highlight)[#num]
    ],
    box[
      #set text(size: label-size, weight: "bold", fill: label-color)
      #label
      #v(-0.3em)
      #set text(size: 12pt, weight: "regular", fill: text-mid, font: "Menlo")
      #sub
    ],
  )
}

#let milestone(tag, date, detail, done: false) = {
  let col = if done { accent-green } else { highlight }
  stack(dir: ttb, spacing: 0.25em,
    box(
      width: 1.8em, height: 1.8em,
      fill: col.transparentize(80%),
      stroke: 2pt + col,
      radius: 50%,
    )[
      #set align(center + horizon)
      #if done [
        #text(size: 12pt, fill: col, weight: "bold")[✓]
      ] else [
        #v(0.3em)
      ]
    ],
    text(size: 13pt, weight: "bold", fill: col, font: "Menlo")[#tag],
    text(size: 10pt, fill: text-mid)[#date],
    text(size: 10pt, fill: text-light)[#detail],
  )
}

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.45in)[
    #text(size: 32pt, weight: "bold", fill: text-dark)[ToC]
  ]

  // TOC — two-column list, filled top-to-bottom first
  #place(top + left, dx: 0.6in, dy: 1.35in)[
    #box(width: 10.6in)[
      #grid(
        columns: (1fr, 1fr),
        gutter: 0.6in,
        stack(dir: ttb, spacing: 0.55em,
          toc-item("1", [Containerized Testing], [the road to K8s deployments]),
          toc-item("2", [Stratum 1s: Partial replication], []),
          toc-item("3", [File bundles], [], minor: true),
        ),
        stack(dir: ttb, spacing: 0.55em,
          toc-item("4", [Monitoring], [], minor: true),
          toc-item("5", [Containers on CernVM-FS], [], minor: true),
        ),
      )
    ]
  ]

  // Timeline
  #place(bottom + left, dx: 0.6in, dy: -0.55in)[
    #box(width: 10.6in, height: 1.9in)[
      #set align(center)
      #v(0.2em)
      #text(size: 13pt, weight: "bold", fill: text-mid)[Release timeline]
      #v(0.55em)

      // timeline line
      #place(top + left, dx: 0.9in, dy: +0.5in)[
        #line(start: (0in, 0in), end: (8.9in, 0in), stroke: 1pt + text-mid)
      ]

      // milestones over the line
      #stack(dir: ltr, spacing: 1fr,
        milestone("2.13.3", "Oct 2025", [last stable], done: true),
        milestone("2.14~pre3", "Apr 2026", [tagged now], done: true),
        milestone("2.14", "~Jun 2026", [production release]),
        milestone("2.15", "~Q1 2027", [next cycle]),
      )
    ]
  ]
]
