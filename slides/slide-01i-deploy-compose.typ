#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.4in)[
    #text(size: 30pt, weight: "bold", fill: text-dark)[docker-compose — #text(fill: text-mid, size: 22pt)[before & after]]
  ]

  // LEFT: before — privileged + systemd
  #place(top + left, dx: 0.5in, dy: 1.2in)[
    #box(
      width: 5.3in,
      inset: (x: 0.8em, y: 0.8em),
      fill: accent-amber.transparentize(94%),
      stroke: (left: 3pt + accent-amber),
      radius: 6pt,
    )[
      #text(size: 16pt, weight: "bold", fill: accent-amber)[Before — privileged + systemd init]

      #v(0.4em)
      #box(
        width: 100%,
        inset: (x: 0.7em, y: 0.6em),
        fill: panel-bg,
        radius: 4pt,
      )[
        #set text(size: 11pt, font: "Menlo", fill: text-dark)
        #set par(leading: 0.4em)
        services:\
        #h(0.4em)cvmfs-dev:\
        #h(0.8em)image: cvmfs-dev:latest\
        #h(0.8em)#text(fill: accent-amber, weight: "bold")[privileged: true]\
        #h(0.8em)#text(fill: accent-amber, weight: "bold")[cgroup: host]  #text(fill: text-light)[\# cgroups v2]\
        #h(0.8em)volumes:\
        #h(1.2em)\- #text(fill: accent-amber)[/sys/fs/cgroup:/sys/fs/cgroup]\
        #h(1.2em)\- var_spool_cvmfs:/var/spool/cvmfs\
        #h(1.2em)\- ../../../:/home/sftnight/cvmfs\
      ]

      #v(0.4em)
      #set text(size: 12pt, fill: text-dark)
      #set par(leading: 0.4em, spacing: 0.45em)
      • needs the host kernel cgroups mounted in\
      • container runs #raw("sbin/init") — full systemd inside\
      • #text(fill: accent-amber, weight: "bold")[privileged] → access to everything on the host\
      • awkward under Kubernetes / rootless engines
    ]
  ]

  // RIGHT: after — plain, unprivileged
  #place(top + right, dx: -0.5in, dy: 1.2in)[
    #box(
      width: 5.3in,
      inset: (x: 0.8em, y: 0.8em),
      fill: highlight.transparentize(92%),
      stroke: (left: 3pt + highlight),
      radius: 6pt,
    )[
      #text(size: 16pt, weight: "bold", fill: highlight)[After — plain, unprivileged]

      #v(0.4em)
      #box(
        width: 100%,
        inset: (x: 0.7em, y: 0.6em),
        fill: panel-bg,
        radius: 4pt,
      )[
        #set text(size: 11pt, font: "Menlo", fill: text-dark)
        #set align(left)
        #set par(leading: 0.4em)
        services:\
        #h(0.4em)publisher:\
        #h(0.8em)image: cvmfs-publisher:latest\
        #h(0.8em)command: cvmfs_server publish\
        #h(0.4em)httpd:\
        #h(0.8em)image: nginx:alpine\
        #h(0.4em)garage:\
        #h(0.8em)image: dxflrs/garage:latest\
        #v(0.2em)
        #text(fill: text-light)[\# no privileged, no cgroup: host, no init]
      ]

      #v(0.4em)
      #set text(size: 12pt, fill: text-dark)
      #set par(leading: 0.4em, spacing: 0.45em)
      • one concern per container, no #raw("sbin/init")\
      • no host mounts, no capabilities escalation\
      • works unchanged on Kubernetes\
      • reproducible dev + prod from the same compose
    ]
  ]

  #place(bottom + left, dx: 0.6in, dy: -0.35in)[
    #box(width: 10.6in)[
      #set text(size: 13pt, fill: text-light)
      Source: #raw("test/common/container/docker-compose.yml") — stripped of the systemd scaffolding.
    ]
  ]
]
