FROM fabiobiffoli/dyn-form-be-core as builder
WORKDIR /usr/src/app
COPY pom.xml /usr/src/app
COPY src/ /usr/src/app/src/
#RUN mvn clean -P docker install
RUN mvn clean -P docker package spring-boot:repackage

FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8080
WORKDIR /jars
COPY --from=builder /usr/src/app/target/*.jar jars/dyn-form.jar
ENTRYPOINT ["java", "-jar", "jars/dyn-form.jar"]