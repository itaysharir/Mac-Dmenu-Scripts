#! /usr/bin/env sh
open -a Xquartz
ls -d /Applications/*.app \
      /System/Applications/*.app \
      /Applications/Utilities/*.app \
      /System/Applications/Utilities/*.app \
      /Applications/Adobe\ Photoshop\ 2022/*.app\
      /Applications/Adobe\ Premiere\ Pro\ 2022/*.app\
      /Applications/Adobe\ Illustrator\ 2022/*.app \
      | sed -r 's/^.+\///' | rev | cut -c5- | rev | dmenu -i | xargs -I {} open -a  "{}"
