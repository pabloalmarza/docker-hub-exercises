docker stack deploy -c $1/docker-compose.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
while [ "`docker cp healthcheck.sh $(docker ps -q -f name=cfssl) != "healthy" ]; do sleep 0.1; done;
docker cp $1/healthcheck.sh $(docker ps -q -f name=cfssl):/usr/local/bin/docker-healthcheck.sh
docker commit $(docker ps -q -f name=cfssl) blackducksoftware/blackduck-cfssl:1.0.7
/bin/bash delete.sh
docker stack deploy -c $1/docker-compose.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
