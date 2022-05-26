#syntax=docker/dockerfile:1

# Sample contents of Dockerfile
FROM golang:1.18-alpine

WORKDIR /app

# Copy go.mod, go.sum
COPY go.mod ./

COPY go.sum ./

# Download necessary Go modules
RUN ["go", "mod", "download"]

# Copy all *.go files inside local Dockerfile directory
COPY *.go ./

# Build a static binary app named app
RUN ["go", "build", "-o", "my-app"]

# Inform a Docker the container's listening TCP port
EXPOSE 8080/tcp

# Execure Go binary app
CMD ["./my-app"]


