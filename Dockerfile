FROM golang:1.23-alpine as builder

WORKDIR /app
COPY . .

RUN go build -o myapp

# Final image
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/myapp .

EXPOSE 8000
ENTRYPOINT [ "./myapp" ]