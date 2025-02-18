FROM golang:1.17.2-alpine3.14 AS build
WORKDIR /usr/app
COPY . .
RUN go mod init hello-go-docker && \
    go mod tidy && \
    go build

FROM scratch
WORKDIR /usr/app
COPY --from=build /usr/app/hello-go-docker .
EXPOSE 8000
CMD [ "/usr/app/hello-go-docker" ]