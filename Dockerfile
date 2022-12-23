# Full contents of Dockerfile
FROM ubuntu
LABEL description="samtools from base image ubuntu"
ARG ENV_NAME="samtools"
ARG VERSION="1.16.1"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    apt-get -y install libncurses5-dev libncursesw5-dev && \
    apt-get -y install zlib1g zlib1g-dev && \
    apt-get -y install bzip2 libbz2-dev && \
    apt-get -y install liblzma-dev && \
    apt-get -y install libhtscodecs2 && \
    apt-get -y install build-essential && \
    apt-get -y install wget && \
    rm -rf /var/lib/apt/lists/*

# need to get, configure and make samtools to have this docker work
RUN wget https://github.com/samtools/samtools/releases/download/${VERSION}/samtools-${VERSION}.tar.bz2 && \
    bzip2 -d samtools-${VERSION}.tar.bz2 && \
    tar xvf samtools-${VERSION}.tar && \
    cd samtools-${VERSION} && \
    ./configure && \
    make && \
    make install


