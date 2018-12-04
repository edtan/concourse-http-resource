FROM alpine:3.8

RUN apk update && apk add openssh-client bash jq curl \
    && mkdir -p /opt/resource

COPY . /opt/resource
