#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *
#import "_topo.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[Deployment — containerized]
  ]

  #place(top + left, dx: 0.6in, dy: 1.05in)[
    #box(width: 10.6in)[
      #set text(size: 15pt, fill: text-mid)
      Each role in its own lightweight container. No overlayfs, no systemd, no privileged mode.
    ]
  ]

  // Publisher container
  #place(top + left, dx: 0.5in, dy: 1.95in)[
    #container-box(
      "container",
      width: 3.3in,
      color: accent-amber,
      {
        set align(center)
        text(size: 17pt, weight: "bold", fill: accent-amber)[Publisher]
        v(0.3em)
        chip[cvmfs_server]
        v(0.2em)
        text(size: 11pt, fill: text-mid, font: "Menlo")[publishes via ingest API]
      }
    )
  ]

  // httpd container
  #place(top + left, dx: 4.2in, dy: 1.95in)[
    #container-box(
      "container",
      width: 3.3in,
      color: accent-green,
      {
        set align(center)
        text(size: 17pt, weight: "bold", fill: accent-green)[httpd]
        v(0.3em)
        chip("apache / nginx", color: accent-green)
        v(0.2em)
        text(size: 11pt, fill: text-mid, font: "Menlo")[serves cached objects]
      }
    )
  ]

  // Gateway container
  #place(top + left, dx: 7.9in, dy: 1.95in)[
    #container-box(
      "container",
      width: 3.3in,
      color: accent-blue,
      {
        set align(center)
        text(size: 17pt, weight: "bold", fill: accent-blue)[Gateway]
        v(0.3em)
        chip("cvmfs_gateway", color: accent-blue)
        v(0.2em)
        text(size: 11pt, fill: text-mid, font: "Menlo")[holds write lease]
      }
    )
  ]

  // S3 store (external still) — spans the full width so all container arrows land on it
  #place(top + left, dx: 0.5in, dy: 4.2in)[
    #store-box(
      width: 10.7in,
      [external S3 bucket]
    )
  ]

  // Arrows from containers down to S3
  #for x in (2.15in, 5.85in, 9.55in) {
    place(top + left, dx: x, dy: 3.4in)[
      #line(start: (0in, 0in), end: (0in, 0.75in), stroke: 1.8pt + text-mid)
      #place(top + left, dx: -0.1in, dy: 0.62in)[
        #text(size: 14pt, fill: text-mid)[▼]
      ]
    ]
  }


  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Kubernetes-friendly: each pod owns one concern; no more /sys/fs/cgroup or host mounts.
    ]
  ]
]
