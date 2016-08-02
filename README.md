This image allows to forward ports from the docker container to specific hosts.

Ports to be forwarded are specified as arguments to the docker run command as `conatiner_port:dst_ip:dst_port[:protocol]'`. The protocol argument is optional and it defaults to `tcp`.

This image needs `--cap-add=NET_ADMIN` to work.

For example:

```
docker run -d --name port-forwarder \
    --cap-add=NET_ADMIN \
    -p 2222:22 \
    lgpasquale/port-forwarder \
    22:192.168.0.10:22
```
