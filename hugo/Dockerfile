FROM golang:latest
RUN go get -v -d github.com/gohugoio/hugo
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /hugo github.com/gohugoio/hugo


FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app/
COPY --from=0 /hugo /usr/local/bin/hugo
CMD ["hugo"]
