#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus
#import "theme.typ": *

#show: metropolis.setup.with(
  text-font: ("Atkinson Hyperlegible", "Arial", "Avenir Next", ),
  math-font: ("New Computer Modern Math", "STIX Two Math"),
  code-font: ("Source Code Pro", "Menlo"),
)

#set page(width: 13.333in, height: 7.5in, fill: ppx-bg)
#set text(fill: text-dark)
#set align(left)
#show emph: it => text(fill: highlight, it.body)

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)
  #set align(top + left)

  #place(top + left, dx: 0.5in, dy: 1.15in)[
    #box(width: 9.8in)[
      #text(size: 40pt, weight: "bold", fill: text-dark)[CernVM-FS Filebundles] \  #text(size: 30pt, weight: "bold", fill: text-dark)[for low-latency software distribution  \ in interactive usecases]

      #v(0.45em)



      #v(0.9em)

      #text(size: 18pt, fill: text-dark)[Valentin Volkl (valentin.volkl\@cern.ch), \
      Georgios Christodoulis (georgios.christodoulis\@cern.ch), \
      Jakob Blomer (jakob.blomer\@cern.ch)\

      Particular Thanks to Chris Burr (LHCb) for valuable input!
      ]
    ]
  ]

  #place(top + right, dx: -0.5in, dy: 3.05in)[
    #align(right)[
      #text(size: 18pt, fill: text-mid)[May 2026]\
      #text(size: 18pt, fill: text-mid)[CHEP 2026, Bangkok, Thailand]
    ]
  ]

  #place(bottom + left, dx: 0.5in, dy: -0.45in)[
    #image("assets/sft-banner-positive.png", height: 1.0in)
  ]

  #place(bottom + right, dx: -0.55in, dy: -0.4in)[
    #image("assets/cvmfs-logo.png", height: 1.4in)
  ]
]

#include "slides/slide-01-cvmfs-intro.typ"

// scale & infrastructure — world map of stratum servers
#include "slides/slide-01aa-scale.typ"

// strata + proxy + client-cache hierarchy diagram
#include "slides/slide-01ab-architecture.typ"

//#include "slides/slide-01b-client-server.typ"


// serial baseline — single thread, one file after the other
#include "slides/slide-01ad-bundle-timeline-serial.typ"

// implementation idea and how it works
#include "slides/slide-01ae-bundle-timeline.typ"

// librarian workflow — capture trace, build spec, publish
//#include "slides/slide-04ba-publish.typ"
#include "slides/slide-04bb-bundle-format.typ"

// performance results
#include "slides/slide-04c-bench-violin.typ"
#include "slides/slide-04d-bench-pool.typ"
#include "slides/slide-04e-bench-latency.typ"

// trade-offs and risks
#include "slides/slide-04f-caveats.typ"

// further work — direct I/O, packfiles, offline mode
#include "slides/slide-06-further-work.typ"

// terse wrap-up + violin recap
#include "slides/slide-07-conclusions.typ"

#include "slides/slide-99-contact.typ"
