# docker-dell-omsa7

Run Dell idracadm7 commands from non-supported distributions or without polluting the local server with iDrac software.

All commands test use the remote target ip of the iDRAC controller. Local commands are untested but require mounting things like /dev/mem
`-v /dev/mem:/dev/mem`

# Examples

## Get Help
```
docker run --rm -it docker-dell-omsa7:latest dell-omsa7 \
  /opt/dell/srvadmin/bin/idracadm7 \
  -r <remote ip> \
  -u <remote user> \
  -p "<remote pw>" help
```

## Install Letsencrypt Certs
### Private Key
```
DOMAIN=example.com
# Install privkey

docker run --rm \
  -v /etc/letsencrypt:/etc/letsencrypt:z \
  -it docker-dell-omsa7:latest omsa7 \
  /opt/dell/srvadmin/bin/idracadm7 -r <remote ip> \
  -u <remote user> \
  -p "<remote password>" \
  sslkeyupload -t 1 -f /etc/letsencrypt/live/${DOMAIN}/privkey.pem
```

### Full chain Cert
```  
DOMAIN=example.com
# Install cert

docker run --rm \
  -v /etc/letsencrypt:/etc/letsencrypt:z \
  -it docker-dell-omsa7:latest omsa7 \
  /opt/dell/srvadmin/bin/idracadm7 -r <remote ip> \
  -u <remote user> \
  -p "<remote password>" \
  sslcertupload -t 1 -f /etc/letsencrypt/live/${DOMAIN}/fullchain.pem
```
