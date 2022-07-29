# STATE THE JDK YOU ARE TO USE
FROM amazoncorretto:17
# COPY THE JAR FILE TO THE IMAGE
COPY target/*.jar spring-build.jar
# WHEN THE APPLICATION IS EXECUTED, CHOOSE A PORT TO EXPOSE
EXPOSE 9000
# HOW DO YOU EXPECT THE APPLICATION TO BE EXECUTED 
ENTRYPOINT [ "java", "-jar", "spring-build.jar" ]
