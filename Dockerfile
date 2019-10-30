FROM golang:latest

ENV HUGO_VERSION 0.59.0

LABEL "com.github.actions.name"="GoHugo CLI Action"
LABEL "com.github.actions.description"="Hugo CLI as a GitHub action"
LABEL "com.github.actions.icon"="blue"
LABEL "com.github.actions.color"="gray-dark"

LABEL repository="https://github.com/cloudmaniac/gohugo-action"
LABEL homepage="https://cloudmaniac.net"
LABEL maintainer="Romain Decker <romain@cloudmaniac.net>"

LABEL version="1.${HUGO_VERSION}"

RUN apt-get update

RUN go get github.com/gohugoio/hugo

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
