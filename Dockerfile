FROM openjdk:8u111-jre-alpine
MAINTAINER Jens Mittag <kontakt@jensmittag.de>

# Define build arguments: gitbucket version
ARG VERSION=4.8

# Create gitbucket data directory
RUN mkdir /data

# Download gitbucket release in specified version to /data directory. Before, we have to configure
# CA certificates / SSL of wget
RUN apk update &&\
    apk add ca-certificates wget &&\
    update-ca-certificates
RUN wget https://github.com/gitbucket/gitbucket/releases/download/$VERSION/gitbucket.war

# Define entry point incl. arguments
ENTRYPOINT ["java", "-jar", "gitbucket.war", "--gitbucket.home=/data"]
