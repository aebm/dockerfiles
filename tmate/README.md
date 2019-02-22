# Container tmate instructions

* First build tmate container

```bash
docker build -t <IMAGE_NAME> .
```

* Create SSH keys and take note of the fingerprints

```bash
./create_keys.sh
```

* Run container

```bash
docker run --cap-add SYS_ADMIN  --rm -ti -v $(pwd)/keys:/keys:ro --network=host <IMAGE_NAME> tmate-slave -p <PORT>
```

* Configure your tmate client (don't forget to edit the fingerprints)

```bash
cp -i tmate.conf ~/.tmate.conf
```

* Run tmate

```bash
tmate
```

## In case you forgot to get the fingerprints

```bash
ssh-keygen -E MD5 -l -f keys/ssh_host_rsa_key.pub
ssh-keygen -E MD5 -l -f keys/ssh_host_ecdsa_key.pub
```
