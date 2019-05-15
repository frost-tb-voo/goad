FROM golang:1.12.5-stretch

RUN apt-get update \
 && apt-get install -y zip alien \
 && apt-get autoclean -y \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt
ADD . /go/src/github.com/goadapp/goad
WORKDIR /go/src/github.com/goadapp/goad
RUN go get -u github.com/jteeuwen/go-bindata/...
RUN sed -i -e "s|sudo alien|alien|g" Makefile
RUN make linux-packages
RUN make all-zip

