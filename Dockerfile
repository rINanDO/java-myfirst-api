FROM eclipse-temurin:21 AS build
WORKDIR /workspace
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

FROM eclipse-temurin:21-jre
ENV PORT=8080
EXPOSE 8080
COPY --from=build /workspace/target/*.jar /app.jar
ENTRYPOINT ["sh","-c","exec java -Dserver.port=${PORT} -jar /app.jar"]
