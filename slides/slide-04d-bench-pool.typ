#import "@preview/polylux:0.4.0": *
#import "@preview/shadowed:0.3.0": shadow
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Prefetching thread pool
    ]
  ]

  #place(top + right, dx: -0.35in, dy: 1.20in)[
    #shadow(dx: 6pt, dy: 6pt, blur: 10pt, fill: rgb(0, 0, 0, 38%), radius: 4pt)[
      #image("../assets/pool_scan.pdf", height: 5.30in)
    ]
  ]

  #place(bottom + left, dx: 0.55in, dy: -1.55in)[
    #box(width: 3.1in)[
      #set text(size: 19pt, fill: text-mid)
      #set par(leading: 0.55em, spacing: 0.9em)

       Prefetching employs a pool of worker threads.

       Size can be set with CVMFS_BUNDLE_POOL_SIZE,
       but saturates after 8 (which is the default). 
      
    ]
  ]
]
