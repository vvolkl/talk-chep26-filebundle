#import "@preview/polylux:0.4.0": *
#import "@preview/shadowed:0.3.0": shadow
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: chep-footer, margin: (rest: 0pt, bottom: 0.95in), fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[
      Conclusions
    ]
  ]

  // LEFT — terse takeaways
  #place(top + left, dx: 0.55in, dy: 1.55in)[
    #box(width: 5.6in)[
      #set text(size: 16pt, fill: text-dark)
      #set par(leading: 0.6em, spacing: 0.9em)
      #set list(indent: 0.4em, body-indent: 0.65em, marker: text(fill: highlight)[•])

      - #kw(highlight)[Filebundles work.] Cold-cache `import ROOT`
        matches local-disk performance.

      - #kw(highlight)[One HTTP round-trip] replaces hundreds of small
        object fetches --- latency, not bandwidth, was the bottleneck.

      - #kw(highlight)[Drop-in for the client] --- opt-in via spec,
        no API changes.

      - #kw(highlight)[Caveat:] bursty server load. Tight specs beat
        generous ones.

      - #kw(highlight)[Next:] FUSE passthrough, offline mode, packfiles.
    ]
  ]

  // RIGHT — violin plot
  #place(top + right, dx: -0.45in, dy: 1.20in)[
    #shadow(dx: 6pt, dy: 6pt, blur: 10pt, fill: rgb(0, 0, 0, 38%), radius: 4pt)[
      #image("../assets/violin_bundle.pdf", height: 5.0in)
    ]
  ]
]
