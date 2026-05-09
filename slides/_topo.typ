// Shared building blocks for publisher-topology slides
#import "../theme.typ": *

#let vm-box(
  label,
  body,
  width: 3in,
  color: accent-amber,
) = box(
  width: width,
  inset: (x: 0.8em, y: 0.9em),
  fill: color.transparentize(92%),
  stroke: 2pt + color,
  radius: 6pt,
)[
  #place(top + right, dx: -0.3em, dy: 0.1em)[
    #text(size: 9pt, font: "Menlo", fill: color, weight: "bold")[#label]
  ]
  #body
]

#let container-box(
  label,
  body,
  width: 3in,
  color: accent-purple,
) = box(
  width: width,
  inset: (x: 0.8em, y: 0.9em),
  fill: color.transparentize(93%),
  stroke: (paint: color, dash: "dashed", thickness: 1.5pt),
  radius: 4pt,
)[
  #place(top + right, dx: -0.3em, dy: -0.1em)[
    #text(size: 9pt, font: "Menlo", fill: color, weight: "bold")[#label]
  ]
  #body
]

#let chip(name, color: accent-blue) = box(
  inset: (x: 0.5em, y: 0.2em),
  fill: panel-bg,
  stroke: 0.8pt + color,
  radius: 3pt,
)[
  #set text(size: 11pt, font: "Menlo", fill: text-dark)
  #name
]

#let store-box(title, width: 2.3in, color: highlight) = box(
  width: width,
  inset: (x: 0.8em, y: 0.9em),
  fill: color.transparentize(88%),
  stroke: 1.5pt + color,
  radius: 14pt,
)[
  #set align(center)
  #set text(size: 13pt, weight: "bold", fill: color)
  #title
]

#let client-box(width: 1.7in) = box(
  width: width,
  inset: (x: 0.7em, y: 0.5em),
  fill: accent-green.transparentize(85%),
  stroke: 1.2pt + accent-green,
  radius: 4pt,
)[
  #set align(center)
  #text(size: 13pt, weight: "bold", fill: text-dark)[CVMFS client]
  #v(-0.25em)
  #text(size: 10pt, fill: text-mid, font: "Menlo")[cvmfs2]
]

#let arrow(from, to, color: text-mid, label: none, label-side: "top") = {
  place(top + left, {
    line(start: from, end: to, stroke: 2pt + color)
    // arrowhead
    let dx = to.at(0) - from.at(0)
    let dy = to.at(0) - from.at(0)
    place(top + left, dx: to.at(0) - 0.1in, dy: to.at(1) - 0.08in)[
      #text(size: 14pt, fill: color)[▶]
    ]
    if label != none {
      let mx = (to.at(0) + from.at(0)) / 2
      let my = (to.at(1) + from.at(1)) / 2
      place(top + left, dx: mx - 0.3in, dy: my - 0.22in)[
        #text(size: 10pt, fill: color, font: "Menlo")[#label]
      ]
    }
  })
}
