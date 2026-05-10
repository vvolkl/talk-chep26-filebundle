#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[CernVM-Filesystem]
  ]

  // Top-left: ROOT install from a release tarball
  #place(top + left, dx: 0.3in, dy: 1.55in)[
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
        #set text(size: 14pt, font: "Menlo")
        #set par(leading: 0.6em, spacing: 0em)
        #text(fill: rgb("#4EC9B0"))[\$ ]#text(fill: rgb("#D4D4D4"))[wget root.cern/dl/root_v6.36.12-linux.tar.gz]\
        #v(0.4em)
        #text(fill: rgb("#4EC9B0"))[\$ ]#text(fill: rgb("#D4D4D4"))[tar -xzf root_v6.36.12-linux.tar.gz]\
        #v(0.4em)
        #text(fill: rgb("#4EC9B0"))[\$ ]#text(fill: rgb("#D4D4D4"))[source root/bin/thisroot.sh]\
        #v(0.4em)
        #text(fill: rgb("#4EC9B0"))[\$ ]#text(fill: rgb("#D4D4D4"))[python -c "import ROOT"]
      ]
    ]
  ]

  // Bottom-left: same goal, resolved via the LCG view on CVMFS
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
        #set text(size: 14pt, font: "Menlo")
        #set par(leading: 0.6em, spacing: 0em)
        #text(fill: rgb("#4EC9B0"))[\$ ]#text(fill: rgb("#D4D4D4"))[source /cvmfs/sft.cern.ch/lcg/views/\\]\
        #h(2.0em)#text(fill: rgb("#D4D4D4"))[LCG_109/x86_64-el9-gcc13-opt/setup.sh]\
        #v(0.4em)
        #text(fill: rgb("#4EC9B0"))[\$ ]#text(fill: rgb("#D4D4D4"))[python -c "import ROOT"]
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
