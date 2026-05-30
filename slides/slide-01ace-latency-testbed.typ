#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

// Shared terminal colours
#let c-prompt = rgb("#4EC9B0")
#let c-cmd = rgb("#D4D4D4")
#let c-muted = rgb("#8A8F98")
#let c-good = rgb("#5BD6A8")
#let c-bad = rgb("#E06C75")

#let prompt(cmd) = [#text(fill: c-prompt)[\$ ]#text(fill: c-cmd)[#cmd]]

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)
  #set align(top + left)

  #place(top + left, dx: 0.6in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Latency in interactive use --- same picture on our testbed
    ]
  ]

  // Baseline: ROOT from a local-disk tarball
  #place(top + left, dx: 0.55in, dy: 1.5in)[
    #box(width: 8.7in, radius: 8pt, clip: true)[
      #block(width: 100%, inset: (x: 0.9em, y: 0.8em), fill: rgb("#1e1e1e"))[
        #set text(size: 15pt, font: "Menlo")
        #set par(leading: 0.65em, spacing: 0em)
        #text(fill: c-muted)[\# ROOT installed from a release tarball (local disk)]\
        #prompt[source root/bin/thisroot.sh]\
        #prompt[time python -c "import ROOT"]\
        #text(fill: c-muted)[real]#h(1.5em)#text(fill: c-good)[0m2.473s]\
        #text(fill: c-muted)[user#h(1.5em)0m1.821s]\
        #text(fill: c-muted)[sys#h(2.0em)0m0.234s]
      ]
    ]
  ]

  // Same import from /cvmfs with a cold cache
  #place(top + left, dx: 0.55in, dy: 4.0in)[
    #box(width: 12.5in, radius: 8pt, clip: true)[
      #block(width: 100%, inset: (x: 0.9em, y: 0.8em), fill: rgb("#0c164f"))[
        #set text(size: 15pt, font: "Menlo")
        #set par(leading: 0.65em, spacing: 0em)
        #text(fill: c-muted)[\# ROOT from /cvmfs, cold cache]\
        #prompt[sudo cvmfs\_config wipecache]\
        #prompt[source /cvmfs/sft.cern.ch/lcg/apps/releases/ROOT/x86_64-almalinux9.7-gcc115-opt/bin/setup.sh]\
        #prompt[time python -c "import ROOT"]\
        #text(fill: c-muted)[real]#h(1.5em)#text(fill: c-bad)[0m4.692s]\
        #text(fill: c-muted)[user#h(1.5em)0m1.918s]\
        #text(fill: c-muted)[sys#h(2.0em)0m0.412s]
      ]
    ]
  ]
]
