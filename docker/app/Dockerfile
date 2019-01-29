FROM golang:1.11.5 as builder
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /go/src/github.com/ryo-h/sqlboiler-example
COPY . .
RUN make

# runtime image
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/ryo-h/sqlboiler-example/app.out /app.out
EXPOSE 8080
ENTRYPOINT ["/app.out"]