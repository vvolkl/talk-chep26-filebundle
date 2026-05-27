#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)
  #set align(top + left)

  // full-bleed world map filling the area below the title strip
  #place(top + left, dy: 0.95in)[
    #image("../assets/worldmap2.png", width: 13.333in, height: 6.55in)
  ]

  // title
  #place(top + left, dx: 0.6in, dy: 0.35in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[CernVM-FS scale: and infrastructure]
  ]

  // info box on the right with the scale figures
  #place(top + right, dx: -0.45in, dy: 1.85in)[
    #box(
      width: 6.7in,
      inset: (x: 1.0em, y: 0.95em),
      radius: 12pt,
      fill: white,
    )[
      #set align(left)
      #set text(size: 18pt, fill: text-dark)
      #set par(leading: 0.5em, spacing: 0.75em)
      #set list(indent: 0pt, body-indent: 0.5em, marker: text(fill: text-dark)[•])

      - #kw(highlight)[Software, containers, auxiliary data for HENP],
        - EUCLID, LIGO, LSST, SKA, EESSI…
      - #kw(highlight)[\~ 15 Stratum 1s] (Europe, North & South America, Asia)
      - #kw(highlight)[\~ 33 B files] in the `/cvmfs` tree
      - #kw(highlight)[\~ 2 PB] of data accessible through `/cvmfs` \
        #text(size: 14pt, fill: text-mid)[out of which 1.5 PB in #text(fill: highlight)[external] files; \
        proven to scale up to 100 PB]
      - #kw(highlight)[> 8k container images]
      - #kw(highlight)[293 repositories] (up from 260 last year)
    ]
  ]
]
