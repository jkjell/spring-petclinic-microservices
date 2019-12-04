#!/bin/bash

set -eu

sed -i 's prometheus-server '"$PROMETHEUS_SERVER_SVC"' g' /etc/grafana/provisioning/datasources/all.yml
echo
echo "==========================================================="
cat /etc/grafana/provisioning/datasources/all.yml

/run.sh /bin/sh -c #(nop)
