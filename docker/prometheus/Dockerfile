FROM prom/prometheus:v2.4.2
ADD prometheus.yml /etc/prometheus/
ENV API_GATEWAY_SVC "api-gateway:8080"
ENV CUSTOMERS_SERVICE_SVC "customers-service:8081"
ENV VISITS_SERVICE_SVC "visits-service:8082"
ENV VETS_SERVICE_SVC "vets-service:8083"
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "sh", "/entrypoint.sh" ]
