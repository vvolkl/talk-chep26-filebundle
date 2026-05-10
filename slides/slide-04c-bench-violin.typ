#import "@preview/polylux:0.4.0": *
#import "@preview/shadowed:0.3.0": shadow
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Filebundle startup performance benchmark
    ]
  ]

  #place(top + left, dx: 0.37in, dy: 1.20in)[
    #shadow(dx: -6pt, dy: 6pt, blur: 10pt, fill: rgb(0, 0, 0, 38%), radius: 4pt)[
      #image("../assets/violin_bundle.pdf", height: 5.30in)
    ]
  ]

  #place(top + right, dx: -0.55in, dy: 1.55in)[
    #box(width: 3.2in)[
      #set align(left)
      #set text(size: 16pt, fill: text-mid)
      #set par(leading: 0.55em, spacing: 0.9em)
      Benchmarking testbed:
      
      ROOT 6.36.12  deployed on an test CVMFS repository. \
      Served on localhost.

      AMD EPYC 7302 (2×16 cores / 64 threads @ ~3.0 GHz), 251 GB RAM,
   AlmaLinux 10.1, kernel 6.12


      #kw(highlight)[Matches local-disk performance.]
      

    ]
  ]
]
