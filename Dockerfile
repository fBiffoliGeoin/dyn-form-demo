FROM fabiobiffoli/dyn-form-fe as fe


FROM fabiobiffoli/dyn-form-be-core as be
WORKDIR /usr/src/app
COPY pom-docker.xml /usr/src/app/pom.xml
COPY --from=fe /usr/local/app/dist/dyn-form-fe /usr/src/app/src/main/resources/static/
COPY src/ /usr/src/app/src/
RUN mvn clean -P docker package spring-boot:repackage

FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8080
WORKDIR /jars
COPY --from=be /usr/src/app/target/*.jar jars/dyn-form.jar
ENTRYPOINT ["java", "-jar", "jars/dyn-form.jar"]