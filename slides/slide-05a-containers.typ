#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Containers]
  ]

  #place(top + left, dx: 0.6in, dy: 1.35in)[
    #box(width: 10.6in)[
      #set text(size: 18pt, fill: text-dark)
      CVMFS provides tooling to unpack, store and distribute
      containers, with #emph[unpacked.cern.ch] being the biggest
      repository:
    ]
  ]

  #place(top + left, dx: 0.6in, dy: 2.25in)[
    #box(
      width: 10.6in,
      inset: (x: 0.9em, y: 0.8em),
      fill: panel-bg,
      radius: 6pt,
    )[
      #set text(size: 16pt, font: ("Menlo", "Courier New"), fill: text-dark)
      #set par(leading: 0.55em)

      #text(fill: accent-green, weight: "bold")[user\@host]#text(fill: text-mid)[:]#text(fill: accent-blue, weight: "bold")[\~]#text(fill: text-mid)[\$] #raw("ls /cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/cs8:x86_64-d20211124")\
      #v(0.3em)
      #text(fill: accent-blue, weight: "bold")[#raw("afs   build  dev          etc   lib64       mnt   proc  sbin         sys  var")]\
      #text(fill: accent-blue, weight: "bold")[#raw("bin   cvmfs  environment  home  lost+found  opt   root  singularity  tmp")]\
      #text(fill: accent-blue, weight: "bold")[#raw("boot  data   eos          lib   media       pool  run   srv          usr")]
    ]
  ]

  #place(top + left, dx: 0.6in, dy: 4.25in)[
    #box(width: 10.6in)[
      #set text(size: 18pt, fill: text-dark)
      #set par(leading: 0.4em, spacing: 0.55em)

      • #emph[Apptainer] can directly launch the container from this root file system.

      • The same benefits from using CVMFS apply! Leading to:

      #h(0.5in)∘ Drastically faster container #kw(highlight)[startup] times

      #h(0.5in)∘ Automatic #kw(highlight)[cache management] of container images on the worker nodes
    ]
  ]
]
