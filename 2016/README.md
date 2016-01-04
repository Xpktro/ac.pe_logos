# ArtCoders.pe 2016 Logos

1. Generated using:
    * Polygonal Logo Generator - Variation `xUEfTL` and `#000000` in every color slot: http://xpktro.github.io/polygonal_logo_generator/ (saved as `ac.pe.2016.1.back.png`)
    * Triangular pattern image converter - Using `ac.pe.2016.1.png` as image souce and 1 as Image Reduction Scale:  http://xpktro.github.io/triangular_pattern_image_generator/ (saved as `ac.pe.2016.1.front.png`)
    * imagemagick: http://www.imagemagick.org/ using the following command (*nix users might need to escape parentheses):
        ```convert ac.pe.2016.1.back.png ( ac.pe.2016.1.front.png -background none -resize 30% -negate -rotate -76 ) -gravity center -rotate 45 -resize 150% -composite ac.pe.2016.1.result.png```