#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let cmd-block(body) = box(
  width: 100%,
  inset: (x: 0.7em, y: 0.55em),
  fill: panel-bg,
  radius: 4pt,
)[
  #set text(size: 13pt, font: "Menlo", fill: text-dark)
  #set par(leading: 0.45em)
  #body
]

#let step-card(num, title, tag, body) = box(
  width: 100%,
  inset: (x: 0.95em, y: 0.85em),
  fill: highlight.transparentize(92%),
  stroke: 1.5pt + highlight,
  radius: 6pt,
)[
  #stack(dir: ltr, spacing: 0.6em,
    box(
      width: 1.6em, height: 1.6em,
      inset: 0.15em,
      fill: highlight,
      radius: 50%,
    )[
      #set align(center)
      #text(size: 16pt, weight: "bold", fill: white)[#num]
    ],
    text(size: 18pt, weight: "bold", fill: highlight)[#title],
    box(
      inset: (x: 0.4em, y: 0.1em),
      fill: panel-bg,
      stroke: 0.8pt + highlight,
      radius: 3pt,
    )[#text(size: 11pt, font: "Menlo", fill: text-dark, weight: "bold")[#tag]],
  )
  #v(0.4em)
  #body
]

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Publishing a bundle — librarian workflow (2/2)
    ]
  ]

  #place(top + left, dx: 0.6in, dy: 0.95in)[
    #box(width: 12.0in)[
      #set text(size: 16pt, fill: text-mid)
      Spec format and what `cvmfs_server publish` does with it.
    ]
  ]

  // LEFT — step 3 + on-disk layout
  #place(top + left, dx: 0.5in, dy: 1.55in)[
    #box(width: 6.0in)[
      #stack(dir: ttb, spacing: 0.55em,

        step-card(
          "3", "Publish", "cvmfs_server transaction / publish",
          [
            #set text(size: 14pt, fill: text-dark)
            Drop the spec file next to its trigger and publish.
            #raw("cvmfs_server publish") sees the
            #raw(".cvmfsbundle-") prefix and flips the
            #kw(highlight)[bundle-trigger] flag on
            #raw("__init__.py") in the catalog.

            #v(0.4em)
            #cmd-block[
              #text(fill: accent-green)[\$] cvmfs_server transaction my.repo \
              #text(fill: accent-green)[\$] cp #raw(".cvmfsbundle-__init__.py") \\\
              #h(2em) /cvmfs/my.repo/ROOT/ \
              #text(fill: accent-green)[\$] cvmfs_server publish my.repo
            ]
          ],
        ),

        box(
          width: 100%,
          inset: (x: 0.95em, y: 0.85em),
          fill: accent-amber.transparentize(94%),
          stroke: 1.5pt + accent-amber,
          radius: 6pt,
        )[
          #set text(size: 14pt, fill: text-dark)
          #kw(accent-amber)[On disk, one spec per trigger:]
          #v(0.25em)
          #set text(size: 13pt, font: "Menlo", fill: text-dark)
          #set par(leading: 0.55em)
          #raw("ROOT/__init__.py") #h(0.5em) #text(fill: text-light)[← bundle trigger] \
          #raw("ROOT/.cvmfsbundle-__init__.py") #h(0.5em) #text(fill: text-light)[← spec (JSON deps)]
          #v(0.3em)
          #set text(size: 13pt, fill: text-mid, font: "Atkinson Hyperlegible")
          Client #raw("open()") on the trigger → bundle manager loads the
          spec, fetches every entry in parallel.
        ],
      )
    ]
  ]

  // RIGHT — example file content
  #place(top + right, dx: -0.5in, dy: 1.55in)[
    #box(width: 6.0in)[
      #box(
        width: 100%,
        inset: (x: 0.95em, y: 0.85em),
        fill: panel-bg,
        stroke: 1.5pt + text-light,
        radius: 6pt,
      )[
        #set text(size: 14pt, fill: text-dark)
        #stack(dir: ltr, spacing: 0.6em,
          text(weight: "bold")[Example],
          box(
            inset: (x: 0.4em, y: 0.1em),
            fill: ppx-bg,
            stroke: 0.8pt + text-light,
            radius: 3pt,
          )[#text(size: 11pt, font: "Menlo", fill: text-dark)[ROOT/.cvmfsbundle-\_\_init\_\_.py]],
        )

        #v(0.45em)
        #set text(size: 11.5pt, font: "Menlo", fill: text-dark)
        #set par(leading: 0.4em)
        #text(fill: text-light)[\#%CVMFS_BUNDLE version=1 encoding=UTF-8] \
        \{ \
        #h(1em)"name": "CVMFS_BUNDLE", \
        #h(1em)"version": "1.0.0", \
        #h(1em)"encoding": "UTF-8", \
        #h(1em)"dependencies": \[ \
        #h(2em)"/root/lib/libCore.so", \
        #h(2em)"/root/lib/libRIO.so", \
        #h(2em)"/root/lib/libNet.so", \
        #h(2em)"/root/lib/libThread.so", \
        #h(2em)"/root/lib/libMathCore.so", \
        #h(2em)"/root/lib/libcppyy.so", \
        #h(2em)"/root/lib/ROOT/\_application.py", \
        #h(2em)"/root/lib/ROOT/\_facade.py", \
        #h(2em)"/root/lib/ROOT/\_pythonization/\_\_init\_\_.py", \
        #h(2em)#text(fill: text-light)[…  (\~250 paths total)] \
        #h(1em)\] \
        \}

        #v(0.5em)
        #set text(size: 12pt, fill: text-mid, font: "Atkinson Hyperlegible")
        #set par(leading: 0.5em)
        Header line carries the format version; the JSON body has a single
        flat #raw("dependencies") array of catalog-relative paths.
      ]
    ]
  ]
]
