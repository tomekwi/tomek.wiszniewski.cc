#! /bin/sh -e

if test "$1" = '--help' -o -z "$1"; then echo -n "\
Usage:
  $0 ⟪basename⟫

We’ll take ⟪basename⟫.ready.png and generate three files out of it:

  • ⟪basename⟫.jpg
  • ⟪basename⟫@2x.jpg
  • ⟪basename⟫@preview.png

Dependencies:

  • ImageMagick
  • ./noise.png
  • ./noise@2x.png
"; exit; fi

set -x

convert "$1.ready.png" 'noise.png' \
  -resize 1920 \
  -composite \
  -quality 92 \
  "$1.jpg"

convert "$1.ready.png" 'noise@2x.png' \
  -resize 3840 \
  -composite \
  -quality 92 \
  "$1@2x.jpg"

convert "$1.jpg" \
  -resize 12x3 \
  "$1@preview.png"
