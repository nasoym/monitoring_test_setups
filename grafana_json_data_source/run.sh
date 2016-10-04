#!/bin/bash

docker-compose up -d

for i in {1..20}; do 
  curl -s "http://localhost:3000" >/dev/null && break
  sleep 1
done
curl -s "http://localhost:3000" >/dev/null || { echo "grafana did not respond!" >&2; exit 1;}
./add_datasources

