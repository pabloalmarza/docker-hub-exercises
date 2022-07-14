rm cfssl.tar
docker stack deploy -c $1/docker-compose.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
while ! $(docker inspect -f {{.State.Running}} $(docker ps -q -f name=cfssl)) ; do sleep 0.1; done;
docker cp $1/healthcheck.sh $(docker ps -q -f name=cfssl):/usr/local/bin/docker-healthcheck.sh
docker commit $(docker ps -q -f name=cfssl) blackducksoftware/blackduck-cfssl:1.0.7.1
stack=hub-exercise
echo "Deleting stack $stack"
docker stack rm $stack
while [[ $(docker ps | grep hub-exercise | wc -l) != "0" ]] ;
do
 echo $(docker ps | grep hub-exercise | wc -l) "Containers still active"
 sleep 4;
done

sleep 3
docker volume rm $(docker volume ls -q | grep $stack)
docker stack deploy -c $1/docker-compose_2.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
