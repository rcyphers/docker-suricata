# docker-suricata
Docker image for Suricata IDS

Docker image inheritance:
 * debian:latest

## Volumes

The following are exported:

 * /var/log/suricata

## Ports

None

## Example usage

```
LOGDIR=/docker/suricata/volumes/logs
sudo mkdir -p $LOGDIR
docker run --name=suricata --net=host --privileged=true -e DEVICE=eth0 -v \
  $LOGDIR:/var/log/suricata -d rcyphers/suricata
```
