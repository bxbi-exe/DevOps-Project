FROM maven:3.5.2-jdk-8 as maven
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:19-jdk-slim
COPY --from=maven /target/devops-project-1.0.jar devops-project-1.0.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","devops-projectf-1.0.jar"]

LABEL authors="Bxbi"