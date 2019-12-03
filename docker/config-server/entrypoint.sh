#!/bin/bash

set -eu

sed -i 's http://discovery-server:8761/eureka/ '"$EUREKA_DEFAULT_ZONE"' g' /spring-petclinic-microservices-config/*.yml
sed -i 's http://tracing-server:9411 '"$TRACING_SERVER_URL"' g' /spring-petclinic-microservices-config/*.yml

java -Djava.security.egd=file:/dev/./urandom -jar /app.jar
