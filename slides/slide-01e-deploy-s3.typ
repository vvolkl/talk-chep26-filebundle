#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *
#import "_topo.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Deployment — external S3]
  ]

  // Publisher VM (no /srv now)
  #place(top + left, dx: 0.5in, dy: 1.8in)[
    #vm-box(
      "publisher VM",
      width: 4.2in,
      {
        set text(size: 14pt, fill: text-dark)
        set par(leading: 0.5em, spacing: 0.6em)
        text(size: 20pt, weight: "bold", fill: accent-amber)[Publisher]
    
        v(0.3em)
        stack(dir: ltr, spacing: 0.4em,
          chip("overlayfs", color: accent-purple),
          text(size: 11pt, fill: text-mid, font: "Menlo")[mounted on /cvmfs/\<repo\>],
        )
        v(0.3em)
        text(size: 11pt, fill: text-mid)[httpd no longer needed — clients talk to S3 directly]
      }
    )
  ]

  // S3 store
  #place(top + left, dx: 5.9in, dy: 1.9in)[
    #store-box(width: 3.1in, [S3 bucket])
    #v(-0.4em)
    #align(center)[
      #text(size: 11pt, fill: text-mid, font: "Menlo")[#raw("s3://stratum0/<repo>/data/...")]
    ]
  ]

  // Client — placed directly below the S3 bucket
  #place(top + left, dx: 6.3in, dy: 4.4in)[
    #client-box()
  ]

  // Publisher → S3 (PUT) — from right edge of VM to left edge of S3 bucket
  #place(top + left, dx: 4.75in, dy: 2.55in)[
    #line(start: (0in, 0in), end: (1.1in, 0in), stroke: 2pt + accent-amber)
    #place(top + left, dx: 0.95in, dy: -0.1in)[
      #text(size: 16pt, fill: accent-amber)[▶]
    ]
    #place(top + left, dx: 0.25in, dy: -0.3in)[
      #text(size: 11pt, fill: accent-amber, font: "Menlo")[PUT]
    ]
  ]

  // Client → S3 (GET) — arrow up from client to S3 bucket
  #place(top + left, dx: 7.15in, dy: 3.05in)[
    #line(start: (0in, 0in), end: (0in, 1.3in), stroke: 2pt + accent-green)
    #place(top + left, dx: -0.1in, dy: -0.1in)[
      #text(size: 16pt, fill: accent-green)[▲]
    ]
    #place(top + left, dx: 0.15in, dy: 0.55in)[
      #text(size: 11pt, fill: accent-green, font: "Menlo")[HTTP GET]
    ]
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Storage is now external — scales independently, and clients bypass the publisher.
    ]
  ]
]
