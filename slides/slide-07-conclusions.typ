#import "@preview/polylux:0.4.0": *
#import "@preview/shadowed:0.3.0": shadow
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Conclusions
    ]
  ]

  // LEFT — takeaways
  #place(top + left, dx: 0.55in, dy: 1.45in)[
    #box(width: 4.8in)[
      #set text(size: 18pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.75em)
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #kw(highlight)[CVMFS_PREFETCH_FILEBUNDLES] is a powerful feature that can
        accelerate the startup of applications that need to read many files.

      - Librarians need to trace files read on startup and publish a
        #text(fill: highlight)[`.cvmfsbundle`] file as trigger for prefetching

      - Can match local disk performance
        - Even marginally faster in some circumstances!

      - Available (opt-in) in CVMFS v2.14 release date \~June 2026)
        
    ]
  ]

  // LEFT bottom — closing thanks
  #place(top + left, dx: 0.55in, dy: 5.75in)[
    #text(size: 26pt, weight: "bold", fill: text-dark)[Thanks! Questions?]\
    #v(0.5em)
    #text(size: 18pt, fill: text-mid)[Valentin Volkl --- #link("mailto:valentin.volkl@cern.ch")[#text(fill: accent-blue)[valentin.volkl\@cern.ch]]]
  ]

  // RIGHT — violin plot
  #place(top + right, dx: -0.45in, dy: 1.20in)[
    #shadow(dx: 6pt, dy: 6pt, blur: 10pt, fill: rgb(0, 0, 0, 38%), radius: 4pt)[
      #image("../assets/violin_bundle.pdf", height: 5.0in)
    ]
  ]
]
