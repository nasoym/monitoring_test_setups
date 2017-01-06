#!/bin/bash

docker-compose up -d

echo -n "waiting for grafana to be ready: "
for i in {1..20}; do 
  curl -s "http://localhost:3000" >/dev/null && break
  echo -n "."
  sleep 1
done
echo
curl -s "http://localhost:3000" >/dev/null || { echo "grafana did not respond!" >&2; exit 1;}
echo "adding datasource to grafna"
./add_datasources
./add_dashboard
echo

./es_create
./es_create
./es_create
./es_create


