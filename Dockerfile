FROM golang:1.22.0

WORKDIR /usr/src/app

COPY go.mod go.sum ./

RUN go mod tidy

COPY *.go ./

COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my-app

CMD ["/my-app"]