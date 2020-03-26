FROM golang:1.11-alpine AS build

WORKDIR /src/
COPY dockerWeb.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/dockerWeb

FROM scratch
COPY --from=build /bin/dockerWeb /bin/dockerWeb
ENTRYPOINT ["/bin/dockerWeb"]
