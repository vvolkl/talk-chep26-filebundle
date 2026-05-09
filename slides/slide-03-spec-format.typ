#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg-purple)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Exclusion spec format]
  
  
  ]

  #place(top + left, dx: 0.75in, dy: 1.55in)[
    #box(
      width: 5.3in,
      inset: (x: 0.9em, y: 0.85em),
      fill: panel-bg,
      radius: 10pt,
    )[
      #text(size: 15pt, weight: "bold", fill: highlight)[Example .cvmfs_partial_replication]\
     
      #set text(size: 17pt, font: "Iosevka", fill: text-dark)
      version 1\
      #text(fill: text-mid)[\# exclude arch not served locally]\
      /software/linux/aarch64\
      /software/linux/ppc64le\
      /software/linux/riscv64\
      #text(fill: text-mid)[\# inclusion inside an excluded tree]\
      !/software/linux/aarch64/generic
    ]
  ]

  #place(top + right, dx: -0.7in, dy: 1.5in)[
    #box(width: 4.2in)[
      #set text(size: 20pt, fill: text-dark)
      #set par(leading: 0.32em, spacing: 0.55em)
      #set align(left)

      #kw(accent-blue)[Format rules]
      
      -  First non-comment line must be #kw(highlight)[version N]
      
      • A normal path means: #kw(accent-amber)[exclude this subtree from object replication]
      
      • A path prefixed with #kw(accent-green)[!] means: #kw(accent-green)[re-include] a subtree
      inside an excluded parent
      
    
    ]
  ]

  #place(bottom + left, dx: 0.4in, dy: -0.2in)[
    #box(
      width: 6in,
      inset: (x: 1em, y: 0.6em),
      stroke: (left: 3pt + accent-amber),
      fill: accent-amber.transparentize(92%),
    )[
      #text(size: 14pt, fill: text-mid)[
        The server snapshot command passes the spec as #kw(accent-amber)[-E <specfile>] and publishes it as \
        #box[#kw(accent-amber)[http://\<stratum-one-url\>/cvmfs/software.example.repo/.cvmfs_partial_replication]] so clients can discover the policy.
      ]
    ]
  ]
]
