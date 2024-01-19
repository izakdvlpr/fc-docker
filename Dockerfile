FROM golang:1.13.8-alpine3.11 as build 

WORKDIR /usr/src/app

COPY main.go ./

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o ./main

FROM scratch

COPY --from=build /usr/src/app/main ./main

ENTRYPOINT ["./main"]