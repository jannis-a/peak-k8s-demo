FROM golang:1.12-alpine3.9 AS builder
WORKDIR /go/src/github.com/jannis-a/peak-k8s-demo/frontend
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
COPY --from=builder /go/src/github.com/jannis-a/peak-k8s-demo/frontend/frontend .
CMD ["./frontend"]
