#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let pw = 13.333in
#let ph = 7.5in

#let tier(name, color, body) = box(
  width: 100%,
  inset: (x: 0.7em, y: 0.3em),
  fill: color.transparentize(93%),
  stroke: 1.2pt + color,
  radius: 5pt,
)[
  #set text(size: 13pt, fill: text-dark)
  #set par(leading: 0.4em)
  #text(size: 14pt, weight: "bold", fill: color)[#name] \
  #body
]

#slide[
  #set page(
    header: none,
    footer: chep-footer,
    margin: (left: 0.04 * pw, right: 0.04 * pw, top: 0.05 * ph, bottom: 0.13 * ph),
    fill: ppx-bg,
  )

  #text(size: 28pt, weight: "bold", fill: text-dark)[
    CVMFS — cache hierarchy
  ]

\

  #v(-0.04 * ph)

  #grid(
    columns: (1fr, 0.375 * pw),
    column-gutter: 0.03 * pw,
    align: top + left,

    // LEFT — subtitle + architecture diagram
    [
      #set text(size: 15pt, fill: text-mid)


      #v(0.01 * ph)
      #image("../assets/cvmfs_hierarchy.png", height: 0.67 * ph)
    ],

    // RIGHT — tiered explanation + analogy
    [

      #v(0.04 * ph)
      #stack(dir: ttb, spacing: 0.3em,
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

      #v(0.3em)

    ],
  )
]
