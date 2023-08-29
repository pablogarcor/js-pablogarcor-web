#!/bin/bash
cat $(pwd)
docker run --rm -p 1313:1313 -v $(pwd)/:/src klakegg/hugo:0.107.0-ext-alpine server


