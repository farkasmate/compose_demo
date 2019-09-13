# BUILD
FROM maven:3.6-jdk-11-slim AS build

ARG REPO=https://github.com/Coveros/helloworld.git
ARG REF=master
ARG MVN_ARGS="clean package"

RUN apt-get update && apt-get install --no-install-recommends --assume-yes \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /build/
RUN git clone --depth 1 ${REPO} /build/ && git checkout ${REF}
RUN mvn ${MVN_ARGS}

# PACKAGE
FROM openjdk:11.0-jre

ENV JAVA_ARGS="com.coveros.demo.helloworld.HelloWorld"

COPY --from=build /build/target/*.jar /app/

WORKDIR /app/
EXPOSE 8080
CMD ["sh", "-c", "java -cp ./* ${JAVA_ARGS}"]
