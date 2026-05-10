#import "@preview/polylux:0.4.0": *
#import "@preview/shadowed:0.3.0": shadow
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 28pt, weight: "bold", fill: text-dark)[
      Filebundles mitigate server network latency
    ]
  ]

  #place(top + left, dx: 0.35in, dy: 1.20in)[
    #shadow(dx: -6pt, dy: 6pt, blur: 10pt, fill: rgb(0, 0, 0, 38%), radius: 4pt)[
      #image("../assets/latency_scan.pdf", height: 5.30in)
    ]
  ]

  #place(top + right, dx: -0.55in, dy: 1.55in)[
    #box(width: 3.3in)[
      #set align(left)
      #set text(size: 20pt, fill: text-mid)
      #set par(leading: 0.55em, spacing: 0.9em)

      Loopback latency injected artificially with: 
      \  `tc qdisc netem`.

      #v(0.3em)
      Startup time without filebundles grows linearly with RTT 

      ON stays nearly flat in this idealized scenario.

   

    ]
  ]
]
