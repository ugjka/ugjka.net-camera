#!/bin/bash
shopt -s extglob
mogrify -strip *.jp?(e)g
mogrify -interlace plane -resize 1300x1300 *.jp?(e)g
mv *.jp?(e)g UGJKA.NET/
sigal build
sed -i 's/a href=".\/">/a href="\/">/g' _build/index.html
find _build \( -name '*.css' -o -name '*.html' -o -name '*.js' -o -name '*.json' -o -name '*.txt' -o -name '*.xml' -o -name '*.yml' \) -exec gzip --best --keep -f {} \;
rsync -Pvhr --delete _build/  ugjka.net:share/camera/
