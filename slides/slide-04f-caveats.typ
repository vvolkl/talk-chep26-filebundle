#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Caveats — bursty load and over-prefetching
    ]
  ]

  #place(top + left, dx: 0.35in + 6pt, dy: 1.20in + 6pt)[
    #rect(width: 5.85in * (1600 / 1100), height: 5.85in,
          fill: rgb("#00000026"), stroke: none, radius: 4pt)
  ]
  #place(top + left, dx: 0.35in, dy: 1.20in)[
    #image("../assets/req_burst.pdf", height: 5.85in)
  ]

  #place(top + right, dx: -0.55in, dy: 1.40in)[
    #box(width: 3.7in)[
      #set align(left)
      #set text(size: 18pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.9em)

      Same total downloads — but the .cvmfsbundle concentrates the
      requests into a #kw(highlight)[~0.5 s burst], peaking at
      #kw(highlight)[1480 req/s] vs 680 for OFF.

      #v(0.25em)
      #set text(size: 18pt, fill: text-mid)
      Implications:

      #set text(size: 18pt, fill: text-dark)
      #set list(indent: 0.3em, body-indent: 0.5em, marker: text(fill: highlight)[•])

      - Should be enabled judiciously, only on interactive clusters like lxplus
      - Prefetching more than required further strains the infrastructure
      - Rollout should be accorded with proxy admins

     
    ]
  ]
]
