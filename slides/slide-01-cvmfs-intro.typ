#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[CernVM-Filesystem]
  ]

  // Left: terminal showing bash command-not-found hook
  #place(top + left, dx: 0.3in, dy: 1.55in)[
    #box(
      width: 5in,
      radius: 8pt,
      clip: true,
    )[
      // Title bar
  //    #block(
  //      width: 100%,
 //       inset: (x: 05em, y: 0.4em),
  //      fill: rgb("#3C3C3C"),
 //     )[
 //       #set align(center)
        //#text(size: 12pt, font: "Menlo", fill: rgb("#AAAAAA"))[bash]
  //    ]// Terminal body
      #block(
        width: 100%,
        inset: (x: 0.9em, y: 0.75em),
        fill: rgb("#1E1E1E"),
      )[
        #set text(size: 15pt, font: "Menlo")
        #set par(leading: 0.6em, spacing: 0em)
        #text(fill: rgb("#4EC9B0"))[\[user\@host \~\]\$ ]#text(fill: rgb("#D4D4D4"))[python hello.py]\
        #v(0.4em)
        #text(fill: rgb("#F44747"))[-bash: python: command not found]\
        #v(0.6em)
        #text(fill: rgb("#DCDCAA"))[Did you mean to install \'python\'\
        from package \'python\'?]
      ]
    ]
  ]

  // Left-bottom: same command, now resolved via EESSI on CVMFS
  #place(top + left, dx: 0.3in, dy: 3.9in)[
    #box(
      width: 5in,
      radius: 8pt,
      clip: true,
    )[
      #block(
        width: 100%,
        inset: (x: 0.9em, y: 0.75em),
        fill: rgb("#1E1E1E"),
      )[
        #set text(size: 15pt, font: "Menlo")
        #set par(leading: 0.6em, spacing: 0em)
        #text(fill: rgb("#4EC9B0"))[\[user\@host \~\]\$ ]#text(fill: rgb("#D4D4D4"))[source /cvmfs/software.eessi.io/versions/2023.06/init/bash]\
        #v(0.4em)
        #text(fill: rgb("#DCDCAA"))[\{EESSI 2023.06\} ]#text(fill: rgb("#4EC9B0"))[\[user\@host \~\]\$ ]#text(fill: rgb("#D4D4D4"))[python hello.py]\
        #v(0.4em)
        #text(fill: rgb("#6FCF97"))[Hello, EESSI!]
      ]
    ]
  ]

  // Right: CernVM-FS definition
  #place(top + right, dx: -0.3in, dy: 1.55in)[
    #box(
      width: 5.7in,
      inset: (x: 1.1em, y: 1.1em),
      //stroke: 1.2pt + highlight,
      //fill: highlight.transparentize(93%),
      radius: 8pt,
    )[
      #set align(left)
      #set text(size: 20pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.85em)

      The #kw(highlight)[CernVM-Filesystem] is \ an
      #kw(highlight)[on-demand], #kw(highlight)[read-only]
      filesystem \for #kw(highlight)[software distribution].

      Software is fetched transparently from a
      content-addressed server — only the files
      actually opened are downloaded.
    ]
  ]
]
