FROM openjdk:17-jdk-slim
COPY target/*.jar producer.jar
ENTRYPOINT ["java","-jar","producer.jar"]