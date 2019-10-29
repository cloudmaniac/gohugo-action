FROM alpine:latest

ENV HUGO_VERSION 0.59.0

LABEL "com.github.actions.name"="GoHugo CLI Action"
LABEL "com.github.actions.description"="Hugo CLI as a GitHub action"
LABEL "com.github.actions.icon"="blue"
LABEL "com.github.actions.color"="gray-dark"

LABEL repository="https://github.com/cloudmaniac/gohugo-action"
LABEL homepage="https://cloudmaniac.net"
LABEL maintainer="Romain Decker <romain@cloudmaniac.net>"

LABEL version="1.${HUGO_VERSION}"

RUN apk update && \
    apk add --no-cache && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_checksums.txt && \
    grep hugo_${HUGO_VERSION}_Linux-64bit.tar.gz hugo_${HUGO_VERSION}_checksums.txt | sha256sum -c && \
    tar xvf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv ./hugo /usr/bin && \
    chmod +x /usr/bin/hugo && \
    rm -rf hugo_*

ENTRYPOINT ["/entrypoint.sh"]
