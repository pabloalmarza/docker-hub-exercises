docker stack deploy -c docker-compose.yml -c docker-compose.local-overrides.yml -c 10sph.yaml hub-exercise
docker inspect -f {{.State.Health.Status}} $(docker ps -q -f name=cfssl)
while [ "`docker cp healthcheck.sh $(docker ps -q -f name=cfssl):/usr/local/bin/docker-healthcheck.sh != "healthy" ]; do sleep 0.1; done;
docker cp healthcheck.sh $(docker ps -q -f name=cfssl):/usr/local/bin/docker-healthcheck.sh
docker commit $(docker ps -q -f name=cfssl) blackducksoftware/blackduck-cfssl:1.0.7
/bin/bash ../delete.sh
docker stack deploy -c docker-compose.yml -c docker-compose.local-overrides.yml -c 10sph.yaml hub-exercise
