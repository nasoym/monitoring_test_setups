#!/usr/bin/env bash

find . -mindepth 2 -type f -name "*.rules" \
  | parallel 'cat {} > $(echo "{}" | sed -e "s/^\.\///g" -e "s/\//_/g")'

