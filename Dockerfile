FROM maven:3.8.7-eclipse-temurin-11-alpine as build
WORKDIR /app
COPY pom.xml .
RUN mvn -B -f pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:go-offline
COPY src ./src
RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml package

FROM tomcat:10.1.4-jdk11
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]