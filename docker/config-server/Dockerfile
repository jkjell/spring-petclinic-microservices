FROM dev.registry.pivotal.io/spring-petclinic-e2e/spring-petclinic-config-server:java11

ENV EUREKA_DEFAULT_ZONE "http://discovery-server:8761/eureka/"
ENV TRACING_SERVER_URL "http://tracing-server:9411"
RUN apt-get update
RUN apt-get -y install git
RUN git clone https://github.com/spring-petclinic/spring-petclinic-microservices-config.git /spring-petclinic-microservices-config
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
