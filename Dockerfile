FROM golang:1.16-alpine as builder

ENV GO111MODULE=on

WORKDIR /tmp/golang-image
COPY . .

RUN go mod tidy \
 && go build -o main src/main.go

FROM scratch
COPY --from=builder /tmp/golang-image /
ENTRYPOINT ["/main"]
