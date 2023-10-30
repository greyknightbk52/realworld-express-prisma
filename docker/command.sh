docker compose up -d
docker network ls
docker network inspect docker_mongors-network | grep IPv4Address
docker exec -it mongo1 /bin/bash

# in docker container mongo1 as primary member
apt-get update
apt-get install -y vim
vim /scripts/rs-init.sh
# update IPs of members at replica set config according to IPs of mongodb containers allocated by docker
/scripts/rs-init.sh
