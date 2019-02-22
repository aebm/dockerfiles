FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yqq update \
    && apt-get -yqq install \
       git-core \
       build-essential \
       pkg-config libtool \
       libevent-dev \
       libncurses-dev \
       zlib1g-dev \
       automake \
       libssh-dev \
       cmake \
       ruby \
       wget \
       locales \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/msgpack/msgpack-c/releases/download/cpp-1.3.0/msgpack-1.3.0.tar.gz \
    && tar -zxf msgpack-1.3.0.tar.gz \
    && cd msgpack-1.3.0 \
    && ./configure --prefix=/usr && make && make install \
    && cd ..

RUN git clone https://github.com/tmate-io/tmate-slave.git \
    && cd tmate-slave \
    && ./create_keys.sh \
    && ./autogen.sh \
    && ./configure \
    && make

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen
