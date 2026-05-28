FROM eclipse-temurin:17

WORKDIR /app

COPY target/java-ci-cd-app-1.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
