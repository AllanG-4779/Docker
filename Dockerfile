# STATE THE JDK YOU ARE TO USE
# FROM amazoncorretto:17
# # COPY THE JAR FILE TO THE IMAGE
# COPY target/*.jar spring-build.jar
# # WHEN THE APPLICATION IS EXECUTED, CHOOSE A PORT TO EXPOSE
# EXPOSE 9000
# # HOW DO YOU EXPECT THE APPLICATION TO BE EXECUTED 
# ENTRYPOINT [ "java", "-jar", "spring-build.jar" ]
FROM maven:3.8-amazoncorretto-17 AS PACKAGING
# copy the src and the pom 
COPY ./pom.xml  ./pom.xml
# 

RUN mvn dependency:go-offline -B

COPY ./src ./src

# SET THE ENVIRONMENT VARIABLES
ARG DATABASE_PORT
ARG DATABASE_USERNAME
ARG DATABASE_PASSWORD
ARG DATABASE_NAME
ARG DATABASE_HOST
ENV DATABASE_NAME ${DATABASE_NAME}
ENV DATABASE_PASS ${DATABASE_PASSWORD}
ENV DATABASE_USER ${DATABASE_USERNAME}
ENV DATABASE_HOST ${DATABASE_HOST}
ENV DATABASE_PORT ${DATABASE_PORT}

RUN mvn package




FROM amazoncorretto:17
# ONLY COPY THE REQUIRED FILES



COPY --from=PACKAGING ./target/**.jar /demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]





