# Pyflame builder

This Dockerfile creates a container that will copy pyflame binary and dependencies to a directory.
[Uber pyflame](https://github.com/uber/pyflame)


* Build image (this compiles pyflame)
``` bash
docker build -t ${IMAGE_NAME} .
```

* Run container to copy binary and dependencies
```bash
docker run --rm -v $(pwd)/pyflame:/pyflame ${IMAGE_NAME}
```

* Copy files to destination host
```bash
scp -r pyflame ${DST_HOST}:
```

* Log into destination host and get a pyflame
```bash
cd pyflame
./ld-linux-x86-64.so.2 --library-path lib ./pyflame -o data.folded -t python ${SCRIPT}
# OR
./ld-linux-x86-64.so.2 --library-path lib ./pyflame -o data.folded -p ${PID}
```

* Then with [FlameGraph](https://github.com/brendangregg/FlameGraph) you copy the data.folded and process it like (you need to have flamegraph.pl)
```bash
./flamegraph.pl data.folded > data.svg
```
