#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let item(title, color, body) = [
  #set text(size: 18pt, fill: text-dark)
  #set par(leading: 0.55em, spacing: 0.55em)
  #text(size: 22pt, weight: "bold", fill: color)[#title] \
  #body
]

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Outlook - possible improvements
    ]
  ]

  

  // LEFT — FUSE passthrough + ZSTD
  #place(top + left, dx: 0.55in, dy: 1.85in)[
    #box(width: 5.85in)[
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #item("FUSE passthrough  (v2.14, RHEL10 / kernel ≥ 6.9)", accent-blue)[
          - General performance improvement thanks to new FUSE feature
          - On `open()`, CVMFS hands the kernel an FD to the backing cache file. Subsequent reads bypass FUSE entirely.
          - Already available in v2.14, but needs to be benchmarked
        ]

      #v(0.7em)

      - #item("ZSTD (v2.15?)", accent-blue)[
          - Support for ZSTD would mean faster compression-decompression.
          - Not easy to implement for existing repositories.
        ]
    ]
  ]

  // RIGHT — Tooling for Filebundle creation + Packfiles
  #place(top + right, dx: -0.55in, dy: 1.85in)[
    #box(width: 5.85in)[
      #set align(left)
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #item("Tooling for bundle creation (v2.15)", accent-green)[
          - Automation where possible
          - Robust treatment of changes and updates
          - Specify chunks in bundle files
          - Integration with build tools (BITS,...)
          - Benchmarking with experiment frameworks.
        ]

      #v(0.7em)

      - #item("Packfiles for small files (v2.15?)", accent-purple)[
          - Use packfiles for small objects already in backend storage to limit the number of network requests.
          - Backwards compatibility only with significant effort, however.
        ]
    ]
  ]
]
