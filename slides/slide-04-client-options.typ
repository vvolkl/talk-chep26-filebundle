#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg-purple)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Client behavior for missing objects]

  ]

  #place(top + left, dx: 0.8in, dy: 1.55in)[
    #box(
      width: 2.45in,
      inset: (x: 0.8em, y: 0.75em),
      stroke: 1.3pt + accent-blue,
      fill: accent-blue.transparentize(90%),
      radius: 10pt,
    )[
      #text(size: 20pt, weight: "bold", fill: accent-blue)[Client]\
      #text(size: 16pt, fill: text-dark)[Mounts the repo and probes for]\
      #text(size: 09pt, font: "Menlo", fill: text-dark)[.cvmfs_partial_replication]
    ]
  ]

  #place(top + left, dx: 4.15in, dy: 1.55in)[
    #box(
      width: 3.1in,
      inset: (x: 0.8em, y: 0.75em),
      stroke: 1.3pt + highlight,
      fill: highlight.transparentize(90%),
      radius: 10pt,
    )[
      #text(size: 20pt, weight: "bold", fill: highlight)[Partial Stratum-1]
      #text(size: 16pt, fill: text-dark)[Serves catalogs and all included objects.]\
      #text(size: 16pt, fill: text-dark)[Excluded objects return an HTTP error.] 
    ]
  ]

  #place(top + right, dx: -0.8in, dy: 1.55in)[
    #box(
      width: 3.0in,
      inset: (x: 0.8em, y: 0.75em),
      stroke: 1.3pt + accent-green,
      fill: accent-green.transparentize(90%),
      radius: 10pt,
    )[
      #set align(left)
      #text(size: 20pt, weight: "bold", fill: accent-green)[Full Stratum-1]
      #text(size: 16pt, fill: text-dark)[Optional fallback target with the complete repository.] 
    ]
  ]

  #place(top + left, dx: 3.55in, dy: 2.15in)[
    #text(size: 28pt, weight: "bold", fill: accent-blue)[→]
  ]

  #place(top + left, dx: 7.4in, dy: 2.15in)[
    #text(size: 28pt, weight: "bold", fill: accent-green)[⇢]
  ]

 // #place(top + left, dx: 2.5in, dy: 2.8in)[
   // #text(size: 14pt, fill: text-mid)[Normal traffic: catalogs + included objects]
  //]

  //#place(top + left, dx: 7.35in, dy: 2.8in)[
  //  #text(size: 14pt, fill: text-mid)[Only for missing objects in failover mode]
  //]

  #place(bottom + left, dx: 0.3in, dy: -0.2in)[
    #box(
      width: 5.15in,
      inset: (x: 0.95em, y: 0.8em),
      stroke: (left: 4pt + accent-green),
      fill: accent-green.transparentize(92%),
    )[
      #text(size: 20pt, fill: text-dark)[
        #kw(accent-green)[Option 1: failover] (default) \
      ]
      #text(size: 15pt, fill: text-dark)[
        Set #text(font: "Menlo", size: 13pt)[CVMFS_PARTIAL_REPLICA_MODE=failover]
        and provide #text(font: "Menlo")[CVMFS_FULL_STRATUM1_URL].
        If the partial replica returns a missing-object HTTP error,
        the client retries the fetch from the full Stratum-1.
      ]
    ]
  ]

  #place(bottom + right, dx: -0.3in, dy: -0.2in)[
    #box(
      width: 5.15in,
      inset: (x: 0.95em, y: 0.8em),
      stroke: (left: 4pt + accent-amber),
   
      fill: accent-amber.transparentize(92%),
    )[
      #text(size: 20pt, fill: text-dark)[
        #kw(accent-amber)[Option 2: hard fail]\
      ]
      #text(size: 15pt, fill: text-dark,  )[
        Set #text(font: "Menlo")[CVMFS_PARTIAL_REPLICA_MODE=fail].
        There is #kw(accent-amber)[no fallback]; reads of excluded content end in a hard error
        (#text(font: "Menlo")[EIO]). The client can also present excluded entries as unreadable
        to make the policy obvious.
      ]
    ]
  ]
]
