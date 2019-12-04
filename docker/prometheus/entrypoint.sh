#!/bin/bash

set -eu

sed -i 's api-gateway:8080 '"$API_GATEWAY_SVC":8080' g' /etc/prometheus/prometheus.yml
sed -i 's customers-service:8081 '"$CUSTOMERS_SERVICE_SVC":8081' g' /etc/prometheus/prometheus.yml
sed -i 's visits-service:8082 '"$VISITS_SERVICE_SVC":8082' g' /etc/prometheus/prometheus.yml
sed -i 's vets-service:8083 '"$VETS_SERVICE_SVC":8083' g' /etc/prometheus/prometheus.yml

echo
echo "==========================================================="
cat /etc/prometheus/prometheus.yml

/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/prometheus \
  --web.console.libraries=/usr/share/prometheus/console_libraries \
  --web.console.templates=/usr/share/prometheus/consoles

