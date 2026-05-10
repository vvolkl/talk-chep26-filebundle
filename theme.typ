// Shared palette, background and helpers for all slides.

#let text-dark = rgb("#1F252A")
#let text-mid = rgb("#5F6B76")
#let text-light = rgb("#8A949E")
#let panel-bg = rgb("#F4F7FA")

// Keyword-highlight accents, darkened for contrast on a light background.
#let highlight = rgb("#1D6FD6") // blue — primary
#let accent-blue = rgb("#2F80ED") // steel blue
#let accent-amber = rgb("#C88719") // warm amber
#let accent-purple = rgb("#8E63CE") // deep violet
#let accent-green = rgb("#2F9E64") // forest green
#let accent-red = rgb("#D96C6C") // soft coral red

#let ppx-bg = gradient.radial(
  rgb("#FFFFFF"),
  rgb("#F7F9FC"),
  rgb("#EEF3F8"),
  rgb("#E6ECF3"),
  center: (50%, 50%),
  radius: 78%,
)

#let ppx-bg-purple = gradient.radial(
  rgb("#FBF8FF"),
  rgb("#F3ECFB"),
  rgb("#ECE3F7"),
  rgb("#E3D6F2"),
  center: (50%, 50%),
  radius: 78%,
)

#let kw(c, body) = text(fill: c, weight: "bold", body)

#let chep-footer = context {
  set text(size: 12pt, fill: text-mid)
  grid(
    columns: (1fr, 2fr, 1fr),
    align: (left + bottom, center + bottom, right + bottom),
    image("assets/sft-banner-positive.png", height: 0.50in),
    [Valentin Volkl --- CERN EP-SFT --- CHEP 2026],
    pad(right: 0.30in, counter(page).display()),
  )
}
