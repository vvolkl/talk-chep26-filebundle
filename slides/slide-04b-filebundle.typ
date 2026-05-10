#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

// -------- helpers -----------------------------------------------------
#let py-block(subtitle) = block(
  width: 1.7in,
  inset: (x: 0.6em, y: 0.45em),
  fill: accent-blue.transparentize(75%),
  stroke: 1.5pt + accent-blue,
  radius: 5pt,
)[
  #set align(center)
  #set text(size: 15pt, weight: "bold", fill: text-dark)
  python
  #v(-0.2em)
  #set text(size: 10pt, weight: "regular", fill: text-mid, font: "Menlo")
  #subtitle
]

#let file-row(name, color) = box(
  width: 2.3in,
  inset: (x: 0.45em, y: 0.18em),
  fill: panel-bg,
  stroke: 0.8pt + color.transparentize(50%),
  radius: 3pt,
)[
  #set text(size: 9.5pt, font: "Menlo", fill: text-dark)
  #name
]

#let names = (
  [tensorflow/\_\_init\_\_.py],
  [tensorflow/keras/\_\_init\_\_.py],
  [tensorflow/python/eager/context.py],
  [numpy/core/\_multiarray\_umath.so],
  [numpy/core/umath.py],
)

// -------- slide -------------------------------------------------------
#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[File bundles — #text(size: 22pt, fill: text-mid)[Prototype in 2.14, Georgios Christodoulis]]
  ]

  // ======================= LEFT: today =======================
  #place(top + left, dx: 0.5in, dy: 1.05in)[
    #box(
      width: 5.3in,
      height: 5.3in,
      inset: (x: 0.7em, y: 0.6em),
      fill: accent-amber.transparentize(94%),
      stroke: (left: 3pt + accent-amber),
      radius: 6pt,
    )[
      #set align(center)
      #text(size: 16pt, weight: "bold", fill: accent-amber)[Today — one GET per file]

      #v(0.3em)
      #py-block[import tensorflow]

      #v(0.2em)
      #set text(size: 11pt, fill: accent-amber, font: "Menlo")
      #sym.arrow.b.double open() → wait → open() → wait …

      #v(0.3em)
      #set align(left)
      #for n in names [
        #stack(dir: ltr, spacing: 0.3em,
          box(width: 0.45in)[
            #set text(size: 9pt, font: "Menlo", fill: accent-amber, weight: "bold")
            GET
          ],
          file-row(n, accent-amber),
          box[#set text(size: 9pt, font: "Menlo", fill: text-light)
          #sym.arrow.r 1 RTT],
        )
        #v(0.12em)
      ]
      #set align(center)
      #v(0.1em)
      #text(size: 10pt, fill: text-light)[… × hundreds more]

      #v(0.25em)
      #text(size: 12pt, fill: accent-amber)[import stalls on each round-trip]
    ]
  ]

  // ======================= RIGHT: with bundle =======================
  #place(top + right, dx: -0.5in, dy: 1.05in)[
    #box(
      width: 5.3in,
      height: 5.3in,
      inset: (x: 0.7em, y: 0.6em),
      fill: highlight.transparentize(92%),
      stroke: (left: 3pt + highlight),
      radius: 6pt,
    )[
      #set align(center)
      #text(size: 16pt, weight: "bold", fill: highlight)[With #raw(".cvmfsbundle") — async prefetch]

      #v(0.3em)
      #py-block[import tensorflow]

      #v(0.2em)
      #set text(size: 11pt, fill: highlight, font: "Menlo")
      #sym.arrow.b.double open(trigger) → bundle manifest

      #v(0.3em)
      #box(
        width: 4.6in,
        inset: (x: 0.5em, y: 0.5em),
        fill: panel-bg,
        stroke: 1pt + highlight.transparentize(50%),
        radius: 6pt,
      )[
        #set align(left)
        #text(size: 10pt, font: "Menlo", fill: highlight, weight: "bold")[.cvmfsbundle.trigger]
        #v(0.25em)
        #for n in names [
          #stack(dir: ltr, spacing: 0.3em,
            box(width: 0.55in)[
              #set text(size: 9pt, font: "Menlo", fill: accent-blue, weight: "bold")
              async
            ],
            file-row(n, highlight),
          )
          #v(0.12em)
        ]
      ]

      #v(0.3em)
      #set align(center)
      #text(size: 12pt, fill: highlight)[fetched in parallel, in the background]
    ]
  ]
]
