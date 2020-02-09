# Using multi stage docker build
# Stage - 1  Prepare the native image 

FROM quay.io/rhdevelopers/tutorial-tools:0.0.3 as build

# If you want to use nexus or any other maven repository manager then
# uncomment this to point to the repo manager
ENV MAVEN_MIRROR_URL http://nexus:8081/nexus/content/groups/public/

RUN mkdir -p /workspace/app

COPY src /workspace/app/src
COPY pom.xml /workspace/app

WORKDIR /workspace/app

RUN /usr/local/bin/run.sh 'mvn clean package -Pnative'

# Stage - 2 Prepare the deployable image
FROM registry.access.redhat.com/ubi8/ubi-minimal

WORKDIR /work/

COPY --from=build /workspace/app/target/*-runner /work/application

RUN chmod 775 /work

EXPOSE 8080

CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]