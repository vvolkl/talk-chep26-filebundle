#import "@preview/polylux:0.4.0": *
#import "@preview/fletcher:0.5.7" as fletcher: node, edge, diagram
#import "../theme.typ": *

#let file-chip(name, color: accent-amber) = box(
  width: 2.2in,
  inset: (x: 0.55em, y: 0.2em),
  fill: panel-bg,
  stroke: 0.8pt + color.transparentize(50%),
  radius: 3pt,
)[
  #set text(size: 11pt, font: "Menlo", fill: text-dark)
  #name
]

#let object-chip(hash, color: highlight) = box(
  width: 2.5in,
  inset: (x: 0.55em, y: 0.2em),
  fill: panel-bg,
  stroke: 0.8pt + color.transparentize(50%),
  radius: 3pt,
)[
  #set text(size: 10pt, font: "Menlo", fill: text-mid)
  #hash
]

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[CVMFS server tools — publishing a package]
  ]

  #place(top + left, dx: 0.4in, dy: 1.3in)[
    #diagram(
      node-stroke: none,
      node-inset: 0pt,
      spacing: (0.6in, 0.3in),
      edge-stroke: 2pt + text-mid,
      mark-scale: 70%,

      // ---- nodes ----
      node((0, 0), align(center + horizon, box(
        width: 3.2in,
        inset: (x: 0.7em, y: 0.7em),
        fill: accent-amber.transparentize(94%),
        stroke: (left: 3pt + accent-amber),
        radius: 6pt,
      )[
        #set align(center)
        #text(size: 15pt, weight: "bold", fill: accent-amber)[python package]

        #v(0.4em)
        #set align(left)
        #set par(leading: 0.4em, spacing: 0.35em)
        #file-chip([numpy/\_\_init\_\_.py])
        #file-chip([numpy/core/umath.py])
        #file-chip([numpy/core/\_multiarray.so])
        #file-chip([numpy/linalg/\_umath.so])
        #file-chip([numpy-2.1.dist-info/METADATA])
        #file-chip([numpy-2.1.dist-info/RECORD])
      ]), name: <files>),

      node((1, 0), box(
        width: 2.9in,
        inset: (x: 0.8em, y: 0.8em),
        fill: accent-blue.transparentize(88%),
        stroke: 1.5pt + accent-blue,
        radius: 8pt,
      )[
        #set align(center)
        #text(size: 16pt, weight: "bold", fill: accent-blue)[CVMFS publisher machine]

        #v(0.3em)
        #set text(size: 13pt, fill: text-dark)
        cvmfs\_swissknife · cvmfs\_server

        #v(0.5em)
        #set text(size: 12pt, fill: text-mid, font: "Menlo")
        SHA-1 hashing \
        compression (zlib) \
        catalog / metadata
      ], name: <tools>),

      node((2, 0), box(
        width: 3.5in,
        inset: (x: 0.7em, y: 0.7em),
        fill: highlight.transparentize(92%),
        stroke: (left: 3pt + highlight),
        radius: 6pt,
      )[
        #set align(center)
        #text(size: 15pt, weight: "bold", fill: highlight)[content-addressed object store (/srv or s3)]

        #v(0.4em)
        #set align(left)
        #set par(leading: 0.4em, spacing: 0.35em)
        #object-chip[data/3f/a8c9…b4e2]
        #object-chip[data/7e/21db…9c01]
        #object-chip[data/9b/f0c1…2a7d]
        #object-chip[data/1c/e04a…88ff]
        #object-chip[data/a4/7762…d513]
        #object-chip[data/ff/b9a2…3e80C #text(fill: accent-green)[\[catalog\]]]
      ], name: <store>),

      // ---- edges, tied to node names ----
      edge(<tools>, <files>, "->", label-pos: 0.5, label-side: right, label-fill: none,
        text(size: 10pt, fill: text-dark, font: "Menlo")[ingest]),
      edge(<store>, <tools>, "->", label-pos: 0.1, label-side: right, label-fill: none,
        text(size: 10pt, fill: text-dark, font: "Menlo")[hash + write]),
    )
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Each file → SHA-1 → stored once under #raw("/data/<xx>/<rest>"); the catalog records paths → hashes.
    ]
  ]
]
