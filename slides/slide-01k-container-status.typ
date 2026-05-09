#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#let status-row(mark, mark-color, headline, note) = stack(dir: ltr, spacing: 0.7em,
  box(
    width: 1.6em, height: 1.6em,
    fill: mark-color.transparentize(80%),
    stroke: 1.5pt + mark-color,
    radius: 50%,
  )[
    #set align(center + horizon)
    #text(size: 14pt, weight: "bold", fill: mark-color)[#mark]
  ],
  box[
    #set text(size: 19pt, weight: "bold", fill: text-dark)
    #headline
    #v(-0.2em)
    #set text(size: 14pt, weight: "regular", fill: text-mid)
    #note
  ],
)

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Status of the containerized deployment]
  ]

  #place(top + left, dx: 0.6in, dy: 1.5in)[
    #box(width: 10.6in)[
      #stack(dir: ttb, spacing: 0.9em,
        status-row(
          "✓", accent-green,
          [Running in our CI pipelines],
          [as a #raw("docker-compose") stack],
        ),
        status-row(
          "!", accent-amber,
          [Needs major code renovation at one point],
          [single publisher architecture has been extended a lot],
        ),
        status-row(
          "?", highlight,
          [Helm charts next],
          [hopefully a small step — but still prototype],
        ),
      )
    ]
  ]
]
