#!/usr/bin/bash

engine=$(ibus engine)
echo $engine

if [[ $engine == 'xkb:us::eng' ]]; then
  ibus engine Unikey
else
  ibus engine xkb:us::eng
fi
