FROM golang:1.18 AS builder

WORKDIR /app

COPY main.go .

RUN go env -w GO111MODULE=auto

RUN go build main.go

# Second stage
FROM scratch

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT [ "./main" ]