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
      Publishing a bundle — librarian workflow (1/2)
    ]
  ]

  #place(top + left, dx: 0.6in, dy: 0.95in)[
    #box(width: 12.0in)[
      #set text(size: 16pt, fill: text-mid)
      Capture a representative trace, distill it into a spec file.
    ]
  ]

  // LEFT — step 1
  #place(top + left, dx: 0.5in, dy: 1.55in)[
    #box(width: 6.0in)[
      #step-card(
        "1", "Capture access trace", "CVMFS_TRACEFILE",
        [
          #set text(size: 14pt, fill: text-dark)
          Set the option in the cvmfs client config, reload, then run a
          representative workload. The client logs every #raw("open()")
          on the repo to a JSON trace.

          #v(0.4em)
          #cmd-block[
            #text(fill: text-light)[/etc/cvmfs/config.d/my.repo.local] \
            CVMFS_TRACEFILE=/tmp/trace.json \
            #v(0.3em)
            #text(fill: accent-green)[\$] cvmfs_config reload my.repo \
            #text(fill: accent-green)[\$] python -c \
            #h(2em)#text(fill: accent-amber)['import ROOT; ROOT.TFile()']
          ]

          #v(0.5em)
          #set text(size: 12pt, fill: text-light)
          Trace records every path opened on the repo, with timestamps —
          enough to derive what should be in a bundle.
        ],
      )
    ]
  ]

  // RIGHT — step 2
  #place(top + right, dx: -0.5in, dy: 1.55in)[
    #box(width: 6.0in)[
      #step-card(
        "2", "Generate bundle spec", ".cvmfsbundle-<filename>",
        [
          #set text(size: 14pt, fill: text-dark)
          JSON file listing every path the trigger should pull in.
          Named after its trigger — for `import ROOT` the trigger is
          #raw("ROOT/__init__.py"), so the spec is
          #raw(".cvmfsbundle-__init__.py") next to it.

          #v(0.4em)
          #cmd-block[
            #text(fill: accent-green)[\$] cvmfs_server #text(fill: accent-amber, weight: "bold")[trace2bundle] \
            #h(2em)-t /tmp/trace.json my.repo
          ]

          #v(0.5em)
          #set text(size: 12pt, fill: text-light)
          #raw("trace2bundle") is a #kw(accent-amber)[proposed] subcommand —
          today the distillation is done with ad-hoc scripts. Format on the
          next slide.
        ],
      )
    ]
  ]
]
