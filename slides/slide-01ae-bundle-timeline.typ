#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

// Compact per-file unit: same colours as the previous slide.
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

// Lane geometry
#let lane-pitch = 0.21in
#let bar-x = 2.10in
#let unit-w = 3.00in
#let b1-y0 = 2.20in
#let b2-y0 = 4.05in

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Solution: Concurrent work with Filebundles
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

  
  // Lane labels — first 3 threads handle the named files.
  #place(top + left, dx: 0.55in, dy: b1-y0)[
    #set text(size: 11pt, font: "Menlo", fill: text-dark)
    #set par(leading: 0.95em, spacing: 0em)
    T0  libCore.so \
    T1  libRIO.so \
    T2  libTree.so \
    T3  ...\
    T4 ...\
    T5 ...\
    T6 ...
   
  ]
  // Bars — every thread fetches one file in parallel.
  #place(top + left, dx: bar-x, dy: b1-y0 + 0 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 1 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 2 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 3 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 4 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 5 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 6 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x, dy: b1-y0 + 7 * lane-pitch)[#file-unit]

  // ───── Batch 2 ────────────────────────────────────────────────
  // Same 8 threads, next files. T4 and T6 are idle here (no more work).
 
  #place(top + left, dx: 0.55in, dy: b2-y0)[
    #set text(size: 11pt, font: "Menlo", fill: text-light)
    #set par(leading: 0.95em, spacing: 0em)
    T0 \
    T1 \
    T2 \
    T3 \
    T4 \
    T5 \
    T6 \
    T7
  ]
  // Active lanes: T0, T1, T2, T3, T5, T7. T4 / T6 idle.
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 0 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 1 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 2 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 3 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 4 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 5 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 6 * lane-pitch)[#file-unit]
  #place(top + left, dx: bar-x + unit-w + 6pt, dy: b2-y0 + 7 * lane-pitch)[#file-unit]

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
    #text(size: 10pt, fill: text-light)[serial 3 × RTT]
  ]
  // Marker at end of batch 2 = total wall time.
  #place(top + left, dx: bar-x + 2 * unit-w + 12pt, dy: 2.15in)[
    #line(length: 3.75in, angle: 90deg, stroke: (paint: highlight, thickness: 1pt, dash: "dashed"))
  ]
  #place(top + left, dx: bar-x + 2 * unit-w - 0.7in, dy: 5.95in)[
    #text(size: 10pt, weight: "bold", fill: highlight)[
     // ≈ ⌈N / pool⌉ × per-file
    ]
  ]
]
