#!/usr/bin/env bash

find . -mindepth 2 -type f -name "*.rules" \
  | parallel 'export name="$(echo "{.}" | sed -e "s/^\.\///g" -e "s/\//_/g")"; cat {} | sed "s/^ALERT {path}/ALERT ${name}/g" > ${name}.rules'

