# build stage
#FROM gradle:jdk21-alpine
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /usr/src/app/

COPY gradlew* settings.gradle* build.gradle .
COPY ./gradle ./gradle

RUN chmod +x ./gradlew
RUN ./gradlew
RUN ./gradlew downloadRepos

COPY . .
COPY ./pb ./proto
RUN chmod +x ./gradlew
RUN ./gradlew installDist -PprotoSourceDir=./proto

# app stage
FROM eclipse-temurin:21-jre-alpine
LABEL author="Siddhesh Nikam"
LABEL project="ecom_project"

WORKDIR /usr/src/app/
COPY --from=builder /usr/src/app/ .
ENV AD_PORT=8080
ENTRYPOINT [ "./build/install/opentelemetry-demo-ad/bin/Ad" ]
