#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Monitoring]
  ]

  #place(top + left, dx: 0.6in, dy: 1.45in)[
    #box(width: 5.3in)[
      #set text(size: 20pt, fill: text-dark)
      #set par(leading: 0.35em, spacing: 0.6em)

      There's now a centrally maintained Prometheus exporter
      for CVMFS clients.

      #v(0.6em)
      #set text(size: 16pt)
      #link("https://github.com/cvmfs-contrib/prometheus-cvmfs")[
        #box(baseline: 20%, image("../assets/github-mark.svg", height: 18pt))
        #h(0.35em)
        #text(fill: accent-blue)[github.com/cvmfs-contrib/prometheus-cvmfs]
      ]

      #v(1em)
      #set text(size: 20pt, fill: text-dark)
      Plan to add a Grafana Dashboard template this Summer (GSoC Project together with Brookhaven)

      #v(1em)
      #set text(size: 16pt)
      Also — a catalog visualization tool:\
      #link("https://github.com/cvmfs-contrib/cvmfs-catalog-visualizations")[
        #box(baseline: 20%, image("../assets/github-mark.svg", height: 18pt))
        #h(0.35em)
        #text(fill: accent-blue)[github.com/cvmfs-contrib/cvmfs-catalog-visualizations]
      ]
    ]
  ]

  #place(top + left, dx: +6.1in, dy: 1.45in)[
    #box(
      width: 5.1in,
      inset: (x: 0.9em, y: 0.85em),
      fill: panel-bg,
      radius: 10pt,
    )[

      #v(0.3em)
      #set text(size: 12pt, font: "Menlo", fill: text-dark)
      #set par(leading: 0.5em)

      #text(fill: accent-green)[\$ curl localhost:9868/metrics]\
      #text(fill: text-mid)[\# HELP cvmfs_cached_bytes CVMFS currently cached bytes.]\
      #text(fill: text-mid)[\# TYPE cvmfs_cached_bytes gauge]\
      cvmfs_cached_bytes#text(fill: accent-amber)[\{repo="cvmfs-config.cern.ch"\}] 13823595531\
      #text(fill: text-mid)[\# HELP cvmfs_pinned_bytes CVMFS currently pinned bytes.]\
      #text(fill: text-mid)[\# TYPE cvmfs_pinned_bytes gauge]\
      cvmfs_pinned_bytes#text(fill: accent-amber)[\{repo="cvmfs-config.cern.ch"\}] 281152512
      \
      ...
    ]
  ]
]
