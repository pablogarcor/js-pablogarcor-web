#!/bin/bash

docker run --rm -it \
  -v $(dirname "$0")/..:/src \
  --user 1000:1000 \
  hugomods/hugo:0.122.0 \
  sh -c 'hugo --minify --gc --enableGitInfo --noBuildLock  && mkdir -p build && mv public build/public && mv resources build/resources'
