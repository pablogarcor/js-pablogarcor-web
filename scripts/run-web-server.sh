#!/bin/bash
docker run -p 1313:1313 \
  -v $(dirname "$0")/..:/src \
  hugomods/hugo:0.122.0 \
  hugo server --noBuildLock --bind 0.0.0.0