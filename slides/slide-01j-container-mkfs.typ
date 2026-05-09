#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let cmd-block(body) = box(
  width: 100%,
  inset: (x: 0.7em, y: 0.55em),
  fill: panel-bg,
  radius: 4pt,
)[
  #set text(size: 12pt, font: "Menlo", fill: text-dark)
  #set par(leading: 0.45em)
  #body
]

#let feature-card(title, tag, body) = box(
  width: 100%,
  inset: (x: 0.9em, y: 0.8em),
  fill: highlight.transparentize(92%),
  stroke: (left: 3pt + highlight),
  radius: 6pt,
)[
  #stack(dir: ltr, spacing: 0.6em,
    text(size: 16pt, weight: "bold", fill: highlight)[#title],
    box(
      inset: (x: 0.4em, y: 0.1em),
      fill: panel-bg,
      stroke: 0.8pt + highlight,
      radius: 3pt,
    )[#text(size: 10pt, font: "Menlo", fill: text-dark, weight: "bold")[#tag]],
  )
  #v(0.3em)
  #body
]

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Server changes for the containerized setup]
  ]

  #place(top + left, dx: 0.6in, dy: 0.15in)[
    #box(width: 10.6in)[
      #set text(size: 15pt, fill: text-mid)
      No systemd, no fuse, no overlayfs — and a friendlier CLI.
    ]
  ]

  // LEFT column
  #place(top + left, dx: 0.5in, dy: 1.0in)[
    #box(width: 5.3in)[
      #stack(dir: ttb, spacing: 0.4em,

        feature-card(
          "Mountless mkfs",
          "mkfs -P",
          [
            #set text(size: 13pt, fill: text-dark)
            Skips the fuse mount — no overlayfs, no privileged container.
            #v(0.3em)
            #cmd-block[
              #text(fill: accent-green)[\$] cvmfs_server mkfs #text(fill: accent-amber, weight: "bold")[-P] \
              #h(2em)-o root test.repo.org
            ]
          ],
        ),

        feature-card(
          "Mountless ingest",
          "cvmfs_server ingest",
          [
            #set text(size: 13pt, fill: text-dark)
            Publish a tarball straight into the repo — no overlayfs/fuse mounts.
            #v(0.3em)
            #cmd-block[
              #text(fill: accent-green)[\$] cvmfs_server ingest \
              #h(2em)-t data.tar.gz -b / test.repo.org
            ]
          ],
        ),
      )
    ]
  ]

  // RIGHT column
  #place(top + right, dx: -0.5in, dy: 1.0in)[
    #box(width: 5.3in)[
      #stack(dir: ttb, spacing: 0.4em,

        feature-card(
          "Connect publisher to gateway",
          "connect-gw",
          [
            #set text(size: 13pt, fill: text-dark)
            Connect to a running gateway — keys fetched from its #raw("/keys") endpoint.
            #v(0.3em)
            #cmd-block[
              #text(fill: accent-green)[\$] cvmfs_server #text(fill: accent-amber, weight: "bold")[connect-gw] \
              #h(2em)-u gateway.cern.ch test.cern.ch
            ]
            #v(0.25em)
            #set text(size: 11pt, fill: text-light)
            Replaces an 80-char #raw("mkfs -w … -u … -k …") invocation.
          ],
        ),

        feature-card(
          "Easy-mount dev repos",
          "mkfs -D",
          [
            #set text(size: 13pt, fill: text-dark)
            Publishes the public key + a mount helper via the repo's HTTP endpoint.
            #v(0.3em)
            #cmd-block[
              #text(fill: accent-green)[\$] cvmfs_server mkfs #text(fill: accent-amber, weight: "bold")[-D] \
              #h(2em)-o root test.repo.org
            ]
          ],
        ),
      )
    ]
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Landed in 2.14 — PRs #raw("#4182") / #raw("#4202").
    ]
  ]
]
