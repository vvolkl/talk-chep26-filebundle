#import "@preview/polylux:0.4.0": *
#import "@preview/fletcher:0.5.7" as fletcher: node, edge, diagram
#import "../theme.typ": *
#import "_topo.typ": *

#let pub-container(n) = container-box(
  "container",
  width: 2.6in,
  color: accent-amber,
  {
    set align(center)
    v(0.4em)
    text(size: 16pt, weight: "bold", fill: accent-amber)[Publisher #n]
    v(0.2em)
    chip[cvmfs_server]
  },
)

#let gateway-container = container-box(
  "container",
  width: 2.8in,
  color: accent-blue,
  {
    set align(center)
    v(0.4em)
    text(size: 17pt, weight: "bold", fill: accent-blue)[Gateway]
    v(0.2em)
    chip("cvmfs_gateway", color: accent-blue)
  },
)

#let garage-container = container-box(
  "container",
  width: 3.0in,
  color: highlight,
  {
    set align(center)
    v(0.4em)
    text(size: 20pt, weight: "bold", fill: highlight)[Garage]
    v(0.1em)
    text(size: 12pt, fill: text-mid, font: "Menlo")[S3-compatible server]
  },
)

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Deployment — self-hosted storage with #kw(highlight)[Garage]]
  ]

  #place(top + left, dx: 0.6in, dy: 1.05in)[
    #box(width: 10.6in)[
      #set text(size: 15pt, fill: text-mid)
      No external S3 — #kw(highlight)[Garage] (lightweight S3-compatible server) runs as another container.
    ]
  ]

  #place(top + left, dx: 0.6in, dy: 2.0in)[
    #diagram(
      node-stroke: none,
      node-inset: 0pt,
      spacing: (0.7in, 0.4in),
      edge-stroke: 2pt + text-mid,
      mark-scale: 70%,

      // two publishers on the left column
      node((0, 0), pub-container(1), name: <pub1>),
      node((0, 1), pub-container(2), name: <pub2>),

      // gateway in the middle column (vertically centered)
      node((1, 0.5), gateway-container, name: <gw>),

      // garage on the right column
      node((2, 0.5), garage-container, name: <garage>),

      // edges
      edge(<pub1>, <gw>, "->", label-pos: 0.5, label-side: right, label-fill: none,
        text(size: 10pt, fill: text-dark, font: "Menlo")[publish]),
      edge(<pub2>, <gw>, "->", label-pos: 0.5, label-side: right, label-fill: none,
        text(size: 10pt, fill: text-dark, font: "Menlo")[publish]),
      edge(<gw>, <garage>, "->", label-pos: 0.5, label-side: right, label-fill: none,
        text(size: 10pt, fill: text-dark, font: "Menlo")[PUT]),
    )
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Everything — publishers, gateway, storage — runs as plain containers. No cloud S3 required.
    ]
  ]
]
