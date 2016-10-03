FROM debian:jessie-backports
MAINTAINER Alejandro Brito Monedero "abrito@alea-soluciones.com"
ENV BUILD_VERSION 2016-10-03-01
ENV USER_NAME sh

RUN groupadd --gid 1000 ${USER_NAME} \
    && useradd --uid 1000 \
       --home /home/${USER_NAME} \
       --gid 1000 \
       --create-home \
       --shell /bin/bash ${USER_NAME}

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yqq update \
    && apt-get -yqq install \
       vim \
       git \
       bash-completion \
    && rm -rf /var/lib/apt/lists/*

RUN sed -e '32,38s/^#//' -i /etc/bash.bashrc

user ${USER_NAME}
WORKDIR /home/${USER_NAME}

RUN git clone https://github.com/aleasoluciones/dotfiles.git

WORKDIR ./dotfiles

RUN ./setup.sh

RUN ln -s /data/.ssh /home/${USER_NAME}/.ssh

WORKDIR /data

VOLUME /data
