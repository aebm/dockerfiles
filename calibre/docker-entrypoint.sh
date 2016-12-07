#!/bin/sh

/usr/sbin/groupadd --gid ${MY_GID} ${MY_GROUP}
/usr/sbin/useradd -M -s /usr/bin/calibre --uid ${MY_UID} --gid ${MY_GID} ${MY_NAME}

/bin/su --login ${MY_NAME}
