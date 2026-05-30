#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

// Same per-file unit and palette as the next slide so the two read together.
#let unit-h = 0.20in
#let phase(w, color) = box(
  width: w,
  height: unit-h,
  fill: color,
  stroke: 0.5pt + color.darken(25%),
  radius: 1.5pt,
)
#let file-unit = stack(dir: ltr, spacing: 1pt,
  phase(0.10in, accent-green),
  phase(2.30in, accent-blue),
  phase(0.50in, accent-purple),
  phase(0.10in, accent-amber),
)

#let legend-item(color, body) = box[
  #box(width: 0.6em, height: 0.6em, fill: color, radius: 1.5pt)
  #h(0.35em)
  #text(size: 12pt, fill: text-dark)[#body]
]

// Lane geometry — matches slide-01ae so the two read as a pair.
#let lane-pitch = 0.21in
#let bar-x = 2.10in
#let unit-w = 3.00in
#let gap = 6pt
#let b1-y0 = 2.20in

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Problem: Serial file fetches
    ]
  ]

  #place(top + left, dx: 0.55in, dy: 1.65in)[
    #stack(dir: ltr, spacing: 1.6em,
      legend-item(accent-green, [FUSE upcall]),
      legend-item(accent-blue, [HTTP GET — RTT-bound]),
      legend-item(accent-purple, [zlib decompress]),
      legend-item(accent-amber, [copy + return]),
    )
  ]

  // Lane labels — three threads, one file each.
  #place(top + left, dx: 0.55in, dy: b1-y0)[
    #set text(size: 11pt, font: "Menlo", fill: text-dark)
    #set par(leading: 0.95em, spacing: 0em)
    T0  libCore.so \
    T1  libRIO.so \
    T2  libTree.so
  ]

  // Bars — each file starts where the previous one ends (serial).
  #place(top + left, dx: bar-x + 0 * unit-w + 0 * gap, dy: b1-y0 + 0 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + 1 * unit-w + 1 * gap, dy: b1-y0 + 1 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + 2 * unit-w + 2 * gap, dy: b1-y0 + 2 * lane-pitch)[#file-unit]

  // ───── Time axis ─────────────────────────────────────────────
  #place(top + left, dx: 2.10in, dy: 5.85in)[
    #line(length: 9.5in, stroke: 0.8pt + text-mid)
  ]
  #place(top + left, dx: 11.70in, dy: 5.73in)[
    #text(size: 11pt, fill: text-mid)[time →]
  ]
  #place(top + left, dx: 2.10in, dy: 5.95in)[
    #text(size: 10pt, fill: text-light)[t = 0]
  ]
  #place(top + left, dx: 11.10in, dy: 5.95in)[
    
  ]

  // Marker at end of the 3rd file = serial wall time.
  #place(top + left, dx: bar-x + 3 * unit-w + 2 * gap, dy: 2.15in)[
    #line(length: 3.75in, angle: 90deg, stroke: (paint: highlight, thickness: 1pt, dash: "dashed"))
  ]
]
