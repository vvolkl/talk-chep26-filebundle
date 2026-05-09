#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      How many fetcher threads?
    ]
  ]

  #place(top + right, dx: -0.35in + 6pt, dy: 1.20in + 6pt)[
    #rect(width: 5.85in * (1600 / 1100), height: 5.85in,
          fill: rgb("#00000026"), stroke: none, radius: 4pt)
  ]
  #place(top + right, dx: -0.35in, dy: 1.20in)[
    #image("../assets/pool_scan.pdf", height: 5.85in)
  ]

  #place(top + left, dx: 0.55in, dy: 1.55in)[
    #box(width: 3.7in)[
      #set text(size: 14pt, fill: text-mid)
      #set par(leading: 0.55em, spacing: 0.9em)

      Sweet spot at #kw(highlight)[4–8 threads] —
      matches the local-disk reference.

      #v(0.3em)
      Beyond 8, we're disk-bandwidth bound and adding workers
      slightly hurts (extra coordination overhead).

      #v(0.3em)
      #set text(size: 13pt, fill: text-light)
      Warm cvmfs (CPU floor) is #raw("1.12 s") — the absolute
      lower bound for `import ROOT` startup on this machine.
    ]
  ]
]
