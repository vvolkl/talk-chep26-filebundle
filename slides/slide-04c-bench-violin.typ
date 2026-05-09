#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Filebundle startup performance benchmark
    ]
  ]

  // Drop shadow: a soft dark rect placed underneath the plot, offset
  // slightly down and to the right.
  #place(top + left, dx: 0.35in + 6pt, dy: 1.20in + 6pt)[
    #rect(width: 5.85in * (1600 / 1100), height: 5.85in,
          fill: rgb("#00000026"), stroke: none, radius: 4pt)
  ]
  #place(top + left, dx: 0.37in, dy: 1.20in)[
    #image("../assets/violin_bundle.pdf", height: 5.85in)
  ]

  #place(top + right, dx: -0.55in, dy: 1.55in)[
    #box(width: 3.2in)[
      #set align(left)
      #set text(size: 16pt, fill: text-mid)
      #set par(leading: 0.55em, spacing: 0.9em)
      ROOT 6.36.12  deployed on an test CVMFS repository. \
       x86_64 host: AMD EPYC 7302 (2×16 cores / 64 threads @ ~3.0 GHz), 251 GB RAM,
   AlmaLinux 10.1, kernel 6.12


      #kw(highlight)[Matches local-disk performance.]
      

    ]
  ]
]
