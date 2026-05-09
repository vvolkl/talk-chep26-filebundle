#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[]
  ]

  #place(top + left, dx: 0.8in, dy: 1.6in)[
    #box(width: 6.5in)[
      #set text(size: 22pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.75em)

      • Fundamental redesign of unpacker #text(fill: accent-green, weight: "bold")[✓]

      • Quotas and expiration dates

      • Push- instead of pull model

      #v(0.6em)

      • Partial Replication

      • Packing small files

      • Asynchronous GC
    ]
  ]

  #place(top + left, dx: 6.9in, dy: 1.0in)[
    #set text(size: 50pt, fill: accent-green)
    $ stretch(\}, size: #4.3in) $
  ]

  #place(top + left, dx: 8.2in, dy: 3.05in)[
    #text(size: 34pt, weight: "bold", fill: accent-green)[CernVM-CR]
  ]

    #place(top + left, dx: 8.1in, dy: 4.05in)[
    #text(size: 24pt, weight: "bold", fill: white)[Standalone Container
    \ Registry based on  \
    CernVM-FS]
  ]
]
