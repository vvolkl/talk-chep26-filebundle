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
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Publishing a filebundle — librarian workflow
    ]
  ]

  

  // LEFT — the three-step librarian workflow
  #place(top + left, dx: 0.55in, dy: 1.85in)[
    #box(width: 6.1in)[
      #set text(size: 22pt, fill: text-dark)
      #set par(leading: 0.55em)
      #set enum(numbering: "1.", spacing: 1.0em, body-indent: 0.45em)
      #set list(marker: text(fill: text-dark)[•], body-indent: 0.45em, spacing: 0.55em)

      + Find a suitable triggerfile
        - #text(size: 19pt)[#raw("__init__.py"), #raw("root.exe"), …]
      + Create a list of files that will always be read after the trigger
        - #text(size: 19pt)[Handcraft, or trace with #raw("strace") or #raw("CVMFS_TRACEFILE")]
      + Publish it as #raw(".cvmfsbundle-xxx") alongside the triggerfile
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
        #set text(size: 16pt, fill: text-dark)
        #set align(left)
        #stack(dir: ltr, spacing: 0.6em,
          text(weight: "bold")[Example filebundle],
          box(
            inset: (x: 0.4em, y: 0.1em),
            fill: ppx-bg,
            stroke: 0.8pt + text-light,
            radius: 3pt,
          )[#text(size: 13pt, font: "Menlo", fill: text-dark)[ROOT/.cvmfsbundle-\_\_init\_\_.py]],
        )

        #v(0.45em)
        #set text(size: 14.5pt, font: "Menlo", fill: text-dark)
        #set par(leading: 0.4em)
        #set align(left)
        #text(fill: text-light)[\#%CVMFS_BUNDLE version=1 encoding=UTF-8] \
        \{ \
        #h(1em)"name": "CVMFS_BUNDLE", \
        #h(1em)"version": "1.0.0", \
        #h(1em)"encoding": "UTF-8", \
        #h(1em)"dependencies": \[ \
        #h(2em)"/root/lib/libCore.so", \
        #h(2em)"/root/lib/libRIO.so", \
     
        #h(2em)"/root/lib/libcppyy.so", \
        #h(2em)"/root/lib/ROOT/\_application.py", \
        #h(2em)"/root/lib/ROOT/\_facade.py", \

        #h(2em)#text(fill: text-light)[…  (\~250 paths total)] \
        #h(1em)\] \
        \}

       /* #v(0.5em)
        #set text(size: 14pt, fill: text-mid, font: "Atkinson Hyperlegible")
        #set par(leading: 0.5em)
        JSON file with minial metadata, and a flat list of files that are likely to be read after the trigger.
        */
      ]
    ]
  ]
]
