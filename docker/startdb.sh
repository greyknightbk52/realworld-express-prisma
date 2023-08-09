#! /usr/bin/env bash
# https://blog.tericcabrel.com/mongodb-replica-set-docker-compose/

docker compose up -d

sleep 5

docker exec mongo1 /scripts/rs-init.sh
