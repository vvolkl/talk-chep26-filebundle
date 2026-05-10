#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Client vs. Server]
  ]

  // Left column: client
  #place(top + left, dx: 0.6in, dy: 1.55in)[
    #box(
      width: 5.1in,
      inset: (x: 1.1em, y: 1em),
      stroke: (left: 3pt + highlight),
      fill: highlight.transparentize(93%),
      radius: 6pt,
    )[
      #set text(size: 18pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.7em)

      #text(size: 22pt, weight: "bold", fill: highlight)[CVMFS Client]

      #v(0.2em)

      The #kw(highlight)[cvmfs2] process — a
      #kw(highlight)[filesystem in user space] (FUSE).

      Mounts a repository under #raw("/cvmfs/<repo>")
      and fetches files on-demand over HTTP.

      Runs on every worker node that needs the software.
    ]
  ]

  // Right column: server
  #place(top + right, dx: -0.6in, dy: 1.55in)[
    #box(
      width: 5.1in,
      inset: (x: 1.1em, y: 1em),
      stroke: (left: 3pt + accent-amber),
      fill: accent-amber.transparentize(93%),
      radius: 6pt,
    )[
      #set align(left)
      #set text(size: 18pt, fill: text-dark)
      #set par(leading: 0.55em, spacing: 0.7em)

      #text(size: 22pt, weight: "bold", fill: accent-amber)[CVMFS Server]

      #v(0.2em)

      The tools used to #kw(accent-amber)[publish] new
      software into the #kw(accent-amber)[object store]
      that backs the filesystem.

      Typically a few  machines per repository
   
    ]
  ]


]
