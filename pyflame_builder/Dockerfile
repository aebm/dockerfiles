FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yqq update \
    && apt-get -yqq install \
       git \
       autoconf automake autotools-dev g++ pkg-config python-dev python3-dev libtool make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/src

RUN git clone "https://github.com/uber/pyflame.git"

WORKDIR pyflame

RUN ./autogen.sh \
    && ./configure \
    && make

CMD mkdir -p /pyflame/lib \
    && cp /usr/lib64/ld-linux-x86-64.so.2 /pyflame \
    && cp src/pyflame /pyflame \
    && cp utils/flame-chart-json /pyflame \
    && ldd src/pyflame | awk '/=>/ { print $3 }' | xargs -I '{}' cp '{}' /pyflame/lib

VOLUME /pyflame
