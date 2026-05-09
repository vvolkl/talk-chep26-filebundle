#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Filebundles mitigate server network latency
    ]
  ]

  #place(top + left, dx: 0.35in + 6pt, dy: 1.20in + 6pt)[
    #rect(width: 5.85in * (1600 / 1100), height: 5.85in,
          fill: rgb("#00000026"), stroke: none, radius: 4pt)
  ]
  #place(top + left, dx: 0.35in, dy: 1.20in)[
    #image("../assets/latency_scan.pdf", height: 5.85in)
  ]

  #place(top + right, dx: -0.55in, dy: 1.55in)[
    #box(width: 3.7in)[
      #set align(left)
      #set text(size: 14pt, fill: text-mid)
      #set par(leading: 0.55em, spacing: 0.9em)

      Loopback latency injected via `tc qdisc netem`.

      #v(0.3em)
      OFF grows linearly with RTT (each `.so` pays a round-trip);
      ON stays nearly flat — prefetch overlaps it all.

      #v(0.3em)
      #kw(highlight)[7.3#sym.times faster] at 50 ms one-way (≈100 ms RTT);
      ON at 50 ms still beats OFF at 0 ms.

      #v(0.3em)
      #set text(size: 13pt, fill: text-light)
      Bars = min–max range over n=5 cold-cache runs.
    ]
  ]
]
