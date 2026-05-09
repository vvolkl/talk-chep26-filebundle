#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let item(title, color, body) = [
  #set text(size: 14pt, fill: text-dark)
  #set par(leading: 0.55em, spacing: 0.55em)
  #text(size: 18pt, weight: "bold", fill: color)[#title] \
  #body
]

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Further work
    ]
  ]

  

  // LEFT — FUSE passthrough + Offline mode
  #place(top + left, dx: 0.55in, dy: 1.85in)[
    #box(width: 5.85in)[
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #item("General perf improvement with FUSE passthrough  (RHEL10 / kernel ≥ 6.9)", accent-blue)[
          On `open()` the cvmfs2 daemon hands the kernel an FD to the
          backing cache file (`FUSE_DEV_IOC_BACKING_OPEN`). Subsequent
          reads bypass FUSE entirely — direct kernel I/O on the cache
          object, zero daemon round-trips. Removes per-syscall upcall
          overhead on warm files; especially impactful for small-file
          workloads.
        ]

      #v(0.7em)

      - #item("Offline mode  (persistency in cache)", accent-green)[
          Give users possibility to partially persist parts of a CVMFS repository on their workstations. Integrates with "shrinkwrap" tooling needed for HPC.
        ]
    ]
  ]

  // RIGHT — Packfiles + closing note
  #place(top + right, dx: -0.55in, dy: 1.85in)[
    #box(width: 5.85in)[
      #set align(left)
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #item("Packfiles for small files  (storage layer)", accent-amber)[
          Use packfiles for small objects to limit the number of network requests. Backwards compatibility only with significant effort, however
        ]

      #v(1.2em)

     
    ]
  ]
]
