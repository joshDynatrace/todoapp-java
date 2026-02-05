FROM eclipse-temurin:8-jdk AS build

RUN mkdir -p /app
WORKDIR /app
ADD build.gradle /app
ADD . /app
RUN ./gradlew -i bootJar

# ---------------------------------------------------------- #

FROM eclipse-temurin:8-jdk AS release

RUN mkdir -p /app
# Copy the jar image (which already include resoures)
COPY --from=build /app/build/libs/tutorial-1.0.0.jar  /app/tutorial-1.0.0.jar

ENTRYPOINT ["java", "-jar", "/app/tutorial-1.0.0.jar"]
