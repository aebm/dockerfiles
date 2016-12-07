# Calibre

## To run

```bash
docker run --rm -ti \
       -e DISPLAY=${DISPLAY} \
       -e MY_GID=$(/usr/bin/id -g) \
       -e MY_GROUP=$(/usr/bin/id -gn) \
       -e MY_UID=$(/usr/bin/id -u) \
       -e MY_NAME=$(/usr/bin/id -un) \
       -v ${HOME}:${HOME} \
       -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
       <imagename>
```
