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
    #box(width: 9.6in)[
      #text(size: 40pt, weight: "bold", fill: text-dark)[CernVM-FS Filebundles for low-latency data distribution in interactive usecases]

      #v(0.45em)

  

      #v(0.9em)

      #text(size: 14pt, fill: text-dark)[Valentin Volkl (valentin.volkl\@cern.ch), Georgios Christodoulis (georgios.christodoulis\@cern.ch), Jakob Blomer (jakob.blomer\@cern.ch)]
    ]
  ]

  #place(top + right, dx: -0.5in, dy: 3.05in)[
    #align(right)[
      #text(size: 18pt, fill: text-mid)[May 2026]\
      #text(size: 18pt, fill: text-mid)[CHEP 2026, Bangkok, Thailand]
    ]
  ]



  #place(bottom + left, dx: 0.25in, dy: -0.25in)[
    #image("assets/sft-banner-positive.png", width: 2.4in)
  ]
]

#include "slides/slide-01-cvmfs-intro.typ"

// strata + proxy + client-cache hierarchy diagram
#include "slides/slide-01ab-architecture.typ"

#include "slides/slide-01b-client-server.typ"


// implementation idea and how it works
#include "slides/slide-04b-filebundle.typ"

// librarian workflow — capture trace, build spec, publish
#include "slides/slide-04ba-publish.typ"
#include "slides/slide-04bb-bundle-format.typ"

// performance results
#include "slides/slide-04c-bench-violin.typ"
#include "slides/slide-04d-bench-pool.typ"
#include "slides/slide-04e-bench-latency.typ"

// trade-offs and risks
#include "slides/slide-04f-caveats.typ"

// further work — direct I/O, packfiles, offline mode
#include "slides/slide-06-further-work.typ"

#include "slides/slide-99-contact.typ"
