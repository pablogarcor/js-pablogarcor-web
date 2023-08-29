#!/bin/bash

docker run --rm -it \
  -v $(pwd)/js-pablogarcor-web:/src \
  klakegg/hugo:0.101.0
