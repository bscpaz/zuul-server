FROM adoptopenjdk/openjdk11:alpine
RUN apk update
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=./target/*.jar
COPY ${JAR_FILE} zuul-server.jar
ENV ENV_HOST=zuul-server
ENV ENV_PORT=8181
ENTRYPOINT ["java","-jar","/zuul-server.jar"]