#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *
#import "_topo.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Deployment — gateway + many publishers]
  ]

  // Three small publishers on the left — compact, no corner label
  #let small-pub(n) = box(
    width: 2.2in,
    inset: (x: 0.6em, y: 0.4em),
    fill: accent-amber.transparentize(92%),
    stroke: 2pt + accent-amber,
    radius: 6pt,
  )[
    #set align(center)
    #text(size: 15pt, weight: "bold", fill: accent-amber)[Publisher #n VM]
    #v(0.1em)
    #chip[cvmfs_server]
  ]

  #place(top + left, dx: 0.5in, dy: 1.55in)[#small-pub(1)]
  #place(top + left, dx: 0.5in, dy: 2.65in)[#small-pub(2)]
  #place(top + left, dx: 0.5in, dy: 3.75in)[#small-pub(3)]

  // Gateway VM in the middle
  #place(top + left, dx: 3.8in, dy: 1.6in)[
    #box(
      width: 3.6in,
      height: 3.1in,
      inset: (x: 0.9em, y: 0.9em),
      fill: accent-blue.transparentize(92%),
      stroke: 2pt + accent-blue,
      radius: 6pt,
    )[
      #place(top + right, dx: -0.3em, dy: 0.1em)[
        #text(size: 9pt, font: "Menlo", fill: accent-blue, weight: "bold")[gateway VM]
      ]
      #set align(center)
      #text(size: 20pt, weight: "bold", fill: accent-blue)[Gateway]
      #v(0.35em)
      #stack(dir: ltr, spacing: 0.4em,
        chip("cvmfs_gateway", color: accent-blue),
        text(size: 10pt, fill: text-mid, font: "Menlo")[systemd],
      )
      #v(0.5em)
      #stack(dir: ltr, spacing: 0.4em,
        chip("httpd", color: accent-green),
        chip("overlayfs", color: accent-purple),
      )
      #v(0.7em)
      #text(size: 11pt, fill: text-mid, font: "Menlo")[
        serializes commits, \
        holds the write lease
      ]
    ]
  ]

  // S3 store
  #place(top + right, dx: -0.5in, dy: 1.85in)[
    #store-box(
      width: 3.0in,
      [S3 bucket \
        #set text(size: 11pt, weight: "regular", fill: text-mid, font: "Menlo")
        shared object store]
    )
  ]

  // Client below S3
  #place(top + right, dx: -1.1in, dy: 4.35in)[
    #client-box()
  ]

  // Arrows: publishers → gateway (each lands inside the gateway's vertical span 1.6-4.7)
  #for y in (1.95in, 3.05in, 4.15in) {
    place(top + left, dx: 2.75in, dy: y)[
      #line(start: (0in, 0in), end: (1.0in, 0in), stroke: 1.8pt + accent-amber)
      #place(top + left, dx: 0.85in, dy: -0.1in)[
        #text(size: 14pt, fill: accent-amber)[▶]
      ]
    ]
  }

  // Arrow: gateway → S3
  #place(top + left, dx: 7.45in, dy: 2.85in)[
    #line(start: (0in, 0in), end: (0.85in, 0in), stroke: 2pt + accent-blue)
    #place(top + left, dx: 0.70in, dy: -0.1in)[
      #text(size: 16pt, fill: accent-blue)[▶]
    ]
    #place(top + left, dx: 0.15in, dy: -0.3in)[
      #text(size: 10pt, fill: accent-blue, font: "Menlo")[PUT]
    ]
  ]

  // Arrow: gateway → client (httpd serves reads)
  #place(top + left, dx: 7.45in, dy: 4.5in)[
    #line(start: (0in, 0in), end: (2.25in, 0.2in), stroke: 2pt + accent-green)
    #place(top + left, dx: 2.1in, dy: 0.08in)[
      #text(size: 16pt, fill: accent-green)[▶]
    ]
    #place(top + left, dx: 0.9in, dy: -0.2in)[
      #text(size: 10pt, fill: accent-green, font: "Menlo")[HTTP]
    ]
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Many publishers commit through a single gateway — the gateway holds the write lease and fans out.
    ]
  ]
]
