#!/bin/sh

/usr/sbin/addgroup -g ${MY_GID} ${MY_GROUP}
/usr/sbin/adduser -D -H -s /bin/sh -u ${MY_UID} -G ${MY_NAME} ${MY_NAME}

/bin/su -l ${MY_NAME} -c "/usr/local/bin/youtube-dl $*"
