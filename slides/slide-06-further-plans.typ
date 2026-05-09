#import "@preview/polylux:0.4.0": *
#import "../theme.typ": *

#slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ppx-bg)

  #place(top + left, dx: 0.6in, dy: 0.55in)[
    #text(size: 34pt, weight: "bold", fill: text-dark)[Further plans (post 2.14)]
  ]

  - Build system and dependencies
   - will help with HTTPS!
  - Load balancers and CDNs
  - Protected Repositories
   - x509 authentication deprecated
   - looking for better alternatives
  - Non-blocking, interruptible garbage collection
  - Multiple, High-Availability gateways
 

]