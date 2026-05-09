#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *
#import "_topo.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Deployment — classic single VM]
  ]

  // Publisher VM on the left
  #place(top + left, dx: 0.7in, dy: 1.5in)[
    #vm-box(
      "publisher VM",
      width: 5.6in,
      {
        set text(size: 14pt, fill: text-dark)
        set par(leading: 0.5em, spacing: 0.6em)
        text(size: 20pt, weight: "bold", fill: accent-amber)[Publisher]
    
        v(0.9em)
        stack(dir: ltr, spacing: 0.4em,
          chip("httpd", color: accent-red),
          text(size: 11pt, fill: text-mid, font: "Menlo")[systemd service, port 80],
        )
        v(0.3em)
        stack(dir: ltr, spacing: 0.4em,
          chip("overlayfs", color: accent-red),
          text(size: 11pt, fill: text-mid, font: "Menlo")[mounted on /cvmfs/\<repo\>, \ /var/spool/cvmfs/\<repo\>/rdonly + \ /var/spool/cvmfs/scratch],
        )
        v(2.5em)
        box(
          width: 100%,
          inset: (x: 0.7em, y: 0.6em),
          fill: highlight.transparentize(90%),
          stroke: 1pt + highlight,
          radius: 4pt,
        )[
          #set align(center)
          #text(size: 13pt, weight: "bold", fill: highlight)[/srv/cvmfs  · backing object store]
        ]
      }
    )
  ]

  // Client on the right
  #place(top + right, dx: -0.9in, dy: 3.4in)[
    #client-box()
  ]

  // HTTP arrow from VM to client
  #place(top + left, dx: 6.35in, dy: 3.8in)[
    #line(start: (0in, 0in), end: (2.3in, 0in), stroke: 2pt + accent-green)
    #place(top + left, dx: 2.15in, dy: -0.1in)[
      #text(size: 16pt, fill: accent-green)[▶]
    ]
    #place(top + left, dx: 0.7in, dy: -0.26in)[
      #text(size: 11pt, fill: accent-green, font: "Menlo")[HTTP]
    ]
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Publisher, web server and storage all on one host.
      Simple, but scale = that one machine.
    ]
  ]
]
