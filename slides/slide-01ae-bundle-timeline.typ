#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

// Compact per-file unit: same colours as the previous slide.
#let unit-h = 0.20in
#let sp = 1pt
#let phase(w, color) = box(
  width: w,
  height: unit-h,
  fill: color,
  stroke: 0.5pt + color.darken(25%),
  radius: 1.5pt,
)

// Phase widths
#let w-green = 0.10in   // FUSE upcall
#let w-blue = 2.30in    // HTTP GET — RTT-bound
#let w-purple = 0.50in  // zlib decompress
#let w-amber = 0.10in   // copy + return

// First file of a batch: the full open() path, end to end.
#let file-unit = stack(dir: ltr, spacing: sp,
  phase(w-green, accent-green),
  phase(w-blue, accent-blue),
  phase(w-purple, accent-purple),
  phase(w-amber, accent-amber),
)
// Prefetched files: only the network + decompress run concurrently.
#let mid-unit = stack(dir: ltr, spacing: sp,
  phase(w-blue, accent-blue),
  phase(w-purple, accent-purple),
)
// The FUSE upcall + copy/return stay serialised on the FUSE thread.
#let ga-unit = stack(dir: ltr, spacing: sp,
  phase(w-green, accent-green),
  phase(w-amber, accent-amber),
)

#let legend-item(color, body) = box[
  #box(width: 0.6em, height: 0.6em, fill: color, radius: 1.5pt)
  #h(0.35em)
  #text(size: 12pt, fill: text-dark)[#body]
]

// Lane geometry
#let lane-pitch = 0.21in
#let bar-x = 2.10in
#let full-w = w-green + w-blue + w-purple + w-amber + 3 * sp  // first-file unit width
#let mid-dx = w-green + sp                                    // align prefetch bars under the blue
#let ga-w = w-green + w-amber + sp                            // one serial upcall+return step
#let b1-y0 = 2.20in
#let b2-y0 = 4.05in
#let b2-x = bar-x + full-w + 6 * ga-w + 0.12in              // batch 2 starts after batch 1 fully completes (incl. serial returns)
#let b1-tail-x = bar-x + full-w                              // first serial step starts at T0's return
#let b2-tail-x = b2-x + full-w

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


  // ───── Batch 1 ────────────────────────────────────────────────
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
  // T0 — the trigger file: full open() path, end to end.
  #place(top + left, dx: bar-x, dy: b1-y0)[#file-unit]
  // T1..T6 — only HTTP + zlib run in parallel (prefetched in the background) ...
  #for i in range(1, 7) {
    place(top + left, dx: bar-x + mid-dx, dy: b1-y0 + i * lane-pitch)[#mid-unit]
  }
  // ... while their upcall + return queue up serially after T0 returns.
  #for i in range(1, 7) {
    place(top + left, dx: b1-tail-x + (i - 1) * ga-w, dy: b1-y0 + i * lane-pitch)[#ga-unit]
  }

  // ───── Batch 2 ────────────────────────────────────────────────
  // Same 8 threads, next files.
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
  #place(top + left, dx: b2-x, dy: b2-y0)[#file-unit]
  #for i in range(1, 8) {
    place(top + left, dx: b2-x + mid-dx, dy: b2-y0 + i * lane-pitch)[#mid-unit]
  }
  #for i in range(1, 8) {
    place(top + left, dx: b2-tail-x + (i - 1) * ga-w, dy: b2-y0 + i * lane-pitch)[#ga-unit]
  }

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
  // Marker at the last return of batch 2 = total wall time.
  #place(top + left, dx: b2-tail-x + 7 * ga-w, dy: 2.15in)[
    #line(length: 3.75in, angle: 90deg, stroke: (paint: highlight, thickness: 1pt, dash: "dashed"))
  ]
]
