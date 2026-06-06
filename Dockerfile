FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -B -q dependency:go-offline -DskipTests
COPY src ./src
RUN mvn -B -q -DskipTests package

FROM eclipse-temurin:17-jre
RUN apt-get update \
    && apt-get install -y --no-install-recommends fontconfig \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
ENV PORT=8080
ENV SPRING_PROFILES_ACTIVE=prod
ENV JAVA_OPTS="-Xms256m -Xmx1024m -XX:+UseG1GC -Djava.awt.headless=true"
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8080
CMD ["sh", "-lc", "java $JAVA_OPTS -Dserver.port=${PORT:-8080} -jar /app/app.jar"]
