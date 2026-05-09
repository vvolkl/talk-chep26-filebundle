#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.55in, dy: 0.35in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Cleanup of unpacked.cern.ch]
  ]



  #place(top + left, dx: 0.55in, dy: 1.75in)[
    #box(width: 5.15in)[
      #image("../assets/ceph-s3-dashboard_num_objects.png", width: 5.15in)
      #v(0.2em)
      #align(center)[
        #text(size: 13pt, fill: text-mid)[Stored objects —  131 - 23 M]
      ]
    ]
  ]

  #place(top + left, dx: 6.0in, dy: 1.75in)[
    #box(width: 5.15in)[
      #image("../assets/ceph-s3-dashboard_space.png", width: 5.15in)
      #v(0.2em)
      #align(center)[
        #text(size: 13pt, fill: text-mid)[Used space — ~12 -> 4 TB]
      ]
    ]
  ]

 
]
