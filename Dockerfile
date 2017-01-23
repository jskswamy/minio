FROM golang:1.7-alpine

ENV WORKDIR /opt/minio

WORKDIR $WORKDIR
COPY . $WORKDIR

RUN apk add --no-cache git \
    && go-wrapper download \
    && go-wrapper install -ldflags "$(go run buildscripts/gen-ldflags.go)" \
    && mkdir -p /export/docker \
    && rm -rf /go/pkg /go/src \
    && apk del git

EXPOSE 9000
ENTRYPOINT ["./bin/docker-entrypoint.sh"]
VOLUME ["/export", "/config"]
