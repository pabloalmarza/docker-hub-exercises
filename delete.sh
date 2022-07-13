
stack=hub-exercise
docker stack rm $stack
docker volume rm $(docker volume ls -q | grep $stack)
