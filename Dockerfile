# Specify the base image
FROM alpine:latest

# apk = alpine package manager
# add = add package from git
RUN apk add --no-cache git make
RUN apk add --no-cache git musl-dev
RUN apk add --no-cache git go

# Configure Go
ENV GOROOT=/usr/lib/go
ENV GOPATH=/go
ENV PATH=/go/bin:$PATH

# create a src path for go-code
RUN mkdir -p ${GOPATH}/src
# create a bin path for building
RUN mkdir -p ${GOPATH}/bin

# Set the working directory to the src path
WORKDIR $GOPATH/src

# copy src from host to image
COPY /src/* .

# initialize go module to create the necessary go.mod file
RUN go mod init docker_go_sample
RUN go get github.com/labstack/echo/v4
RUN go get github.com/labstack/echo/v4/middleware@v4.13.3
RUN go build -o ../bin/docker_go_sample
RUN cd ../bin

# Expose port 3000 to the host
EXPOSE 3000

# Start the app and keep the container running
CMD ["docker_go_sample"]