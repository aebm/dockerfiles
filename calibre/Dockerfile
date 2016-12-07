FROM python:2.7.12-slim

RUN /usr/bin/apt-get -yqq update \
    && /usr/bin/apt-get -yqq install \
        wget \
        xz-utils \
        xdg-utils \
    && /usr/bin/wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | /usr/local/bin/python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" \
    && /usr/bin/apt-get purge -yqq --auto-remove \
        wget \
        xz-utils \
    && /bin/rm -fr /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT /docker-entrypoint.sh
