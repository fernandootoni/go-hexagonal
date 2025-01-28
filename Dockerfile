FROM golang:1.16

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

RUN go get -u github.com/spf13/cobra@latest && \
    go install github.com/golang/mock/mockgen@v1.5.0 && \
    go install github.com/spf13/cobra-cli@latest

RUN apt-get update && apt-get install sqlite3 -y

RUN usermod -u 1000 www-data
RUN mkdir -p /var/www/.cache
RUN chown -R www-data:www-data /go
RUN chown -R www-data:www-data /var/www/.cache
USER www-data
RUN apt-get update && apt-get install -y wget
RUN wget https://dl.google.com/go/go1.17.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"


CMD ["tail", "-f", "/dev/null"]