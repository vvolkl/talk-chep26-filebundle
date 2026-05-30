#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Get in touch]
  ]

  #place(top + left, dx: 0.6in, dy: 1.65in)[
    #box(width: 6.2in)[
      #set text(size: 20pt, fill: text-dark)
      #set par(leading: 0.5em, spacing: 1.2em)

      #kw(highlight)[Source code]\
      #link("https://github.com/cvmfs/cvmfs")[
        #box(baseline: 20%, image("../assets/github-mark.svg", height: 20pt))
        #h(0.35em)
        #text(fill: accent-blue)[github.com/cvmfs/cvmfs]
      ]

      #kw(highlight)[Website & documentation]\
      #link("https://cernvm.cern.ch")[
        #text(fill: accent-blue)[cernvm.cern.ch]
      ]

      #kw(highlight)[Discussion forum]\
      #link("https://cernvm-forum.cern.ch")[
        #text(fill: accent-blue)[cernvm-forum.cern.ch]
      ]

      #kw(highlight)[CERN Mattermost]\
      #link("https://mattermost.web.cern.ch/cvmfs/")[
        #text(fill: accent-blue)[mattermost.web.cern.ch/cvmfs]
      ]
    ]
  ]

 

  #place(bottom + left, dx: 0.6in, dy: -0.5in)[
    #text(size: 22pt, weight: "bold", fill: text-dark)[Thanks! Questions?]\
    #v(0.3em)
    #text(size: 16pt, fill: text-mid)[Valentin Volkl --- #text(fill: accent-blue)[valentin.volkl\@cern.ch]]
  ]
]
