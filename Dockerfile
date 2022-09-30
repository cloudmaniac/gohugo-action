# Container image that runs the code
# Alpine stopped providing the Python package starting in 3.12
FROM alpine:3.11.8

ENV HUGO_VERSION 0.104.2

LABEL repository="https://github.com/cloudmaniac/gohugo-action"
LABEL homepage="https://cloudmaniac.net"
LABEL maintainer="Romain Decker <romain@cloudmaniac.net>"

LABEL "com.github.actions.name"="GoHugo CLI Action"
LABEL "com.github.actions.description"="Hugo CLI as a GitHub action"
LABEL "com.github.actions.icon"="blue"
LABEL "com.github.actions.color"="gray-dark"

# Download and install Hugo 
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_checksums.txt && \
    grep hugo_${HUGO_VERSION}_Linux-64bit.tar.gz hugo_${HUGO_VERSION}_checksums.txt | sha256sum -c && \
    tar xvf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv ./hugo /usr/bin && \
    chmod +x /usr/bin/hugo && \
    rm -rf hugo_*

# Install AWS CLI (required for 'hugo deploy' to AWS S3)
RUN apk -v --update add \
        python \
        py-pip \
        && \
    pip install --upgrade awscli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
