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

  

  // LEFT — FUSE passthrough + Offline mode
  #place(top + left, dx: 0.55in, dy: 1.85in)[
    #box(width: 5.85in)[
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #item("FUSE passthrough  (2.14, RHEL10 / kernel ≥ 6.9)", accent-blue)[
          - General performance improvement thanks to new FUSE feature
          - On `open()` CVMFS hands the kernel an FD to the backing cache file. 
          - Subsequent reads bypass FUSE entirely — direct kernel I/O on the cache object. 
          - Already available in 2.14, but needs to be benchmarked
        ]

      #v(0.7em)

  
    ]
  ]

  // RIGHT — Packfiles + closing note
  #place(top + right, dx: -0.55in, dy: 1.85in)[
    #box(width: 5.85in)[
      #set align(left)
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

          - #item("Offline mode / partial persistency in cache (to be seen)", accent-green)[
          - Give users possibility to partially persist parts of a CVMFS repository on their workstations.
          - Integrates with "shrinkwrap" tooling needed for HPC.
        ]

      - #item("Packfiles for small files (2.15?)", accent-amber)[
          - Use packfiles for small objects already in backend storage to limit the number of network requests. 
          - Backwards compatibility only with significant effort, however
        ]

      #v(1.2em)

     
    ]
  ]
]
