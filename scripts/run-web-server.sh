#!/bin/bash
docker run -p 1313:1313 \
  -v $(dirname "$0")/..:/src \
  hugomods/hugo:0.164.0 \
  hugo server --renderToMemory --noBuildLock --bind 0.0.0.0
