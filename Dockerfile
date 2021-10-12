FROM fabiobiffoli/dyn-form-fe as fe


FROM fabiobiffoli/dyn-form-be-core as be
WORKDIR /usr/src/app
COPY pom.xml /usr/src/app/pom.xml
WORKDIR /usr/src/app/src/main/resources/static
COPY --from=fe ./usr/share/nginx/html/ /usr/src/app/src/main/resources/static/
WORKDIR /usr/src/app
COPY src/ /usr/src/app/src/
RUN mvn clean -P docker package spring-boot:repackage

FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8080
WORKDIR /jars
COPY --from=be /usr/src/app/target/*.jar jars/dyn-form.jar
#ENTRYPOINT ["java", "-jar", "jars/dyn-form.jar"]