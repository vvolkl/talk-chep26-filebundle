#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg-purple)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Partial replication (prototype in 2.14)]
    #v(-0.2em)
   
  ]

 

  #place(top + left, dx: 0.75in, dy: 2.75in)[
    #box(width: 4.1in)[
      #set text(size: 19pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.75em)

      Different sites often only need to serve
      #kw(highlight)[one architecture] locally, but still want to keep a persistant copy.


     #v(2em)
      Also allows to re-factor CVMFS shrinkwrap!



      
    ]
  ]

  #place(top + right, dx: -0.6in, dy: 2.55in)[
    #box(
      width: 5.4in,
      inset: (x: 0.9em, y: 0.8em),
      fill: panel-bg,
      radius: 5pt,
    )[
      #set align(left)
      #text(size: 18pt, weight: "bold", fill: highlight)[Example software tree]\
      #v(0.35em)
      #set text(size: 15pt, font: "Menlo", fill: text-dark)
      software.example.io/\
      ├─ software/linux/x86_64   #text(fill: accent-green)[← keep]\
      ├─ software/linux/aarch64  #text(fill: accent-amber)[← exclude]\
      ├─ software/linux/ppc64le  #text(fill: accent-amber)[← exclude]\
      ├─ software/linux/riscv64  #text(fill: accent-amber)[← exclude]\
      └─ ...
    ]
  ]
]
