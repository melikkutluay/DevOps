FROM eclipse-temurin:17.0.6_10-jdk
COPY target/*.jar producer.jar
RUN adduser --disabled-login -u 1001 producer
RUN mkdir -p /logs/
RUN chown -R producer /logs/
RUN chown -R 777 /opt/java/openjdk/lib/security/cacerts
USER producer
ENV JAVA_OPTS="-Xms4g -Xmx8g"
ENTRYPOINT exec java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTS -jar producer.jar