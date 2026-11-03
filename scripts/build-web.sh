#!/bin/bash

docker run --rm \
  -v $(dirname "$0")/..:/project \
  --user 1000:1000 \
  --entrypoint sh \
  ghcr.io/gohugoio/hugo:v0.169.0 \
  -c 'hugo --minify --gc --enableGitInfo --noBuildLock  && mkdir -p build && mv public build/public && mv resources build/resources'
