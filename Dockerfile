FROM golang:1.22.5-alpine

WORKDIR /AMA

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY . .

WORKDIR /AMA/cmd/journey

RUN go build -o /AMA/bin/AMA .

EXPOSE 8080
ENTRYPOINT [ "/AMA/bin/AMA" ]
