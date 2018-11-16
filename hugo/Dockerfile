FROM golang:latest AS build

ENV CGO_ENABLED=0
ENV GOOS=linux

WORKDIR /src
RUN git clone https://github.com/gohugoio/hugo.git hugo
RUN cd /src/hugo && go install

FROM alpine:latest
WORKDIR /site
RUN apk --no-cache add ca-certificates py-pygments
COPY --from=0 /go/bin/hugo /usr/local/bin/hugo
ENTRYPOINT ["hugo"]
