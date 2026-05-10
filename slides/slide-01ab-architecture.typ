#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let tier(name, color, body) = box(
  width: 100%,
  inset: (x: 0.7em, y: 0.45em),
  fill: color.transparentize(93%),
  stroke: 1.2pt + color,
  radius: 5pt,
)[
  #set text(size: 14pt, fill: text-dark)
  #set par(leading: 0.5em)
  #text(size: 15pt, weight: "bold", fill: color)[#name] \
  #body
]

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      CVMFS — cache hierarchy
    ]
  ]

  #place(top + left, dx: 0.55in, dy: 1.05in)[
    #box(width: 12.0in)[
      #set text(size: 15pt, fill: text-mid)
      Read-only object store with HTTP fan-out and caching at every hop —
      every byte is content-addressed, so anything in any cache is reusable
      forever.
    ]
  ]

  // LEFT — architecture diagram
  #place(top + left, dx: 0.45in, dy: 1.95in)[
    #image("../assets/cvmfs_hierarchy.png", height: 4.55in)
  ]

  // RIGHT — tiered explanation + analogy
  #place(top + right, dx: -0.55in, dy: 1.85in)[
    #box(width: 5.0in)[
      #set align(left)
      #stack(dir: ttb, spacing: 0.45em,

        tier("Stratum 0", accent-purple)[
          The origin. One per repo, owned by the librarian. Where
          #raw("cvmfs_server publish") writes.
        ],

        tier("Stratum 1", accent-blue)[
          Globally-distributed HTTP read-only mirrors of Stratum 0.
          Clients normally talk to the closest one.
        ],

        tier("Squid proxy", accent-green)[
          Per-site forward proxy — absorbs duplicate requests when many
          clients on the same network start the same software.
        ],

        tier("Client disk cache", accent-amber)[
          Per-node on-disk cache. First open of a file fetches it from
          the closest upstream tier and writes it here.
        ],

        tier("Kernel page cache", rgb("#A8392F"))[
          Linux page cache sits on top of the disk cache — warm reads
          don't hit cvmfs2 or the disk at all.
        ],
      )

      #v(0.55em)
      #box(
        width: 100%,
        inset: (x: 0.7em, y: 0.55em),
        fill: panel-bg,
        stroke: 1pt + text-light,
        radius: 5pt,
      )[
        #set text(size: 12.5pt, fill: text-mid)
        #set par(leading: 0.5em)
        #kw(highlight)[Coffee analogy:] page cache is the freshly brewed
        pot, disk cache the beans in your cupboard, the squid proxy the
        store in town, Stratum 1 a regional roaster, Stratum 0 the
        plantation. Each layer hides the latency of the next.
      ]
    ]
  ]
]
