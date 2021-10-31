FROM fabiobiffoli/dyn-form-fe as fe


FROM fabiobiffoli/dyn-form-core:heroku as be
WORKDIR /usr/src/app
COPY pom.xml /usr/src/app/pom.xml
RUN mvn -B dependency:resolve
WORKDIR /usr/src/app/src/main/resources/static
COPY --from=fe ./usr/share/nginx/html/ /usr/src/app/src/main/resources/static/
WORKDIR /usr/src/app
COPY src/ /usr/src/app/src/
RUN mvn clean package spring-boot:repackage


FROM adoptopenjdk:11-jre-hotspot
EXPOSE 80
WORKDIR /jar
COPY --from=be /usr/src/app/target/*.jar dyn-form.jar
ENTRYPOINT ["java", "-jar", "dyn-form.jar"]
