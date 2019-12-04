FROM grafana/grafana:5.2.4
ADD ./provisioning /etc/grafana/provisioning
ADD ./grafana.ini /etc/grafana/grafana.ini
ADD ./dashboards /var/lib/grafana/dashboards
ENV PROMETHEUS_SERVER_SVC "http://prometheus-server"
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
