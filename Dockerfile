FROM golang:latest AS fullcycle

WORKDIR /usr/app/src

COPY src/fullcycle.go .

RUN go build fullcycle.go

RUN rm fullcycle.go

FROM scratch

COPY --from=fullcycle /usr/app/src .

ENTRYPOINT [ "./fullcycle" ]