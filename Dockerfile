FROM ubuntu

LABEL org.opencontainers.image.authors="quintana.thomas@gmail.com"

RUN set -e; \
    # Install dependencies.
    apt update; \
    apt upgrade -y; \
    apt install -y build-essential curl git-core htop make unzip; \
    # Install Go.
    cd /tmp; \
    curl -L -O https://go.dev/dl/go1.17.7.linux-arm64.tar.gz; \
    echo "a5aa1ed17d45ee1d58b4a4099b12f8942acbd1dd09b2e9a6abb1c4898043c5f5 go1.17.7.linux-arm64.tar.gz" | sha256sum --check --status; \
    if [ ! $? -eq 0 ]; then \
        echo "The Go archive is invalid."; \
        exit 1; \
    fi; \
    tar xzf go1.17.7.linux-arm64.tar.gz; \
    mv go /opt/go; \
    rm go1.17.7.linux-arm64.tar.gz; \
    export GO_HOME=/opt/go; \
    export PATH=$PATH:$GO_HOME/bin; \
    # Install Geth.
    git clone https://github.com/ethereum/go-ethereum.git; \
    cd go-ethereum; \
    git checkout tags/v1.10.16; \
    make all; \
    cp /tmp/go-ethereum/build/bin/* /usr/bin/;

ENV GO_HOME=/opt/go
ENV PATH=$PATH:$GO_HOME/bin
