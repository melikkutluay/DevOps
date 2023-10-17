FROM openjdk:17-jdk-slim
COPY target/*.jar consumer.jar
ENTRYPOINT ["java","-jar","consumer.jar"]

#COPY target/*.jar consumer.jar
#RUN adduser --disabled-login -u 1001 consumer
#RUN mkdir -p /logs/
#RUN chown -R consumer /logs/
#RUN chown -R 777 /opt/java/openjdk/lib/security/cacerts
#USER consumer
#ENV JAVA_OPTS="-Xms4g -Xmx8g"
#ENTRYPOINT exec java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTS -jar consumer.jar