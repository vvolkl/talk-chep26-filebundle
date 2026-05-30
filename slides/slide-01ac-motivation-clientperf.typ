#import "@preview/polylux:0.4.0": *
#import "@preview/shadowed:0.3.0": shadow
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)
  #set align(top + left)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Motivation: slow cache coldness in interactive use]
  ]

  // Chris Burr's "Client performance" slide, extracted from his workshop deck
  #place(top + center, dy: 0.95in)[
    #shadow(dx: 0pt, dy: 6pt, blur: 18pt, spread: 0pt, radius: 6pt, fill: rgb(0, 0, 0, 60))[
      #box(radius: 6pt, clip: true)[
        #image("../assets/chrisburr-client-performance.png", width: 11.0in)
      ]
    ]
  ]

  // attribution with link to the original talk
  #place(top + center, dy: 2.1in, dx: 4in)[
    #set text(size: 24pt, fill: text-dark)
    Chris Burr, \
    #link("https://indico.cern.ch/event/1079490/contributions/4939521/attachments/2506388/4306645/2022-09-12_CVMFS-Workshop_LHCb.pdf")[#text(fill: highlight)[CernVM Users Workshop 2022]]
  ]
]
