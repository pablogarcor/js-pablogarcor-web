#!/bin/bash
docker run -p 1313:1313 \
  -v $(dirname "$0")/..:/project \
  ghcr.io/gohugoio/hugo:v0.169.0 \
  server --renderToMemory --noBuildLock --bind 0.0.0.0
